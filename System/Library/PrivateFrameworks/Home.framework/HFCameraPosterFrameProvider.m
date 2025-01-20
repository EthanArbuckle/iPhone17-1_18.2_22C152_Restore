@interface HFCameraPosterFrameProvider
- (CGSize)posterFrameSize;
- (HFCameraImageCache)imageCache;
- (HFCameraPosterFrameProvider)initWithImageCache:(id)a3 andTimelapseClipInfoProvider:(id)a4;
- (HFCameraPosterFrameRequests)posterFrameRequests;
- (HFCameraTimelapseClipInfoProvider)timelapseClipInfoProvider;
- (HFCameraTimelapsePosterFrameGenerator)posterFrameGenerator;
- (OS_dispatch_queue)bookkeepingQueue;
- (id)_timelapseClipForHighQualityClip:(id)a3;
- (void)_checkImageCacheForDelegate:(id)a3 forHighQualityClip:(id)a4 atOffset:(double)a5;
- (void)_didGeneratePosterFrame:(id)a3 forHighQualityClip:(id)a4 atOffset:(double)a5 withTimelapseOffset:(double)a6;
- (void)_failedToDownloadVideoFileForClip:(id)a3;
- (void)_failedToFindTimelapseClipForHighQualityClip:(id)a3;
- (void)_failedToGeneratePosterFrameForHighQualityClip:(id)a3 atOffset:(double)a4;
- (void)_requestTimelapseFileForDelegate:(id)a3 forHighQualityClip:(id)a4 atOffset:(double)a5;
- (void)_requestTimelapsePosterFrameGenerationForTimelapseClip:(id)a3;
- (void)_updateDelegate:(id)a3 withPosterFrame:(id)a4 atOffset:(double)a5 ForHighQualityClip:(id)a6;
- (void)didDownloadVideoFileForClip:(id)a3 toURL:(id)a4;
- (void)didGeneratePosterFrame:(id)a3 forHighQualityClip:(id)a4 atOffset:(double)a5 withTimelapseOffset:(double)a6;
- (void)failedToDownloadVideoFileForClip:(id)a3;
- (void)failedToFindTimelapseClipForHighQualityClip:(id)a3;
- (void)failedToGeneratePosterFrameForHighQualityClip:(id)a3 atOffset:(double)a4;
- (void)foundVideoFileForClip:(id)a3 atURL:(id)a4;
- (void)getPosterFrameForDelegate:(id)a3 forHighQualityClip:(id)a4 atOffset:(double)a5;
- (void)setBookkeepingQueue:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setPosterFrameGenerator:(id)a3;
- (void)setPosterFrameRequests:(id)a3;
- (void)setPosterFrameSize:(CGSize)a3;
- (void)setTimelapseClipInfoProvider:(id)a3;
@end

@implementation HFCameraPosterFrameProvider

- (HFCameraPosterFrameProvider)initWithImageCache:(id)a3 andTimelapseClipInfoProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HFCameraPosterFrameProvider;
  v8 = [(HFCameraPosterFrameProvider *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_imageCache, v6);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.home.HFCameraPosterFrameProvider.bookkeepingQueue", 0);
    bookkeepingQueue = v9->_bookkeepingQueue;
    v9->_bookkeepingQueue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc_init(HFCameraPosterFrameRequests);
    posterFrameRequests = v9->_posterFrameRequests;
    v9->_posterFrameRequests = v12;

    v14 = [[HFCameraTimelapsePosterFrameGenerator alloc] initWithTimelapseClipInfoProvider:v7 andDelegate:v9];
    posterFrameGenerator = v9->_posterFrameGenerator;
    v9->_posterFrameGenerator = v14;

    objc_storeWeak((id *)&v9->_timelapseClipInfoProvider, v7);
  }

  return v9;
}

- (void)getPosterFrameForDelegate:(id)a3 forHighQualityClip:(id)a4 atOffset:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraPosterFrameProvider *)self _checkImageCacheForDelegate:v8 forHighQualityClip:v9 atOffset:a5];
  }
  else
  {
    objc_initWeak(&location, self);
    dispatch_queue_t v10 = [(HFCameraPosterFrameProvider *)self bookkeepingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __85__HFCameraPosterFrameProvider_getPosterFrameForDelegate_forHighQualityClip_atOffset___block_invoke;
    block[3] = &unk_26408D620;
    objc_copyWeak(v14, &location);
    id v12 = v8;
    id v13 = v9;
    v14[1] = *(id *)&a5;
    dispatch_async(v10, block);

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }
}

void __85__HFCameraPosterFrameProvider_getPosterFrameForDelegate_forHighQualityClip_atOffset___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _checkImageCacheForDelegate:*(void *)(a1 + 32) forHighQualityClip:*(void *)(a1 + 40) atOffset:*(double *)(a1 + 56)];
}

- (void)_checkImageCacheForDelegate:(id)a3 forHighQualityClip:(id)a4 atOffset:(double)a5
{
  id v8 = a4;
  id v9 = a3;
  dispatch_queue_t v10 = [v8 uniqueIdentifier];
  v11 = [v10 UUIDString];
  *(float *)&double v12 = a5;
  id v15 = +[HFCameraImageCache posterFrameKeyForCameraClipIdentifierString:v11 withOffset:v12];

  id v13 = [(HFCameraPosterFrameProvider *)self imageCache];
  v14 = [v13 imageForKey:v15];

  if (v14) {
    [(HFCameraPosterFrameProvider *)self _updateDelegate:v9 withPosterFrame:v14 atOffset:v8 ForHighQualityClip:a5];
  }
  else {
    [(HFCameraPosterFrameProvider *)self _generateImageForDelegate:v9 forHighQualityClip:v8 atOffset:a5];
  }
}

- (void)_requestTimelapseFileForDelegate:(id)a3 forHighQualityClip:(id)a4 atOffset:(double)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a3;
  dispatch_queue_t v10 = [(HFCameraPosterFrameProvider *)self _timelapseClipForHighQualityClip:v8];
  if (v10)
  {
    v11 = [(HFCameraPosterFrameProvider *)self posterFrameRequests];
    [v11 addRequestForTimelapseFileForDelegate:v9 forHighQualityClip:v8 andTimelapseClip:v10 atOffset:a5];

    id v9 = +[HFCameraTimelapseVideoProvider sharedProvider];
    [v9 getVideoForTimelapseClip:v10 taskType:1 delegate:self];
  }
  else
  {
    double v12 = HFLogForCategory(0x19uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "Error: Missing timelapse for clip %@", (uint8_t *)&v13, 0xCu);
    }

    [(HFCameraPosterFrameProvider *)self _updateDelegate:v9 withPosterFrame:0 atOffset:v8 ForHighQualityClip:a5];
  }
}

- (id)_timelapseClipForHighQualityClip:(id)a3
{
  id v4 = a3;
  v5 = [(HFCameraPosterFrameProvider *)self timelapseClipInfoProvider];
  id v6 = [v4 startDate];
  id v7 = [v5 timelapseClipPositionForDate:v6 inHighQualityClip:v4];

  id v8 = [v7 clip];

  return v8;
}

- (void)_requestTimelapsePosterFrameGenerationForTimelapseClip:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF980];
  id v6 = [(HFCameraPosterFrameProvider *)self posterFrameRequests];
  id v7 = [v6 fulfillRequestsForTimelapseFileForTimelapseClip:v4];
  id v8 = [v5 arrayWithArray:v7];

  if ([v8 count])
  {
    id v9 = [v8 firstObject];
    dispatch_queue_t v10 = [v9 highQualityClip];

    if (v10)
    {
      id v33 = v4;
      v11 = [(HFCameraPosterFrameProvider *)self posterFrameGenerator];
      [(HFCameraPosterFrameProvider *)self posterFrameSize];
      double v12 = objc_msgSend(v11, "generatePosterFramesForHighQualityClip:withStep:atSize:", v10, 1);

      int v13 = [MEMORY[0x263EFF9C0] set];
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v32 = v8;
      id v14 = v8;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v39 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = [*(id *)(*((void *)&v38 + 1) + 8 * i) offsetNumber];
            [v13 addObject:v19];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v16);
      }
      v31 = self;

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v20 = v12;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v35 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            if (([v13 containsObject:v25] & 1) == 0)
            {
              v26 = objc_alloc_init(HFCameraPosterFrameDelegateRequest);
              v27 = (void *)[v25 copy];
              [(HFCameraPosterFrameDelegateRequest *)v26 setOffsetNumber:v27];

              [(HFCameraPosterFrameDelegateRequest *)v26 setDelegate:0];
              [v14 addObject:v26];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v22);
      }

      v28 = [(HFCameraPosterFrameProvider *)v31 posterFrameRequests];
      [v28 addRequestsForPosterFrameGeneration:v14 forHighQualityClip:v10];

      id v8 = v32;
      id v4 = v33;
    }
    else
    {
      v20 = HFLogForCategory(0x19uLL);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v30 = objc_msgSend(v4, "hf_prettyDescription");
        *(_DWORD *)buf = 138412290;
        v45 = v30;
        _os_log_error_impl(&dword_20B986000, v20, OS_LOG_TYPE_ERROR, "Error: Provider has no high quality clip for timelapse clip %@", buf, 0xCu);
      }
    }
  }
  else
  {
    dispatch_queue_t v10 = HFLogForCategory(0x19uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v29 = objc_msgSend(v4, "hf_prettyDescription");
      *(_DWORD *)buf = 138412290;
      v45 = v29;
      _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "REQUEST: Provider has no requests for timelapse clip: %@", buf, 0xCu);
    }
  }
}

- (void)didDownloadVideoFileForClip:(id)a3 toURL:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (+[HFUtilities isInternalTest])
  {
    id v8 = HFLogForCategory(0x19uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_msgSend(v6, "hf_prettyDescription");
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v9;
      _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Downloaded timelapse file for timelapse clip: %@", buf, 0xCu);
    }
    [(HFCameraPosterFrameProvider *)self _requestTimelapsePosterFrameGenerationForTimelapseClip:v6];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    dispatch_queue_t v10 = [(HFCameraPosterFrameProvider *)self bookkeepingQueue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __65__HFCameraPosterFrameProvider_didDownloadVideoFileForClip_toURL___block_invoke;
    v11[3] = &unk_26408DB10;
    objc_copyWeak(&v13, (id *)buf);
    id v12 = v6;
    dispatch_async(v10, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

void __65__HFCameraPosterFrameProvider_didDownloadVideoFileForClip_toURL___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = HFLogForCategory(0x19uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Downloaded timelapse file for timelapse clip: %@", (uint8_t *)&v5, 0xCu);
  }
  [WeakRetained _requestTimelapsePosterFrameGenerationForTimelapseClip:*(void *)(a1 + 32)];
}

- (void)foundVideoFileForClip:(id)a3 atURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraPosterFrameProvider *)self _requestTimelapsePosterFrameGenerationForTimelapseClip:v6];
  }
  else
  {
    objc_initWeak(&location, self);
    id v8 = [(HFCameraPosterFrameProvider *)self bookkeepingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__HFCameraPosterFrameProvider_foundVideoFileForClip_atURL___block_invoke;
    block[3] = &unk_26408DB10;
    objc_copyWeak(&v11, &location);
    id v10 = v6;
    dispatch_async(v8, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __59__HFCameraPosterFrameProvider_foundVideoFileForClip_atURL___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = HFLogForCategory(0x19uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = objc_msgSend(*(id *)(a1 + 32), "hf_prettyDescription");
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Found timelapse file for timelapse clip: %@", (uint8_t *)&v5, 0xCu);
  }
  [WeakRetained _requestTimelapsePosterFrameGenerationForTimelapseClip:*(void *)(a1 + 32)];
}

- (void)failedToDownloadVideoFileForClip:(id)a3
{
  id v4 = a3;
  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraPosterFrameProvider *)self _failedToDownloadVideoFileForClip:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    int v5 = [(HFCameraPosterFrameProvider *)self bookkeepingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__HFCameraPosterFrameProvider_failedToDownloadVideoFileForClip___block_invoke;
    block[3] = &unk_26408DB10;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __64__HFCameraPosterFrameProvider_failedToDownloadVideoFileForClip___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _failedToDownloadVideoFileForClip:*(void *)(a1 + 32)];
}

- (void)_failedToDownloadVideoFileForClip:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = HFLogForCategory(0x19uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v18 = objc_msgSend(v4, "hf_prettyDescription");
    *(_DWORD *)buf = 138412290;
    v25 = v18;
    _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Error: failed to download timelapse file for timelapse clip: %@", buf, 0xCu);
  }
  id v6 = [(HFCameraPosterFrameProvider *)self posterFrameRequests];
  id v7 = [v6 fulfillRequestsForTimelapseFileForTimelapseClip:v4];

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
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "offsetNumber", (void)v19);
        [v14 doubleValue];
        double v16 = v15;

        uint64_t v17 = [v13 delegate];
        [(HFCameraPosterFrameProvider *)self _updateDelegate:v17 withPosterFrame:0 atOffset:v4 ForHighQualityClip:v16];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }
}

- (void)didGeneratePosterFrame:(id)a3 forHighQualityClip:(id)a4 atOffset:(double)a5 withTimelapseOffset:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraPosterFrameProvider *)self _didGeneratePosterFrame:v10 forHighQualityClip:v11 atOffset:a5 withTimelapseOffset:a6];
  }
  else
  {
    objc_initWeak(&location, self);
    id v12 = [(HFCameraPosterFrameProvider *)self bookkeepingQueue];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __102__HFCameraPosterFrameProvider_didGeneratePosterFrame_forHighQualityClip_atOffset_withTimelapseOffset___block_invoke;
    v13[3] = &unk_26408DB38;
    objc_copyWeak(v16, &location);
    id v14 = v10;
    id v15 = v11;
    v16[1] = *(id *)&a5;
    v16[2] = *(id *)&a6;
    dispatch_async(v12, v13);

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
}

void __102__HFCameraPosterFrameProvider_didGeneratePosterFrame_forHighQualityClip_atOffset_withTimelapseOffset___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _didGeneratePosterFrame:*(void *)(a1 + 32) forHighQualityClip:*(void *)(a1 + 40) atOffset:*(double *)(a1 + 56) withTimelapseOffset:*(double *)(a1 + 64)];
}

- (void)_didGeneratePosterFrame:(id)a3 forHighQualityClip:(id)a4 atOffset:(double)a5 withTimelapseOffset:(double)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = HFLogForCategory(0x19uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_msgSend(v10, "hf_prettyDescription");
    int v22 = 138412546;
    uint64_t v23 = v12;
    __int16 v24 = 2048;
    double v25 = a5;
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Generated poster frame for clip: %@; offset: %f",
      (uint8_t *)&v22,
      0x16u);
  }
  id v13 = [v10 uniqueIdentifier];
  id v14 = [v13 UUIDString];
  *(float *)&double v15 = a5;
  double v16 = +[HFCameraImageCache posterFrameKeyForCameraClipIdentifierString:v14 withOffset:v15];

  uint64_t v17 = [(HFCameraPosterFrameProvider *)self imageCache];
  [v17 addImage:v9 forKey:v16];

  v18 = [(HFCameraPosterFrameProvider *)self posterFrameRequests];
  long long v19 = [v18 fulfillRequestForPosterFrameGenerationForHighQualityClip:v10 atOffset:a5];

  long long v20 = [v19 delegate];

  if (v20)
  {
    long long v21 = [v19 delegate];
    [(HFCameraPosterFrameProvider *)self _updateDelegate:v21 withPosterFrame:v9 atOffset:v10 ForHighQualityClip:a5];
  }
}

- (void)failedToFindTimelapseClipForHighQualityClip:(id)a3
{
  id v4 = a3;
  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraPosterFrameProvider *)self _failedToFindTimelapseClipForHighQualityClip:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    int v5 = [(HFCameraPosterFrameProvider *)self bookkeepingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__HFCameraPosterFrameProvider_failedToFindTimelapseClipForHighQualityClip___block_invoke;
    block[3] = &unk_26408DB10;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __75__HFCameraPosterFrameProvider_failedToFindTimelapseClipForHighQualityClip___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _failedToFindTimelapseClipForHighQualityClip:*(void *)(a1 + 32)];
}

- (void)_failedToFindTimelapseClipForHighQualityClip:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = HFLogForCategory(0x19uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    long long v19 = objc_msgSend(v4, "hf_prettyDescription");
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v19;
    _os_log_error_impl(&dword_20B986000, v5, OS_LOG_TYPE_ERROR, "Error: Failed to find timelapse for clip: %@", buf, 0xCu);
  }
  id v6 = [(HFCameraPosterFrameProvider *)self posterFrameRequests];
  id v7 = [v6 fulfillAllRequestsForPosterFrameGenerationForHighQualityClip:v4];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "delegate", (void)v20);

        if (v14)
        {
          double v15 = [v13 offsetNumber];
          [v15 doubleValue];
          double v17 = v16;

          v18 = [v13 delegate];
          [(HFCameraPosterFrameProvider *)self _updateDelegate:v18 withPosterFrame:0 atOffset:v4 ForHighQualityClip:v17];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
}

- (void)failedToGeneratePosterFrameForHighQualityClip:(id)a3 atOffset:(double)a4
{
  id v6 = a3;
  if (+[HFUtilities isInternalTest])
  {
    [(HFCameraPosterFrameProvider *)self _failedToGeneratePosterFrameForHighQualityClip:v6 atOffset:a4];
  }
  else
  {
    objc_initWeak(&location, self);
    id v7 = [(HFCameraPosterFrameProvider *)self bookkeepingQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __86__HFCameraPosterFrameProvider_failedToGeneratePosterFrameForHighQualityClip_atOffset___block_invoke;
    v8[3] = &unk_26408DB60;
    objc_copyWeak(v10, &location);
    id v9 = v6;
    v10[1] = *(id *)&a4;
    dispatch_async(v7, v8);

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }
}

void __86__HFCameraPosterFrameProvider_failedToGeneratePosterFrameForHighQualityClip_atOffset___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _failedToGeneratePosterFrameForHighQualityClip:*(void *)(a1 + 32) atOffset:*(double *)(a1 + 48)];
}

- (void)_failedToGeneratePosterFrameForHighQualityClip:(id)a3 atOffset:(double)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = HFLogForCategory(0x19uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v12 = objc_msgSend(v6, "hf_prettyDescription");
    int v13 = 138412546;
    id v14 = v12;
    __int16 v15 = 2048;
    double v16 = a4;
    _os_log_error_impl(&dword_20B986000, v7, OS_LOG_TYPE_ERROR, "Error: Failed generation for clip %@; offset %f",
      (uint8_t *)&v13,
      0x16u);
  }
  id v8 = [(HFCameraPosterFrameProvider *)self posterFrameRequests];
  id v9 = [v8 fulfillRequestForPosterFrameGenerationForHighQualityClip:v6 atOffset:a4];

  uint64_t v10 = [v9 delegate];

  if (v10)
  {
    uint64_t v11 = [v9 delegate];
    [(HFCameraPosterFrameProvider *)self _updateDelegate:v11 withPosterFrame:0 atOffset:v6 ForHighQualityClip:a4];
  }
}

- (void)_updateDelegate:(id)a3 withPosterFrame:(id)a4 atOffset:(double)a5 ForHighQualityClip:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __91__HFCameraPosterFrameProvider__updateDelegate_withPosterFrame_atOffset_ForHighQualityClip___block_invoke;
  v15[3] = &unk_26408D518;
  id v16 = v10;
  id v17 = v9;
  double v19 = a5;
  id v18 = v11;
  id v12 = v11;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(MEMORY[0x263EF83A0], v15);
}

uint64_t __91__HFCameraPosterFrameProvider__updateDelegate_withPosterFrame_atOffset_ForHighQualityClip___block_invoke(double *a1)
{
  uint64_t v3 = *((void *)a1 + 4);
  v2 = (void *)*((void *)a1 + 5);
  double v4 = a1[7];
  if (v3) {
    return [v2 didFindPosterFrame:v3 atOffset:*((void *)a1 + 6) forClip:v4];
  }
  else {
    return [v2 failedToFindPosterFrameAtOffset:*((void *)a1 + 6) forClip:v4];
  }
}

- (CGSize)posterFrameSize
{
  double width = self->_posterFrameSize.width;
  double height = self->_posterFrameSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPosterFrameSize:(CGSize)a3
{
  self->_posterFrameSize = a3;
}

- (HFCameraImageCache)imageCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageCache);
  return (HFCameraImageCache *)WeakRetained;
}

- (void)setImageCache:(id)a3
{
}

- (OS_dispatch_queue)bookkeepingQueue
{
  return self->_bookkeepingQueue;
}

- (void)setBookkeepingQueue:(id)a3
{
}

- (HFCameraPosterFrameRequests)posterFrameRequests
{
  return self->_posterFrameRequests;
}

- (void)setPosterFrameRequests:(id)a3
{
}

- (HFCameraTimelapsePosterFrameGenerator)posterFrameGenerator
{
  return self->_posterFrameGenerator;
}

- (void)setPosterFrameGenerator:(id)a3
{
}

- (HFCameraTimelapseClipInfoProvider)timelapseClipInfoProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timelapseClipInfoProvider);
  return (HFCameraTimelapseClipInfoProvider *)WeakRetained;
}

- (void)setTimelapseClipInfoProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_timelapseClipInfoProvider);
  objc_storeStrong((id *)&self->_posterFrameGenerator, 0);
  objc_storeStrong((id *)&self->_posterFrameRequests, 0);
  objc_storeStrong((id *)&self->_bookkeepingQueue, 0);
  objc_destroyWeak((id *)&self->_imageCache);
}

@end