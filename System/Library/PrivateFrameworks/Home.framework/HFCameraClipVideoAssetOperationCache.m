@interface HFCameraClipVideoAssetOperationCache
+ (double)defaultFrameSize;
- (HFCameraClipVideoAssetOperationCache)init;
- (HFCameraClipVideoAssetOperationMarker)head;
- (HFCameraClipVideoAssetOperationMarker)tail;
- (NSMutableDictionary)markerInfo;
- (OS_dispatch_queue)workQueue;
- (id)operationForKey:(id)a3;
- (unint64_t)cacheSizeForDevice;
- (unint64_t)count;
- (unint64_t)maxSize;
- (void)_addOperation:(id)a3 forClip:(id)a4 usingKey:(id)a5;
- (void)_purge;
- (void)_removeOperationForKey:(id)a3;
- (void)addOperation:(id)a3 forClip:(id)a4 usingKey:(id)a5;
- (void)pointHeadAtMarker:(id)a3;
- (void)purge;
- (void)removeMarker:(id)a3;
- (void)removeOperationForKey:(id)a3;
- (void)resetSentinels;
- (void)setCount:(unint64_t)a3;
- (void)setHead:(id)a3;
- (void)setMarkerInfo:(id)a3;
- (void)setMaxSize:(unint64_t)a3;
- (void)setTail:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation HFCameraClipVideoAssetOperationCache

- (HFCameraClipVideoAssetOperationCache)init
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)HFCameraClipVideoAssetOperationCache;
  v2 = [(HFCameraClipVideoAssetOperationCache *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Home.cameraClipVideoAssetOperationCacheQueue", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    unint64_t v5 = [(HFCameraClipVideoAssetOperationCache *)v2 cacheSizeForDevice];
    uint64_t v6 = 3;
    if (v5 > 3) {
      uint64_t v6 = v5;
    }
    v2->_unint64_t maxSize = v6;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    markerInfo = v2->_markerInfo;
    v2->_markerInfo = v7;

    uint64_t v9 = +[HFCameraClipVideoAssetOperationMarker sentinelWithKey:@"HEAD"];
    head = v2->_head;
    v2->_head = (HFCameraClipVideoAssetOperationMarker *)v9;

    uint64_t v11 = +[HFCameraClipVideoAssetOperationMarker sentinelWithKey:@"TAIL"];
    tail = v2->_tail;
    v2->_tail = (HFCameraClipVideoAssetOperationMarker *)v11;

    [(HFCameraClipVideoAssetOperationCache *)v2 resetSentinels];
    v13 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t maxSize = v2->_maxSize;
      *(_DWORD *)buf = 134217984;
      unint64_t v18 = maxSize;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "Init video asset cache with size:%lu", buf, 0xCu);
    }
  }
  return v2;
}

- (unint64_t)cacheSizeForDevice
{
  v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 bounds];
  double v4 = v3;

  unint64_t v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 bounds];
  double v7 = v6;

  if (v4 >= v7) {
    double v8 = v4;
  }
  else {
    double v8 = v7;
  }
  return (unint64_t)(v8 / 88.0);
}

+ (double)defaultFrameSize
{
  return 88.0;
}

- (void)pointHeadAtMarker:(id)a3
{
  id v17 = a3;
  double v4 = [v17 previous];
  unint64_t v5 = [(HFCameraClipVideoAssetOperationCache *)self head];
  char v6 = [v4 isEqual:v5];

  if ((v6 & 1) == 0)
  {
    double v7 = [v17 next];
    double v8 = [v17 previous];
    uint64_t v9 = [(HFCameraClipVideoAssetOperationCache *)self head];
    v10 = [v9 next];

    uint64_t v11 = [(HFCameraClipVideoAssetOperationCache *)self head];
    v12 = [v11 next];
    [v17 setNext:v12];

    v13 = [(HFCameraClipVideoAssetOperationCache *)self head];
    [v17 setPrevious:v13];

    v14 = [(HFCameraClipVideoAssetOperationCache *)self head];
    [v14 setNext:v17];

    [v10 setPrevious:v17];
    v15 = [v17 next];
    [v8 setNext:v15];

    objc_super v16 = [v17 previous];
    [v7 setPrevious:v16];
  }
}

- (id)operationForKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__20;
  unint64_t v18 = __Block_byref_object_dispose__20;
  id v19 = 0;
  unint64_t v5 = [(HFCameraClipVideoAssetOperationCache *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__HFCameraClipVideoAssetOperationCache_operationForKey___block_invoke;
  block[3] = &unk_26408FC10;
  v13 = &v14;
  block[4] = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(v5, block);

  double v7 = (void *)v15[5];
  if (v7)
  {
    double v8 = [v7 operation];
  }
  else
  {
    uint64_t v9 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "No videoAssetContext fetch operation in progress for key:%@", buf, 0xCu);
    }

    double v8 = 0;
  }

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __56__HFCameraClipVideoAssetOperationCache_operationForKey___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) markerInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "pointHeadAtMarker:");
    id v6 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) key];
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "VideoAssetContext fetch operation in progress for key:%@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)addOperation:(id)a3 forClip:(id)a4 usingKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraClipVideoAssetOperationCache *)self _addOperation:v8 forClip:v9 usingKey:v10];
  }
  else
  {
    uint64_t v11 = [(HFCameraClipVideoAssetOperationCache *)self workQueue];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __70__HFCameraClipVideoAssetOperationCache_addOperation_forClip_usingKey___block_invoke;
    v12[3] = &unk_26408D478;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(v11, v12);
  }
}

uint64_t __70__HFCameraClipVideoAssetOperationCache_addOperation_forClip_usingKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addOperation:*(void *)(a1 + 40) forClip:*(void *)(a1 + 48) usingKey:*(void *)(a1 + 56)];
}

- (void)_addOperation:(id)a3 forClip:(id)a4 usingKey:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(HFCameraClipVideoAssetOperationCache *)self markerInfo];
  id v12 = [v11 objectForKeyedSubscript:v10];

  if (v12)
  {
    id v13 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = [(HFCameraClipVideoAssetOperationMarker *)v12 key];
      *(_DWORD *)buf = 138412290;
      id v37 = v14;
      _os_log_error_impl(&dword_20B986000, v13, OS_LOG_TYPE_ERROR, "Logic error. Attempting to add VideoAssetContext fetch operation that is already in progress for key:%@. The imageManager should have blocked this.", buf, 0xCu);
    }
LABEL_19:

    goto LABEL_20;
  }
  id v12 = [[HFCameraClipVideoAssetOperationMarker alloc] initWithCameraClip:v9 operation:v8 key:v10];
  id v15 = [(HFCameraClipVideoAssetOperationCache *)self markerInfo];
  [v15 setObject:v12 forKeyedSubscript:v10];

  [(HFCameraClipVideoAssetOperationCache *)self pointHeadAtMarker:v12];
  [(HFCameraClipVideoAssetOperationCache *)self setCount:[(HFCameraClipVideoAssetOperationCache *)self count] + 1];
  uint64_t v16 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v37 = v10;
    __int16 v38 = 2048;
    unint64_t v39 = [(HFCameraClipVideoAssetOperationCache *)self count];
    _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "Add VideoAssetContext fetch operation for key:%@ with operation count:%lu.", buf, 0x16u);
  }

  unint64_t v17 = [(HFCameraClipVideoAssetOperationCache *)self count];
  if (v17 >= [(HFCameraClipVideoAssetOperationCache *)self maxSize])
  {
    unint64_t v18 = [(HFCameraClipVideoAssetOperationCache *)self tail];
    id v19 = [v18 previous];
    v20 = [v19 key];
    [(HFCameraClipVideoAssetOperationCache *)self _removeOperationForKey:v20];
  }
  if (+[HFUtilities isInternalInstall])
  {
    id v33 = v10;
    id v34 = v9;
    id v35 = v8;
    id v21 = [(HFCameraClipVideoAssetOperationCache *)self head];
    uint64_t v22 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v22, OS_LOG_TYPE_DEFAULT, "--List of markers:", buf, 2u);
    }

    if (v21)
    {
      uint64_t v23 = 0;
      do
      {
        v24 = HFLogForCategory(0x15uLL);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = [v21 key];
          v26 = [v21 previous];
          v27 = [v26 key];
          v28 = [v21 next];
          v29 = [v28 key];
          *(_DWORD *)buf = 138413058;
          id v37 = v25;
          __int16 v38 = 2112;
          unint64_t v39 = (unint64_t)v27;
          __int16 v40 = 2112;
          v41 = v29;
          __int16 v42 = 2048;
          uint64_t v43 = v23;
          _os_log_impl(&dword_20B986000, v24, OS_LOG_TYPE_DEFAULT, "-----UUID:%@ prev:%@ next:%@ index:%lu", buf, 0x2Au);
        }
        uint64_t v30 = [v21 next];

        ++v23;
        id v21 = (void *)v30;
      }
      while (v30);
    }
    id v13 = HFLogForCategory(0x15uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [(HFCameraClipVideoAssetOperationCache *)self markerInfo];
      v32 = [v31 allKeys];
      *(_DWORD *)buf = 138412290;
      id v37 = v32;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "Keys= %@", buf, 0xCu);
    }
    id v9 = v34;
    id v8 = v35;
    id v10 = v33;
    goto LABEL_19;
  }
LABEL_20:
}

- (void)_removeOperationForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(HFCameraClipVideoAssetOperationCache *)self markerInfo];
  id v6 = [v5 objectForKeyedSubscript:v4];

  double v7 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 key];
    id v9 = [v6 operation];
    int v17 = 138412546;
    unint64_t v18 = v8;
    __int16 v19 = 1024;
    int v20 = [v9 isExecuting];
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Evict marker:%@ Executing:%{BOOL}d.", (uint8_t *)&v17, 0x12u);
  }
  id v10 = [v6 operation];
  int v11 = [v10 isExecuting];

  if (v11)
  {
    id v12 = [v6 operation];
    [v12 cancel];
  }
  [(HFCameraClipVideoAssetOperationCache *)self removeMarker:v6];
  id v13 = [(HFCameraClipVideoAssetOperationCache *)self markerInfo];
  [v13 setObject:0 forKeyedSubscript:v4];

  [(HFCameraClipVideoAssetOperationCache *)self setCount:[(HFCameraClipVideoAssetOperationCache *)self count] - 1];
  id v14 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [(HFCameraClipVideoAssetOperationCache *)self markerInfo];
    uint64_t v16 = [v15 allKeys];
    int v17 = 138412290;
    unint64_t v18 = v16;
    _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Remaining marker keys= %@", (uint8_t *)&v17, 0xCu);
  }
}

- (void)removeOperationForKey:(id)a3
{
  id v4 = a3;
  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraClipVideoAssetOperationCache *)self _removeOperationForKey:v4];
  }
  else
  {
    unint64_t v5 = [(HFCameraClipVideoAssetOperationCache *)self workQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62__HFCameraClipVideoAssetOperationCache_removeOperationForKey___block_invoke;
    v6[3] = &unk_26408D450;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __62__HFCameraClipVideoAssetOperationCache_removeOperationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeOperationForKey:*(void *)(a1 + 40)];
}

- (void)removeMarker:(id)a3
{
  id v3 = a3;
  id v4 = [v3 previous];
  unint64_t v5 = [v3 next];
  [v5 setPrevious:v4];

  id v7 = [v3 next];
  id v6 = [v3 previous];

  [v6 setNext:v7];
}

- (void)resetSentinels
{
  id v3 = [(HFCameraClipVideoAssetOperationCache *)self tail];
  id v4 = [(HFCameraClipVideoAssetOperationCache *)self head];
  [v4 setNext:v3];

  id v6 = [(HFCameraClipVideoAssetOperationCache *)self head];
  unint64_t v5 = [(HFCameraClipVideoAssetOperationCache *)self tail];
  [v5 setPrevious:v6];
}

- (void)purge
{
  id v3 = HFLogForCategory(0x15uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Purging VideoAssetOperationCache.", buf, 2u);
  }

  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraClipVideoAssetOperationCache *)self _purge];
  }
  else
  {
    id v4 = [(HFCameraClipVideoAssetOperationCache *)self workQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__HFCameraClipVideoAssetOperationCache_purge__block_invoke;
    block[3] = &unk_26408DDE0;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

uint64_t __45__HFCameraClipVideoAssetOperationCache_purge__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purge];
}

- (void)_purge
{
  id v3 = [(HFCameraClipVideoAssetOperationCache *)self markerInfo];
  id v4 = [v3 allValues];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_150];

  unint64_t v5 = [(HFCameraClipVideoAssetOperationCache *)self markerInfo];
  [v5 removeAllObjects];

  [(HFCameraClipVideoAssetOperationCache *)self resetSentinels];
  [(HFCameraClipVideoAssetOperationCache *)self setCount:0];
}

void __46__HFCameraClipVideoAssetOperationCache__purge__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 operation];
  [v2 cancel];
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(unint64_t)a3
{
  self->_unint64_t maxSize = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (HFCameraClipVideoAssetOperationMarker)head
{
  return self->_head;
}

- (void)setHead:(id)a3
{
}

- (HFCameraClipVideoAssetOperationMarker)tail
{
  return self->_tail;
}

- (void)setTail:(id)a3
{
}

- (NSMutableDictionary)markerInfo
{
  return self->_markerInfo;
}

- (void)setMarkerInfo:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_markerInfo, 0);
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_head, 0);
}

@end