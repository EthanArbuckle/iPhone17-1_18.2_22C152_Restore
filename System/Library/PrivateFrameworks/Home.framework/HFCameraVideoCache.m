@interface HFCameraVideoCache
- (BOOL)_queueVideoDownloadForClip:(id)a3 priority:(int64_t)a4;
- (BOOL)diskCache:(id)a3 shouldAddExistingFileToCache:(id)a4;
- (HFCameraVideoCache)initWithVideoDownloader:(id)a3;
- (HFCameraVideoCacheDelegate)delegate;
- (HFCameraVideoDownloader)videoDownloader;
- (HFDiskCache)diskCache;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)workQueue;
- (double)_cacheDurationLimit;
- (double)_expensiveNetworkCacheDurationLimit;
- (double)cacheDurationLimit;
- (double)expensiveNetworkCacheDurationLimit;
- (id)_delegate;
- (id)_existingDownloadOperationForClip:(id)a3;
- (unint64_t)diskCacheLimit;
- (void)_cacheClip:(id)a3;
- (void)_cacheClip:(id)a3 inClips:(id)a4;
- (void)_gloablNotifyDidAddVideoForClip:(id)a3;
- (void)_limitDiskCacheToPercentageofAvailableDiskSpace:(unint64_t)a3;
- (void)_notifyVideoExistsForClip:(id)a3 atURL:(id)a4;
- (void)_setCacheDurationLimit:(double)a3;
- (void)_setDelegate:(id)a3;
- (void)cacheClip:(id)a3;
- (void)cacheClip:(id)a3 inClips:(id)a4;
- (void)dealloc;
- (void)didDownloadVideoFileForClip:(id)a3 toURL:(id)a4;
- (void)diskCache:(id)a3 didEvictFileFromDisk:(id)a4 forUniqueIdentifier:(id)a5;
- (void)foundVideoFileForClip:(id)a3 atURL:(id)a4;
- (void)limitDiskCacheToPercentageofAvailableDiskSpace:(unint64_t)a3;
- (void)networkDidBecomeExpensive:(id)a3;
- (void)setCacheDurationLimit:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDiskCacheLimit:(unint64_t)a3;
- (void)waitForOperations;
@end

@implementation HFCameraVideoCache

- (HFCameraVideoCache)initWithVideoDownloader:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HFCameraVideoCache;
  v6 = [(HFCameraVideoCache *)&v24 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_videoDownloader, a3);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.Home.HFCameraVideoCache.workQueue", v8);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v9;

    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v11;

    [(NSOperationQueue *)v7->_operationQueue setMaxConcurrentOperationCount:5];
    v13 = +[HFCameraUtilities overrideVideoCacheDurationLimit];
    v14 = v13;
    if (v13) {
      [v13 doubleValue];
    }
    else {
      double v15 = 120.0;
    }
    v7->_cacheDurationLimit = v15;
    v7->_expensiveNetworkCacheDurationLimit = (double)((int)(v15 * 0.5) & ~((int)(v15 * 0.5) >> 31));
    v16 = [HFDiskCache alloc];
    v17 = +[HFCameraUtilities videoCachesDirectoryURL];
    uint64_t v18 = [(HFDiskCache *)v16 initWithCacheDirectoryURL:v17 diskCacheDelegate:v7];
    diskCache = v7->_diskCache;
    v7->_diskCache = (HFDiskCache *)v18;

    v20 = +[HFCameraUtilities overrideVideoDiskCacheLimit];
    v21 = v20;
    if (v20)
    {
      -[HFCache setTotalCostLimit:](v7->_diskCache, "setTotalCostLimit:", [v20 unsignedLongValue]);
    }
    else
    {
      [(HFCache *)v7->_diskCache setTotalCostLimit:150000000];
      [(HFCameraVideoCache *)v7 limitDiskCacheToPercentageofAvailableDiskSpace:25];
    }
    v22 = +[HFNetworkMonitor sharedInstance];
    [v22 addObserver:v7];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[HFNetworkMonitor sharedInstance];
  [v3 removeObserver:self];

  [(HFCameraVideoCache *)self waitForOperations];
  v4.receiver = self;
  v4.super_class = (Class)HFCameraVideoCache;
  [(HFCameraVideoCache *)&v4 dealloc];
}

- (void)waitForOperations
{
  if (+[HFUtilities isInternalTest])
  {
    id v3 = [(HFCameraVideoCache *)self operationQueue];
    [v3 waitUntilAllOperationsAreFinished];
  }
}

- (void)cacheClip:(id)a3 inClips:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HFCameraVideoCache *)self workQueue];
  dispatch_assert_queue_not_V2(v8);

  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraVideoCache *)self _cacheClip:v6 inClips:v7];
  }
  else
  {
    dispatch_queue_t v9 = [(HFCameraVideoCache *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__HFCameraVideoCache_cacheClip_inClips___block_invoke;
    block[3] = &unk_26408D388;
    block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(v9, block);
  }
}

uint64_t __40__HFCameraVideoCache_cacheClip_inClips___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cacheClip:*(void *)(a1 + 40) inClips:*(void *)(a1 + 48)];
}

- (void)_cacheClip:(id)a3 inClips:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!+[HFUtilities isInternalTest])
  {
    dispatch_queue_t v9 = [(HFCameraVideoCache *)self workQueue];
    dispatch_assert_queue_V2(v9);
  }
  if (!v7)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HFCameraVideoCache.m", 116, @"Invalid parameter not satisfying: %@", @"primaryClip != nil" object file lineNumber description];
  }
  if (![v8 count])
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HFCameraVideoCache.m", 117, @"Invalid parameter not satisfying: %@", @"clips.count > 0" object file lineNumber description];
  }
  uint64_t v10 = [v8 indexOfObject:v7];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v15 = [MEMORY[0x263F08690] currentHandler];
    v16 = objc_msgSend(v7, "hf_prettyDescription");
    v17 = objc_msgSend(v8, "hf_prettyDescription");
    [v15 handleFailureInMethod:a2, self, @"HFCameraVideoCache.m", 120, @"clip: %@ is not in clips: %@", v16, v17 object file lineNumber description];
  }
  id v11 = [(HFCameraVideoCache *)self operationQueue];
  id v12 = [v11 operations];
  objc_msgSend(v12, "na_each:", &__block_literal_global_39);

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __41__HFCameraVideoCache__cacheClip_inClips___block_invoke_2;
  v18[3] = &unk_26408FDC0;
  v18[4] = self;
  v18[5] = v19;
  v18[6] = v10;
  objc_msgSend(v8, "hf_fanOutAtIndex:usingBlock:", v10, v18);
  _Block_object_dispose(v19, 8);
}

uint64_t __41__HFCameraVideoCache__cacheClip_inClips___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setQualityOfService:-8];
}

void __41__HFCameraVideoCache__cacheClip_inClips___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v7 = a2;
  if ([v7 isComplete])
  {
    id v8 = [*(id *)(a1 + 32) diskCache];
    dispatch_queue_t v9 = [v7 uniqueIdentifier];
    uint64_t v10 = [v8 objectForKey:v9];

    if (v10)
    {
      [v7 duration];
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                              + 24);
      id v12 = HFLogForCategory(0xDuLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_msgSend(v7, "hf_prettyDescription");
        v14 = [v10 path];
        int v37 = 138412546;
        v38 = v13;
        __int16 v39 = 2112;
        v40 = v14;
        _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "[SKIPPED] video exists; clip: %@; path: %@",
          (uint8_t *)&v37,
          0x16u);
      }
      [*(id *)(a1 + 32) _notifyVideoExistsForClip:v7 atURL:v10];
      goto LABEL_36;
    }
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = -4;
    if (v16 + 1 == a3) {
      uint64_t v17 = 0;
    }
    if (v16 - 1 == a3) {
      uint64_t v18 = 4;
    }
    else {
      uint64_t v18 = v17;
    }
    if (v16 == a3) {
      uint64_t v19 = 8;
    }
    else {
      uint64_t v19 = v18;
    }
    v20 = [*(id *)(a1 + 32) _existingDownloadOperationForClip:v7];
    if (v20)
    {
      v21 = HFLogForCategory(0xDuLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_msgSend(v7, "hf_prettyDescription");
        int v37 = 138412290;
        v38 = v22;
        _os_log_impl(&dword_20B986000, v21, OS_LOG_TYPE_DEFAULT, "[SKIPPED] download operation exists; clip: %@",
          (uint8_t *)&v37,
          0xCu);
      }
      [v20 setQueuePriority:v19];
      goto LABEL_29;
    }
    v23 = +[HFNetworkMonitor sharedInstance];
    int v24 = [v23 isNetworkExpensive];
    v25 = *(void **)(a1 + 32);
    if (v24) {
      [v25 _expensiveNetworkCacheDurationLimit];
    }
    else {
      [v25 _cacheDurationLimit];
    }
    double v27 = v26;

    double v28 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    [v7 duration];
    double v30 = v28 + v29;
    BOOL v31 = v30 <= v27;
    double v32 = vabdd_f64(v30, v27);
    BOOL v33 = v31 || v32 < 2.22044605e-16;
    if (v33 || (double v32 = fabs(*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)), v32 < 2.22044605e-16))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "_queueVideoDownloadForClip:priority:", v7, v19, v32))
      {
LABEL_29:
        [v7 duration];
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v34
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                                + 24);
LABEL_35:

        uint64_t v10 = 0;
        goto LABEL_36;
      }
    }
    else
    {
      v35 = HFLogForCategory(0xDuLL);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = objc_msgSend(v7, "hf_prettyDescription");
        int v37 = 138412290;
        v38 = v36;
        _os_log_impl(&dword_20B986000, v35, OS_LOG_TYPE_DEFAULT, "[SKIPPED] clip duration takes us over the limit; clip: %@",
          (uint8_t *)&v37,
          0xCu);
      }
    }
    *a4 = 1;
    goto LABEL_35;
  }
  uint64_t v10 = HFLogForCategory(0xDuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = objc_msgSend(v7, "hf_prettyDescription");
    int v37 = 138412290;
    v38 = v15;
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "[SKIPPED] incomplete clip: %@", (uint8_t *)&v37, 0xCu);
  }
LABEL_36:
}

- (void)cacheClip:(id)a3
{
  id v4 = a3;
  id v5 = [(HFCameraVideoCache *)self workQueue];
  dispatch_assert_queue_not_V2(v5);

  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraVideoCache *)self _cacheClip:v4];
  }
  else
  {
    id v6 = [(HFCameraVideoCache *)self workQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __32__HFCameraVideoCache_cacheClip___block_invoke;
    v7[3] = &unk_26408D450;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

uint64_t __32__HFCameraVideoCache_cacheClip___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cacheClip:*(void *)(a1 + 40)];
}

- (void)_cacheClip:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!+[HFUtilities isInternalTest])
  {
    id v6 = [(HFCameraVideoCache *)self workQueue];
    dispatch_assert_queue_V2(v6);
  }
  if (!v5)
  {
    uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HFCameraVideoCache.m", 207, @"Invalid parameter not satisfying: %@", @"clip != nil" object file lineNumber description];
  }
  if ([v5 isComplete])
  {
    id v7 = [(HFCameraVideoCache *)self diskCache];
    id v8 = [v5 uniqueIdentifier];
    dispatch_queue_t v9 = [v7 objectForKey:v8];

    if (v9)
    {
      uint64_t v10 = HFLogForCategory(0xDuLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        double v11 = objc_msgSend(v5, "hf_prettyDescription");
        id v12 = [v9 path];
        *(_DWORD *)buf = 138412546;
        uint64_t v19 = v11;
        __int16 v20 = 2112;
        v21 = v12;
        _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "[SKIPPED] video exists; clip: %@; path: %@",
          buf,
          0x16u);
      }
      [(HFCameraVideoCache *)self _notifyVideoExistsForClip:v5 atURL:v9];
    }
    else
    {
      v14 = [(HFCameraVideoCache *)self _existingDownloadOperationForClip:v5];
      if (v14)
      {
        double v15 = HFLogForCategory(0xDuLL);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = objc_msgSend(v5, "hf_prettyDescription");
          *(_DWORD *)buf = 138412290;
          uint64_t v19 = v16;
          _os_log_impl(&dword_20B986000, v15, OS_LOG_TYPE_DEFAULT, "[SKIPPED] download operation exists; clip: %@",
            buf,
            0xCu);
        }
        [v14 setQueuePriority:8];
      }
      else
      {
        [(HFCameraVideoCache *)self _queueVideoDownloadForClip:v5 priority:4];
      }

      dispatch_queue_t v9 = 0;
    }
  }
  else
  {
    dispatch_queue_t v9 = HFLogForCategory(0xDuLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v5, "hf_prettyDescription");
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v13;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "[SKIPPED] incomplete clip: %@", buf, 0xCu);
    }
  }
}

- (id)_existingDownloadOperationForClip:(id)a3
{
  id v4 = a3;
  id v5 = [(HFCameraVideoCache *)self operationQueue];
  id v6 = [v5 operations];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__HFCameraVideoCache__existingDownloadOperationForClip___block_invoke;
  v10[3] = &unk_26408FDE8;
  id v11 = v4;
  id v7 = v4;
  id v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v10);

  return v8;
}

uint64_t __56__HFCameraVideoCache__existingDownloadOperationForClip___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 clip];
  id v4 = [v3 uniqueIdentifier];
  id v5 = [*(id *)(a1 + 32) uniqueIdentifier];
  uint64_t v6 = objc_msgSend(v4, "hmf_isEqualToUUID:", v5);

  return v6;
}

- (BOOL)_queueVideoDownloadForClip:(id)a3 priority:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "hf_size");
  id v8 = [(HFCameraVideoCache *)self diskCache];
  char v9 = [v8 canAccommodateCost:v7];

  if (v9)
  {
    uint64_t v10 = [(HFCameraVideoCache *)self diskCache];
    [v10 removeObjectsToAccommodateCost:v7];

    id v11 = [(HFCameraVideoCache *)self videoDownloader];
    id v12 = [v11 downloadOperationForClip:v6];

    [v12 setQueuePriority:a4];
    [v12 setDelegate:self];
    v13 = HFLogForCategory(0xDuLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v6, "hf_prettyDescription");
      double v15 = [v12 destinationURL];
      uint64_t v16 = [v15 path];
      int v19 = 138412546;
      __int16 v20 = v14;
      __int16 v21 = 2112;
      uint64_t v22 = v16;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "[QUEUED] download operation for clip: %@; destination: %@",
        (uint8_t *)&v19,
        0x16u);
    }
    uint64_t v17 = [(HFCameraVideoCache *)self operationQueue];
    [v17 addOperation:v12];
    goto LABEL_7;
  }
  id v12 = HFLogForCategory(0xDuLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = objc_msgSend(v6, "hf_prettyDescription");
    int v19 = 138412290;
    __int16 v20 = v17;
    _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "[SKIPPED] disk cache cannot accommodate clip size: %@", (uint8_t *)&v19, 0xCu);
LABEL_7:
  }
  return v9;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(HFCameraVideoCache *)self workQueue];
  dispatch_assert_queue_not_V2(v5);

  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraVideoCache *)self _setDelegate:v4];
  }
  else
  {
    id v6 = [(HFCameraVideoCache *)self workQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__HFCameraVideoCache_setDelegate___block_invoke;
    v7[3] = &unk_26408D450;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v6, v7);
  }
}

uint64_t __34__HFCameraVideoCache_setDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDelegate:*(void *)(a1 + 40)];
}

- (void)_setDelegate:(id)a3
{
  id v8 = a3;
  if (!+[HFUtilities isInternalTest])
  {
    id v5 = [(HFCameraVideoCache *)self workQueue];
    dispatch_assert_queue_V2(v5);
  }
  delegate = self->_delegate;
  p_delegate = &self->_delegate;
  if (([(HFCameraVideoCacheDelegate *)delegate isEqual:v8] & 1) == 0) {
    objc_storeStrong((id *)p_delegate, a3);
  }
}

- (HFCameraVideoCacheDelegate)delegate
{
  id v3 = [(HFCameraVideoCache *)self workQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__7;
  id v12 = __Block_byref_object_dispose__7;
  id v13 = 0;
  id v4 = [(HFCameraVideoCache *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __30__HFCameraVideoCache_delegate__block_invoke;
  v7[3] = &unk_26408FE10;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (HFCameraVideoCacheDelegate *)v5;
}

uint64_t __30__HFCameraVideoCache_delegate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _delegate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)_delegate
{
  if (!+[HFUtilities isInternalTest])
  {
    uint64_t v3 = [(HFCameraVideoCache *)self workQueue];
    dispatch_assert_queue_V2(v3);
  }
  delegate = self->_delegate;
  return delegate;
}

- (void)setDiskCacheLimit:(unint64_t)a3
{
  id v4 = [(HFCameraVideoCache *)self diskCache];
  [v4 setTotalCostLimit:a3];
}

- (unint64_t)diskCacheLimit
{
  uint64_t v3 = [(HFCameraVideoCache *)self workQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v4 = [(HFCameraVideoCache *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__HFCameraVideoCache_diskCacheLimit__block_invoke;
  v7[3] = &unk_26408FE10;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v4, v7);

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __36__HFCameraVideoCache_diskCacheLimit__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) diskCache];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 totalCostLimit];
}

- (void)setCacheDurationLimit:(double)a3
{
  unint64_t v5 = [(HFCameraVideoCache *)self workQueue];
  dispatch_assert_queue_not_V2(v5);

  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraVideoCache *)self _setCacheDurationLimit:a3];
  }
  else
  {
    id v6 = [(HFCameraVideoCache *)self workQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__HFCameraVideoCache_setCacheDurationLimit___block_invoke;
    v7[3] = &unk_26408FE38;
    v7[4] = self;
    *(double *)&void v7[5] = a3;
    dispatch_async(v6, v7);
  }
}

uint64_t __44__HFCameraVideoCache_setCacheDurationLimit___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCacheDurationLimit:*(double *)(a1 + 40)];
}

- (void)_setCacheDurationLimit:(double)a3
{
  if (!+[HFUtilities isInternalTest])
  {
    unint64_t v5 = [(HFCameraVideoCache *)self workQueue];
    dispatch_assert_queue_V2(v5);
  }
  if (vabdd_f64(self->_cacheDurationLimit, a3) >= 2.22044605e-16)
  {
    self->_cacheDurationLimit = a3;
    self->_expensiveNetworkCacheDurationLimit = (double)((int)(a3 * 0.5) & ~((int)(a3 * 0.5) >> 31));
  }
}

- (double)cacheDurationLimit
{
  uint64_t v3 = [(HFCameraVideoCache *)self workQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  char v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v4 = [(HFCameraVideoCache *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__HFCameraVideoCache_cacheDurationLimit__block_invoke;
  v7[3] = &unk_26408FE10;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v4, v7);

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __40__HFCameraVideoCache_cacheDurationLimit__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _cacheDurationLimit];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)_cacheDurationLimit
{
  if (!+[HFUtilities isInternalTest])
  {
    uint64_t v3 = [(HFCameraVideoCache *)self workQueue];
    dispatch_assert_queue_V2(v3);
  }
  return self->_cacheDurationLimit;
}

- (double)expensiveNetworkCacheDurationLimit
{
  uint64_t v3 = [(HFCameraVideoCache *)self workQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  char v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v4 = [(HFCameraVideoCache *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HFCameraVideoCache_expensiveNetworkCacheDurationLimit__block_invoke;
  v7[3] = &unk_26408FE10;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(v4, v7);

  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __56__HFCameraVideoCache_expensiveNetworkCacheDurationLimit__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _expensiveNetworkCacheDurationLimit];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)_expensiveNetworkCacheDurationLimit
{
  if (!+[HFUtilities isInternalTest])
  {
    uint64_t v3 = [(HFCameraVideoCache *)self workQueue];
    dispatch_assert_queue_V2(v3);
  }
  return self->_expensiveNetworkCacheDurationLimit;
}

- (void)limitDiskCacheToPercentageofAvailableDiskSpace:(unint64_t)a3
{
  double v5 = [(HFCameraVideoCache *)self workQueue];
  dispatch_assert_queue_not_V2(v5);

  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraVideoCache *)self _limitDiskCacheToPercentageofAvailableDiskSpace:a3];
  }
  else
  {
    id v6 = [(HFCameraVideoCache *)self workQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __69__HFCameraVideoCache_limitDiskCacheToPercentageofAvailableDiskSpace___block_invoke;
    v7[3] = &unk_26408FE38;
    v7[4] = self;
    void v7[5] = a3;
    dispatch_async(v6, v7);
  }
}

uint64_t __69__HFCameraVideoCache_limitDiskCacheToPercentageofAvailableDiskSpace___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _limitDiskCacheToPercentageofAvailableDiskSpace:*(void *)(a1 + 40)];
}

- (void)_limitDiskCacheToPercentageofAvailableDiskSpace:(unint64_t)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (!+[HFUtilities isInternalTest])
  {
    id v6 = [(HFCameraVideoCache *)self workQueue];
    dispatch_assert_queue_V2(v6);
  }
  if (a3 >= 0x65)
  {
    __int16 v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HFCameraVideoCache.m", 425, @"Invalid parameter not satisfying: %@", @"percentageOfAvailableDiskSpace <= 100" object file lineNumber description];
  }
  uint64_t v7 = +[HFCameraUtilities videoCachesDirectoryURL];
  id v22 = 0;
  uint64_t v8 = *MEMORY[0x263EFF850];
  id v21 = 0;
  int v9 = [v7 getResourceValue:&v22 forKey:v8 error:&v21];
  id v10 = v22;
  id v11 = v21;

  if (!v9)
  {
    uint64_t v17 = HFLogForCategory(0xDuLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v24 = "-[HFCameraVideoCache _limitDiskCacheToPercentageofAvailableDiskSpace:]";
      __int16 v25 = 2112;
      id v26 = v11;
      _os_log_error_impl(&dword_20B986000, v17, OS_LOG_TYPE_ERROR, "%s %@", buf, 0x16u);
    }
    goto LABEL_11;
  }
  [v10 doubleValue];
  unint64_t v13 = vcvtmd_u64_f64((double)a3 / 100.0 * v12);
  v14 = [(HFCameraVideoCache *)self diskCache];
  unint64_t v15 = [v14 totalCostLimit];

  if (v15 > v13)
  {
    uint64_t v16 = [(HFCameraVideoCache *)self diskCache];
    [v16 setTotalCostLimit:v13];

    uint64_t v17 = HFLogForCategory(0xDuLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = [NSNumber numberWithUnsignedInteger:v13];
      int v19 = [NSNumber numberWithUnsignedInteger:a3];
      *(_DWORD *)buf = 136315906;
      int v24 = "-[HFCameraVideoCache _limitDiskCacheToPercentageofAvailableDiskSpace:]";
      __int16 v25 = 2112;
      id v26 = v18;
      __int16 v27 = 2112;
      double v28 = v19;
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl(&dword_20B986000, v17, OS_LOG_TYPE_DEFAULT, "%s diskCacheLimit: %@ (%@%% of %@ available)", buf, 0x2Au);
    }
LABEL_11:
  }
}

- (void)_notifyVideoExistsForClip:(id)a3 atURL:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(HFCameraVideoCache *)self _delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    int v9 = [(HFCameraVideoCache *)self _delegate];
    [v9 videoCache:self didLocateVideoFileAtURL:v6 forClip:v10];
  }
  [(HFCameraVideoCache *)self _gloablNotifyDidAddVideoForClip:v10];
}

- (void)_gloablNotifyDidAddVideoForClip:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[HFCameraUtilities markCachedVideoAsGreenInTimeline])
  {
    double v5 = [MEMORY[0x263F08A00] defaultCenter];
    id v6 = HFCameraVideoCacheDidAddVideoDebugNotification;
    int v9 = @"uniqueIdentifier";
    uint64_t v7 = [v4 uniqueIdentifier];
    v10[0] = v7;
    char v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v5 postNotificationName:v6 object:self userInfo:v8];
  }
}

- (void)didDownloadVideoFileForClip:(id)a3 toURL:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = HFLogForCategory(0xDuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v7 path];
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "[FILE DOWNLOADED] clip: %@; path: %@",
      (uint8_t *)&v14,
      0x16u);
  }
  id v10 = [(HFCameraVideoCache *)self diskCache];
  uint64_t v11 = [v6 uniqueIdentifier];
  objc_msgSend(v10, "setObject:forKey:cost:", v7, v11, objc_msgSend(v6, "hf_size"));

  double v12 = [(HFCameraVideoCache *)self delegate];
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if (v11)
  {
    unint64_t v13 = [(HFCameraVideoCache *)self delegate];
    [v13 videoCache:self didDownloadVideoFileAtURL:v7 forClip:v6];
  }
  [(HFCameraVideoCache *)self _gloablNotifyDidAddVideoForClip:v6];
}

- (void)foundVideoFileForClip:(id)a3 atURL:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = HFLogForCategory(0xDuLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v7 path];
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "[FILE EXISTS] clip: %@; path: %@", (uint8_t *)&v14, 0x16u);
  }
  id v10 = [(HFCameraVideoCache *)self diskCache];
  uint64_t v11 = [v6 uniqueIdentifier];
  objc_msgSend(v10, "setObject:forKey:cost:", v7, v11, objc_msgSend(v6, "hf_size"));

  double v12 = [(HFCameraVideoCache *)self delegate];
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if (v11)
  {
    unint64_t v13 = [(HFCameraVideoCache *)self delegate];
    [v13 videoCache:self didLocateVideoFileAtURL:v7 forClip:v6];
  }
  [(HFCameraVideoCache *)self _gloablNotifyDidAddVideoForClip:v6];
}

- (void)networkDidBecomeExpensive:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = HFLogForCategory(0xDuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[HFCameraVideoCache networkDidBecomeExpensive:]";
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%s: cancelling all in-flight operations", (uint8_t *)&v6, 0xCu);
  }

  double v5 = [(HFCameraVideoCache *)self operationQueue];
  [v5 cancelAllOperations];
}

- (void)diskCache:(id)a3 didEvictFileFromDisk:(id)a4 forUniqueIdentifier:(id)a5
{
  v11[1] = *MEMORY[0x263EF8340];
  id v6 = a5;
  if (+[HFCameraUtilities markCachedVideoAsGreenInTimeline])
  {
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v8 = HFCameraVideoCacheDidRemoveVideoDebugNotification;
    id v10 = @"uniqueIdentifier";
    v11[0] = v6;
    int v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v7 postNotificationName:v8 object:self userInfo:v9];
  }
}

- (BOOL)diskCache:(id)a3 shouldAddExistingFileToCache:(id)a4
{
  id v4 = a4;
  BOOL v5 = +[HFCameraUtilities isMP4FileAtURL:v4]
    && !+[HFCameraUtilities isTimelapseVideoFileAtURL:](HFCameraUtilities, "isTimelapseVideoFileAtURL:", v4)&& !+[HFCameraUtilities isVideoFileWithStrippedAudioAtURL:](HFCameraUtilities, "isVideoFileWithStrippedAudioAtURL:", v4)&& +[HFCameraUtilities compareCreationDateOfFileAtURL:v4 toDaysFromNow:-10] != -1;

  return v5;
}

- (HFCameraVideoDownloader)videoDownloader
{
  return self->_videoDownloader;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (HFDiskCache)diskCache
{
  return self->_diskCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskCache, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_videoDownloader, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end