@interface HFCameraTimelapseVideoProvider
+ (id)sharedProvider;
- (HFCameraTimelapseVideoProvider)init;
- (HFCameraVideoDownloader)timelapseVideoDownloader;
- (NSOperationQueue)downloadQueue;
- (OS_dispatch_queue)bookkeepingQueue;
- (void)_getVideoForTimelapseClip:(id)a3 taskType:(unint64_t)a4 delegate:(id)a5;
- (void)getVideoForTimelapseClip:(id)a3 taskType:(unint64_t)a4 delegate:(id)a5;
- (void)setBookkeepingQueue:(id)a3;
- (void)setDownloadQueue:(id)a3;
- (void)setTimelapseVideoDownloader:(id)a3;
- (void)waitUntilAllDownloadsAreFinished;
@end

@implementation HFCameraTimelapseVideoProvider

+ (id)sharedProvider
{
  if (qword_26AB2F198 != -1) {
    dispatch_once(&qword_26AB2F198, &__block_literal_global_111);
  }
  v2 = (void *)_MergedGlobals_262;
  return v2;
}

uint64_t __48__HFCameraTimelapseVideoProvider_sharedProvider__block_invoke()
{
  v0 = objc_alloc_init(HFCameraTimelapseVideoProvider);
  uint64_t v1 = _MergedGlobals_262;
  _MergedGlobals_262 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFCameraTimelapseVideoProvider)init
{
  v9.receiver = self;
  v9.super_class = (Class)HFCameraTimelapseVideoProvider;
  v2 = [(HFCameraTimelapseVideoProvider *)&v9 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    downloadQueue = v2->_downloadQueue;
    v2->_downloadQueue = v3;

    [(NSOperationQueue *)v2->_downloadQueue setMaxConcurrentOperationCount:5];
    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.Home.HFCameraTimelapseVideoProvider.bookkeepingQueue", v5);
    bookkeepingQueue = v2->_bookkeepingQueue;
    v2->_bookkeepingQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)setTimelapseVideoDownloader:(id)a3
{
  v4 = (HFCameraVideoDownloader *)a3;
  v5 = [(HFCameraTimelapseVideoProvider *)self downloadQueue];
  [v5 cancelAllOperations];

  timelapseVideoDownloader = self->_timelapseVideoDownloader;
  self->_timelapseVideoDownloader = v4;
}

- (void)waitUntilAllDownloadsAreFinished
{
  id v2 = [(HFCameraTimelapseVideoProvider *)self downloadQueue];
  [v2 waitUntilAllOperationsAreFinished];
}

- (void)getVideoForTimelapseClip:(id)a3 taskType:(unint64_t)a4 delegate:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = HFLogForCategory(0x1DuLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v8 uniqueIdentifier];
    *(_DWORD *)buf = 138412546;
    v18 = v11;
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Provider asked for clip: %@ with task type %lu", buf, 0x16u);
  }
  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraTimelapseVideoProvider *)self _getVideoForTimelapseClip:v8 taskType:a4 delegate:v9];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v12 = [(HFCameraTimelapseVideoProvider *)self bookkeepingQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __77__HFCameraTimelapseVideoProvider_getVideoForTimelapseClip_taskType_delegate___block_invoke;
    v13[3] = &unk_26408D620;
    objc_copyWeak(v16, (id *)buf);
    id v14 = v8;
    v16[1] = (id)a4;
    id v15 = v9;
    dispatch_async(v12, v13);

    objc_destroyWeak(v16);
    objc_destroyWeak((id *)buf);
  }
}

void __77__HFCameraTimelapseVideoProvider_getVideoForTimelapseClip_taskType_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _getVideoForTimelapseClip:*(void *)(a1 + 32) taskType:*(void *)(a1 + 56) delegate:*(void *)(a1 + 40)];
}

- (void)_getVideoForTimelapseClip:(id)a3 taskType:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(HFCameraTimelapseVideoProvider *)self timelapseVideoDownloader];

  if (v10)
  {
    v11 = [(HFCameraTimelapseVideoProvider *)self timelapseVideoDownloader];
    v12 = [v11 priorityDownloadOperationForClip:v8];

    [v12 setDelegate:v9];
    v13 = [(HFCameraTimelapseVideoProvider *)self downloadQueue];
    id v14 = [v13 operations];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __78__HFCameraTimelapseVideoProvider__getVideoForTimelapseClip_taskType_delegate___block_invoke;
    v25[3] = &unk_26408FDE8;
    id v15 = v12;
    id v26 = v15;
    v16 = objc_msgSend(v14, "na_firstObjectPassingTest:", v25);

    if (v16)
    {
      if (!a4) {
        objc_msgSend(v16, "setQueuePriority:", objc_msgSend(v15, "queuePriority"));
      }
      [v15 addDependency:v16];
    }
    else if (!a4)
    {
      v17 = [(HFCameraTimelapseVideoProvider *)self downloadQueue];
      v18 = [v17 operations];
      uint64_t v20 = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      v22 = __78__HFCameraTimelapseVideoProvider__getVideoForTimelapseClip_taskType_delegate___block_invoke_2;
      v23 = &unk_264095DE0;
      id v24 = v15;
      objc_msgSend(v18, "na_each:", &v20);
    }
    __int16 v19 = [(HFCameraTimelapseVideoProvider *)self downloadQueue];
    [v19 addOperation:v15];
  }
}

uint64_t __78__HFCameraTimelapseVideoProvider__getVideoForTimelapseClip_taskType_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 clip];
  v5 = [v4 uniqueIdentifier];
  dispatch_queue_t v6 = [v3 clip];

  v7 = [v6 uniqueIdentifier];
  uint64_t v8 = objc_msgSend(v5, "hmf_isEqualToUUID:", v7);

  return v8;
}

void __78__HFCameraTimelapseVideoProvider__getVideoForTimelapseClip_taskType_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [*(id *)(a1 + 32) clip];
  v4 = [v3 uniqueIdentifier];
  v5 = [v8 clip];
  dispatch_queue_t v6 = [v5 uniqueIdentifier];
  char v7 = objc_msgSend(v4, "hmf_isEqualToUUID:", v6);

  if ((v7 & 1) == 0) {
    [v8 setQueuePriority:-4];
  }
}

- (HFCameraVideoDownloader)timelapseVideoDownloader
{
  return self->_timelapseVideoDownloader;
}

- (NSOperationQueue)downloadQueue
{
  return self->_downloadQueue;
}

- (void)setDownloadQueue:(id)a3
{
}

- (OS_dispatch_queue)bookkeepingQueue
{
  return self->_bookkeepingQueue;
}

- (void)setBookkeepingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookkeepingQueue, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->_timelapseVideoDownloader, 0);
}

@end