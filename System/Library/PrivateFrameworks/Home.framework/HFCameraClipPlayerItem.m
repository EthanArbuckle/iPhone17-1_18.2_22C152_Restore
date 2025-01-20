@interface HFCameraClipPlayerItem
+ (id)_assetOptionsForClip:(id)a3;
+ (id)playlistURL;
- (BOOL)isPlayable;
- (BOOL)isUsingCachedVideoOnDisk;
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (HFCameraClipPlayerItem)initWithClipManager:(id)a3 clip:(id)a4;
- (HFCameraClipVideoAssetContextProvider)videoContextProvider;
- (HMCameraClip)clip;
- (HMCameraClipManager)clipManager;
- (NSString)description;
- (OS_dispatch_queue)resourceLoaderQueue;
- (void)dealloc;
- (void)setClip:(id)a3;
- (void)setClipManager:(id)a3;
- (void)setIsUsingCachedVideoOnDisk:(BOOL)a3;
- (void)setVideoContextProvider:(id)a3;
@end

@implementation HFCameraClipPlayerItem

+ (id)playlistURL
{
  if (_MergedGlobals_3_1 != -1) {
    dispatch_once(&_MergedGlobals_3_1, &__block_literal_global_3_12);
  }
  v2 = (void *)qword_26AB2E6E8;
  return v2;
}

uint64_t __37__HFCameraClipPlayerItem_playlistURL__block_invoke_2()
{
  uint64_t v0 = [NSURL URLWithString:@"HFCC://clipPlaylist.m3u8"];
  uint64_t v1 = qword_26AB2E6E8;
  qword_26AB2E6E8 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)_assetOptionsForClip:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 videoAssetRequiredHTTPHeaders];

  [v4 setObject:v5 forKeyedSubscript:*MEMORY[0x263EFA250]];
  return v4;
}

- (HFCameraClipPlayerItem)initWithClipManager:(id)a3 clip:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (!v8)
  {
    v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"HFCameraClipPlayerItem.m", 50, @"Invalid parameter not satisfying: %@", @"clipManager != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_28:
    v29 = [MEMORY[0x263F08690] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"HFCameraClipPlayerItem.m", 51, @"Invalid parameter not satisfying: %@", @"clip != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v9) {
    goto LABEL_28;
  }
LABEL_3:
  if (+[HFCameraUtilities disableFullQualityVideoCaching](HFCameraUtilities, "disableFullQualityVideoCaching")|| +[HFUtilities isPressDemoModeEnabled])
  {
    v11 = 0;
  }
  else
  {
    v11 = +[HFCameraUtilities videoDestinationURLForCameraClip:v10];
    if ([v11 checkResourceIsReachableAndReturnError:0])
    {
      v25 = HFLogForCategory(0xDuLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = [v11 relativePath];
        v27 = objc_msgSend(v10, "hf_prettyDescription");
        *(_DWORD *)buf = 136315650;
        v33 = "-[HFCameraClipPlayerItem initWithClipManager:clip:]";
        __int16 v34 = 2112;
        v35 = v26;
        __int16 v36 = 2112;
        v37 = v27;
        _os_log_impl(&dword_20B986000, v25, OS_LOG_TYPE_DEFAULT, "%s instantiating with cached file: %@; clip: %@",
          buf,
          0x20u);
      }
      [(HFCameraClipPlayerItem *)self setIsUsingCachedVideoOnDisk:1];
    }
  }
  if ([(HFCameraClipPlayerItem *)self isUsingCachedVideoOnDisk])
  {
    v12 = 0;
  }
  else
  {
    uint64_t v13 = [(id)objc_opt_class() playlistURL];

    v12 = [(id)objc_opt_class() _assetOptionsForClip:v10];
    v14 = HFLogForCategory(0xDuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v10, "hf_prettyDescription");
      *(_DWORD *)buf = 136315394;
      v33 = "-[HFCameraClipPlayerItem initWithClipManager:clip:]";
      __int16 v34 = 2112;
      v35 = v15;
      _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "%s: instantiating with HLS playlist for clip: %@", buf, 0x16u);
    }
    v11 = (void *)v13;
  }
  if (+[HFUtilities isPressDemoModeEnabled])
  {
    uint64_t v16 = [v10 clipURL];

    v12 = 0;
    v11 = (void *)v16;
  }
  v17 = (void *)[objc_alloc(MEMORY[0x263EFA8D0]) initWithURL:v11 options:v12];
  if ([(HFCameraClipPlayerItem *)self isUsingCachedVideoOnDisk])
  {
    id v18 = 0;
  }
  else
  {
    if (qword_26AB2E6F0 != -1) {
      dispatch_once(&qword_26AB2E6F0, &__block_literal_global_25_3);
    }
    id v18 = (id)qword_26AB2E6F8;
  }
  v31 = @"duration";
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
  v30.receiver = self;
  v30.super_class = (Class)HFCameraClipPlayerItem;
  v20 = [(HFCameraClipPlayerItem *)&v30 initWithAsset:v17 automaticallyLoadedAssetKeys:v19];

  if (v20)
  {
    if (![(HFCameraClipPlayerItem *)v20 isUsingCachedVideoOnDisk])
    {
      v21 = [v17 resourceLoader];
      [v21 setDelegate:v20 queue:v18];

      objc_storeStrong((id *)&v20->_resourceLoaderQueue, v18);
      uint64_t v22 = +[HFCameraClipVideoAssetContextProvider defaultProvider];
      videoContextProvider = v20->_videoContextProvider;
      v20->_videoContextProvider = (HFCameraClipVideoAssetContextProvider *)v22;
    }
    objc_storeStrong((id *)&v20->_clipManager, a3);
    objc_storeStrong((id *)&v20->_clip, a4);
  }

  return v20;
}

void __51__HFCameraClipPlayerItem_initWithClipManager_clip___block_invoke_2()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.Home.cameraClipPlayerResourceLoaderQueue", v2);
  uint64_t v1 = (void *)qword_26AB2E6F8;
  qword_26AB2E6F8 = (uint64_t)v0;
}

- (BOOL)isPlayable
{
  v2 = [(HFCameraClipPlayerItem *)self error];
  BOOL v3 = v2 == 0;

  return v3;
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(HFCameraClipPlayerItem *)self clip];
    v10 = [v9 uniqueIdentifier];
    v11 = [v7 request];
    *(_DWORD *)buf = 138412802;
    v51 = v10;
    __int16 v52 = 2112;
    id v53 = v6;
    __int16 v54 = 2112;
    v55 = v11;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Received resource loader request for clip %@: %@ loadingRequest:%@", buf, 0x20u);
  }
  v12 = [v7 request];
  uint64_t v13 = [v12 URL];
  v14 = [v13 absoluteString];
  int v15 = [v14 isEqualToString:*MEMORY[0x263F0BB20]];

  if (v15)
  {
    uint64_t v16 = [(HFCameraClipPlayerItem *)self clip];
    v17 = [v16 encryptionKey];

    id v18 = HFLogForCategory(0x17uLL);
    v19 = v18;
    if (!v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v39 = [v7 request];
        v40 = [v39 URL];
        v41 = [(HFCameraClipPlayerItem *)self clip];
        *(_DWORD *)buf = 138412546;
        v51 = v40;
        __int16 v52 = 2112;
        id v53 = v41;
        _os_log_error_impl(&dword_20B986000, v19, OS_LOG_TYPE_ERROR, "Asked to load resource for URL %@ but clip has no encryption key: %@", buf, 0x16u);
      }
      BOOL v37 = 0;
      v17 = v19;
      goto LABEL_19;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [(HFCameraClipPlayerItem *)self clip];
      v21 = [v20 uniqueIdentifier];
      *(_DWORD *)buf = 138412290;
      v51 = v21;
      _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "Returning encryption key for clip:%@", buf, 0xCu);
    }
    uint64_t v22 = *MEMORY[0x263EFA1A0];
    v23 = [v7 contentInformationRequest];
    [v23 setContentType:v22];

    uint64_t v24 = [v17 length];
    v25 = [v7 contentInformationRequest];
    [v25 setContentLength:v24];

    v26 = [v7 dataRequest];
    [v26 respondWithData:v17];

    [v7 finishLoading];
LABEL_10:
    BOOL v37 = 1;
LABEL_19:

    goto LABEL_20;
  }
  v27 = [v7 request];
  v28 = [v27 URL];
  v29 = [(id)objc_opt_class() playlistURL];
  int v30 = [v28 isEqual:v29];

  if (v30)
  {
    v31 = [(HFCameraClipPlayerItem *)self videoContextProvider];
    v32 = [(HFCameraClipPlayerItem *)self clip];
    v33 = [(HFCameraClipPlayerItem *)self clipManager];
    v17 = [v31 fetchVideoAssetContextForClip:v32 clipManager:v33];

    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __81__HFCameraClipPlayerItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke;
    v48[3] = &unk_26408C8C8;
    v48[4] = self;
    id v34 = v7;
    id v49 = v34;
    id v35 = (id)[v17 addFailureBlock:v48];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __81__HFCameraClipPlayerItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_33;
    v45[3] = &unk_264094668;
    id v46 = v34;
    v47 = self;
    id v36 = (id)[v17 addSuccessBlock:v45];

    goto LABEL_10;
  }
  if (!+[HFUtilities isPressDemoModeEnabled])
  {
    v17 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v42 = [v7 request];
      v43 = [v42 URL];
      v44 = [(HFCameraClipPlayerItem *)self clip];
      *(_DWORD *)buf = 138412546;
      v51 = v43;
      __int16 v52 = 2112;
      id v53 = v44;
      _os_log_error_impl(&dword_20B986000, v17, OS_LOG_TYPE_ERROR, "Asked to load resource for unexpected URL %@ for clip: %@", buf, 0x16u);
    }
    BOOL v37 = 0;
    goto LABEL_19;
  }
  BOOL v37 = 1;
LABEL_20:

  return v37;
}

void __81__HFCameraClipPlayerItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = [*(id *)(a1 + 32) clip];
    int v6 = 138412546;
    id v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch video context for clip:%@ with error: %@", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(a1 + 40) finishLoadingWithError:v3];
}

void __81__HFCameraClipPlayerItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_33(uint64_t a1, void *a2)
{
  id v3 = [a2 hlsPlaylist];
  if (!v3)
  {
    v4 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "HLS Playlist was nil", buf, 2u);
    }
  }
  v5 = [*(id *)(a1 + 32) contentInformationRequest];

  if (v5)
  {
    int v6 = [(id)*MEMORY[0x263F1DB70] identifier];
    id v7 = [*(id *)(a1 + 32) contentInformationRequest];
    [v7 setContentType:v6];

    uint64_t v8 = [v3 length];
    id v9 = [*(id *)(a1 + 32) contentInformationRequest];
    [v9 setContentLength:v8];
  }
  uint64_t v10 = [*(id *)(a1 + 32) dataRequest];
  if (v10)
  {
    v14[0] = (id)MEMORY[0x263EF8330];
    v14[1] = (id)3221225472;
    v14[2] = __81__HFCameraClipPlayerItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_34;
    v14[3] = &unk_264094640;
    id v15 = v3;
    id v11 = v10;
    uint64_t v12 = *(void *)(a1 + 40);
    id v16 = v11;
    uint64_t v17 = v12;
    uint64_t v13 = __81__HFCameraClipPlayerItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_34(v14);
    [v11 respondWithData:v13];
  }
  [*(id *)(a1 + 32) finishLoading];
}

id __81__HFCameraClipPlayerItem_resourceLoader_shouldWaitForLoadingOfRequestedResource___block_invoke_34(id *a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int64_t v2 = [a1[4] length];
  uint64_t v3 = [a1[5] requestedOffset];
  if (v2 >= v3) {
    int64_t v2 = v3;
  }
  NSUInteger v4 = [a1[4] length] - v2;
  if (([a1[5] requestsAllDataToEndOfResource] & 1) == 0)
  {
    unint64_t v5 = [a1[5] requestedLength];
    if (v5 < v4) {
      NSUInteger v4 = v5;
    }
  }
  int v6 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = a1[5];
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1[4], "length"));
    v23.location = v2;
    v23.length = v4;
    id v9 = NSStringFromRange(v23);
    uint64_t v10 = [a1[6] clip];
    int v13 = 138413058;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_20B986000, v6, OS_LOG_TYPE_DEFAULT, "dataRequest: %@; playlistData.length: %@; range: %@; clip: %@",
      (uint8_t *)&v13,
      0x2Au);
  }
  id v11 = objc_msgSend(a1[4], "subdataWithRange:", v2, v4);
  return v11;
}

- (void)dealloc
{
  uint64_t v3 = [(HFCameraClipPlayerItem *)self asset];
  NSUInteger v4 = [v3 resourceLoader];
  [v4 setDelegate:0 queue:0];

  v5.receiver = self;
  v5.super_class = (Class)HFCameraClipPlayerItem;
  [(HFCameraClipPlayerItem *)&v5 dealloc];
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x263F58188] builderWithObject:self];
  NSUInteger v4 = [(HFCameraClipPlayerItem *)self clip];
  id v5 = (id)[v3 appendObject:v4 withName:@"clip"];

  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFCameraClipPlayerItem isUsingCachedVideoOnDisk](self, "isUsingCachedVideoOnDisk"), @"usingCachedVideoOnDisk");
  id v7 = [v3 build];

  return (NSString *)v7;
}

- (HMCameraClip)clip
{
  return self->_clip;
}

- (void)setClip:(id)a3
{
}

- (OS_dispatch_queue)resourceLoaderQueue
{
  return self->_resourceLoaderQueue;
}

- (BOOL)isUsingCachedVideoOnDisk
{
  return self->_isUsingCachedVideoOnDisk;
}

- (void)setIsUsingCachedVideoOnDisk:(BOOL)a3
{
  self->_isUsingCachedVideoOnDisk = a3;
}

- (HMCameraClipManager)clipManager
{
  return self->_clipManager;
}

- (void)setClipManager:(id)a3
{
}

- (HFCameraClipVideoAssetContextProvider)videoContextProvider
{
  return self->_videoContextProvider;
}

- (void)setVideoContextProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoContextProvider, 0);
  objc_storeStrong((id *)&self->_clipManager, 0);
  objc_storeStrong((id *)&self->_resourceLoaderQueue, 0);
  objc_storeStrong((id *)&self->_clip, 0);
}

@end