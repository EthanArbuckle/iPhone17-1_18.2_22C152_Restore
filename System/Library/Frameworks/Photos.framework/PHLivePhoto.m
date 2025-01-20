@interface PHLivePhoto
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_photoTimeForLivePhotoWithImageURL:(SEL)a3 videoURL:(id)a4;
+ (BOOL)_canCreateLivePhotoWithURLs:(id)a3 videoComplementMetadata:(id)a4 outError:(id *)a5;
+ (BOOL)_canCreateLoopingLivePhotoWithURLs:(id)a3 videoComplementMetadata:(id)a4 outError:(id *)a5;
+ (BOOL)_identifyResourceURLs:(id)a3 outImageURL:(id *)a4 outVideoURL:(id *)a5 error:(id *)a6;
+ (BOOL)_validateFileURLs:(id)a3 validationOptions:(unint64_t)a4 videoComplementMetadata:(id)a5 outError:(id *)a6;
+ (BOOL)supportsSecureCoding;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (PHLivePhoto)livePhotoWithResourceFileURLs:(id)a3 error:(id *)a4;
+ (PHLivePhoto)livePhotoWithResourceFileURLs:(id)a3 pairingIdentifier:(id)a4 videoDuration:(id *)a5 photoTime:(id *)a6 error:(id *)a7;
+ (PHLivePhoto)livePhotoWithResourceFileURLs:(id)a3 prefersHDR:(BOOL)a4 error:(id *)a5;
+ (PHLivePhoto)livePhotoWithResourceFileURLs:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 skipInstantiatingImageAndAVAsset:(BOOL)a6 error:(id *)a7;
+ (PHLivePhoto)livePhotoWithResourceFileURLs:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 skipValidation:(BOOL)a6 prefersHDR:(BOOL)a7 error:(id *)a8;
+ (PHLivePhotoRequestID)requestLivePhotoWithResourceFileURLs:(NSArray *)fileURLs placeholderImage:(UIImage *)image targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode resultHandler:(void *)resultHandler;
+ (id)_livePhotoWithResourceFileURLs:(id)a3 pairingIdentifier:(id)a4 videoDuration:(id *)a5 photoTime:(id *)a6 targetSize:(CGSize)a7 contentMode:(int64_t)a8 skipValidation:(BOOL)a9 isLooping:(BOOL)a10 skipInstantiatingImageAndAVAsset:(BOOL)a11 prefersHDR:(BOOL)a12 error:(id *)a13;
+ (id)_livePhotoWithResourceFileURLs:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 skipInstantiatingImageAndAVAsset:(BOOL)a6 prefersHDR:(BOOL)a7 error:(id *)a8;
+ (id)_livePhotoWithResourceFileURLs:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 skipValidation:(BOOL)a6 isLooping:(BOOL)a7 skipInstantiatingImageAndAVAsset:(BOOL)a8 prefersHDR:(BOOL)a9 error:(id *)a10;
+ (id)loopingLivePhotoWithResourceFileURLs:(id)a3 skipInstantiatingImageAndAVAsset:(BOOL)a4 error:(id *)a5;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (int)requestLivePhotoWithResourceFileURLs:(id)a3 placeholderImage:(id)a4 targetSize:(CGSize)a5 contentMode:(int64_t)a6 prefersHDR:(BOOL)a7 resultHandler:(id)a8;
+ (void)cancelLivePhotoRequestWithRequestID:(PHLivePhotoRequestID)requestID;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime;
- (AVAsset)videoAsset;
- (AVVideoComposition)videoComposition;
- (BOOL)_synchronouslyLoadImageURL:(id *)a3 videoURL:(id *)a4 error:(id *)a5;
- (BOOL)hasPhotoColorAdjustments;
- (BOOL)prefersHDR;
- (BOOL)skipInstantiatingImageAndAVAsset;
- (CGSize)size;
- (CGSize)targetSize;
- (NSNumber)srlCompensationValue;
- (NSString)assetLocalIdentifier;
- (NSString)assetUUID;
- (NSString)imageTypeIdentifier;
- (NSString)originalFilename;
- (NSString)uniqueIdentifier;
- (NSString)videoTypeIdentifier;
- (NSURL)imageURL;
- (NSURL)videoURL;
- (PHAsset)asset;
- (PHImageManager)imageManager;
- (PHLivePhoto)initWithBundleAtURL:(id)a3;
- (PHLivePhoto)initWithBundleAtURL:(id)a3 prefersHDR:(BOOL)a4;
- (PHLivePhoto)initWithCoder:(id)a3;
- (PHLivePhoto)initWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 videoAsset:(id)a5 photoTime:(id *)a6 asset:(id)a7;
- (PHLivePhoto)initWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 videoAsset:(id)a5 photoTime:(id *)a6 asset:(id)a7 options:(unint64_t)a8;
- (PHLivePhoto)initWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 videoAsset:(id)a5 photoTime:(id *)a6 asset:(id)a7 options:(unint64_t)a8 videoComposition:(id)a9;
- (PHLivePhoto)initWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 videoAsset:(id)a5 photoTime:(id *)a6 assetUUID:(id)a7 options:(unint64_t)a8 videoComposition:(id)a9;
- (PHSandboxExtensionWrapper)imageURLSandboxExtensionWrapper;
- (PHSandboxExtensionWrapper)videoURLSandboxExtensionWrapper;
- (float)audioVolume;
- (id)_imageManager;
- (id)_initWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 videoAsset:(id)a5 photoTime:(id *)a6 asset:(id)a7 assetUUID:(id)a8 options:(unint64_t)a9 videoComposition:(id)a10;
- (id)_initWithImageURL:(id)a3 videoURL:(id)a4 videoComplementMetadata:(id)a5 targetSize:(CGSize)a6 contentMode:(int64_t)a7 prefersHDR:(BOOL)a8;
- (id)_initWithImageURL:(id)a3 videoURL:(id)a4 videoComplementMetadata:(id)a5 targetSize:(CGSize)a6 contentMode:(int64_t)a7 skipInstantiatingImageAndAVAsset:(BOOL)a8 prefersHDR:(BOOL)a9;
- (id)image;
- (id)imageFileLoader;
- (id)videoComplement;
- (id)videoFileLoader;
- (int64_t)contentMode;
- (unint64_t)options;
- (void)_ensureConstituentData;
- (void)_loadConstituentURLsWithNetworkAccessAllowed:(BOOL)a3 completionHandler:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)saveToPhotoLibraryWithCompletionHandler:(id)a3;
- (void)setAudioVolume:(float)a3;
- (void)setImageManager:(id)a3;
- (void)setSkipInstantiatingImageAndAVAsset:(BOOL)a3;
@end

@implementation PHLivePhoto

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageManager);
  objc_storeStrong((id *)&self->_videoURLSandboxExtensionWrapper, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_imageURLSandboxExtensionWrapper, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_videoAsset, 0);
  objc_storeStrong((id *)&self->_assetUUID, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_plImage, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setImageManager:(id)a3
{
}

- (PHImageManager)imageManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageManager);

  return (PHImageManager *)WeakRetained;
}

- (BOOL)prefersHDR
{
  return self->_prefersHDR;
}

- (void)setSkipInstantiatingImageAndAVAsset:(BOOL)a3
{
  self->_skipInstantiatingImageAndAVAsset = a3;
}

- (BOOL)skipInstantiatingImageAndAVAsset
{
  return self->_skipInstantiatingImageAndAVAsset;
}

- (void)setAudioVolume:(float)a3
{
  self->_audioVolume = a3;
}

- (float)audioVolume
{
  return self->_audioVolume;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PHSandboxExtensionWrapper)videoURLSandboxExtensionWrapper
{
  return self->_videoURLSandboxExtensionWrapper;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (PHSandboxExtensionWrapper)imageURLSandboxExtensionWrapper
{
  return self->_imageURLSandboxExtensionWrapper;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (NSString)assetLocalIdentifier
{
  return self->_assetLocalIdentifier;
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (unint64_t)options
{
  return self->_options;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 160);
  return self;
}

- (AVAsset)videoAsset
{
  return self->_videoAsset;
}

- (NSString)assetUUID
{
  return self->_assetUUID;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSNumber)srlCompensationValue
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(PHLivePhoto *)self asset];
  v4 = [(PHLivePhoto *)self imageURL];
  if (!v3)
  {
    v5 = 0;
    goto LABEL_7;
  }
  v5 = [v3 livePhotoSRLCompensationAmount];
  v6 = PLLivePhotoPlaybackGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138543362;
    v15 = v5;
    _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEFAULT, "Read SRL compensation amount %{public}@ from live photo asset.", (uint8_t *)&v14, 0xCu);
  }

  if (!v5)
  {
LABEL_7:
    if (!v4) {
      goto LABEL_15;
    }
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithImageURL:v4 contentType:0 timeZoneLookup:0];
    v8 = PLLivePhotoPlaybackGetLog();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        v15 = 0;
        v10 = "Read SRL compensation amount %{public}@ from live photo image URL.";
        v11 = v9;
        os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
        _os_log_impl(&dword_19B043000, v11, v12, v10, (uint8_t *)&v14, 0xCu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      v15 = v4;
      v10 = "Failed to read SRL compensation metadata from image URL %@.";
      v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }

    v5 = [v7 srlCompensationValue];
  }
LABEL_15:

  return (NSNumber *)v5;
}

- (void)saveToPhotoLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PHLivePhoto_saveToPhotoLibraryWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E58465A8;
  aBlock[4] = self;
  id v11 = v4;
  id v5 = v4;
  v6 = _Block_copy(aBlock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PHLivePhoto_saveToPhotoLibraryWithCompletionHandler___block_invoke_115;
  v8[3] = &unk_1E5846178;
  id v9 = v6;
  id v7 = v6;
  [(PHLivePhoto *)self _loadConstituentURLsWithNetworkAccessAllowed:1 completionHandler:v8];
}

void __55__PHLivePhoto_saveToPhotoLibraryWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  }
  else if ((a2 & 1) == 0)
  {
    id v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEFAULT, "Failed to save Live Photo (%@) to Photo Library: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

void __55__PHLivePhoto_saveToPhotoLibraryWithCompletionHandler___block_invoke_115(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (a2)
  {
    int v9 = [PHPhotoLibrary alloc];
    uint64_t v10 = +[PHPhotoLibrary systemPhotoLibraryURL];
    __int16 v11 = [(PHPhotoLibrary *)v9 initWithPhotoLibraryURL:v10];

    [(PHPhotoLibrary *)v11 openAndWaitWithUpgrade:0 error:0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__PHLivePhoto_saveToPhotoLibraryWithCompletionHandler___block_invoke_2;
    v14[3] = &unk_1E5848DF0;
    id v15 = v7;
    id v16 = v8;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__PHLivePhoto_saveToPhotoLibraryWithCompletionHandler___block_invoke_3;
    v12[3] = &unk_1E58484E0;
    id v13 = *(id *)(a1 + 32);
    [(PHPhotoLibrary *)v11 performChanges:v14 completionHandler:v12];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __55__PHLivePhoto_saveToPhotoLibraryWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = +[PHAssetCreationRequest creationRequestForAsset];
  [v2 addResourceWithType:1 fileURL:*(void *)(a1 + 32) options:0];
  [v2 addResourceWithType:9 fileURL:*(void *)(a1 + 40) options:0];
}

uint64_t __55__PHLivePhoto_saveToPhotoLibraryWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)videoComplement
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  id v14 = 0;
  id v12 = 0;
  BOOL v3 = [(PHLivePhoto *)self _synchronouslyLoadImageURL:&v14 videoURL:&v13 error:&v12];
  id v4 = v14;
  id v5 = v13;
  id v6 = v12;
  if (!v3)
  {
    id v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = self;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Failed to load video complement for Live Photo %@: %@", buf, 0x16u);
    }
  }
  id v8 = [v4 path];
  int v9 = [v5 path];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F8CE20]) initWithPathToVideo:v9 pathToImage:v8];

  return v10;
}

- (void)_loadConstituentURLsWithNetworkAccessAllowed:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = dispatch_group_create();
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__27816;
  v34[4] = __Block_byref_object_dispose__27817;
  id v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__27816;
  v32[4] = __Block_byref_object_dispose__27817;
  id v33 = 0;
  dispatch_group_enter(v7);
  id v8 = [(PHLivePhoto *)self imageFileLoader];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __78__PHLivePhoto__loadConstituentURLsWithNetworkAccessAllowed_completionHandler___block_invoke;
  v28[3] = &unk_1E5846128;
  v30 = v34;
  v31 = v32;
  int v9 = v7;
  v29 = v9;
  ((void (**)(void, BOOL, void, void *))v8)[2](v8, v4, 0, v28);

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__27816;
  v26[4] = __Block_byref_object_dispose__27817;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__27816;
  v24[4] = __Block_byref_object_dispose__27817;
  id v25 = 0;
  dispatch_group_enter(v9);
  uint64_t v10 = [(PHLivePhoto *)self videoFileLoader];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __78__PHLivePhoto__loadConstituentURLsWithNetworkAccessAllowed_completionHandler___block_invoke_2;
  v20[3] = &unk_1E5846128;
  v22 = v26;
  v23 = v24;
  __int16 v11 = v9;
  v21 = v11;
  ((void (**)(void, BOOL, void, void *))v10)[2](v10, v4, 0, v20);

  id v12 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PHLivePhoto__loadConstituentURLsWithNetworkAccessAllowed_completionHandler___block_invoke_3;
  block[3] = &unk_1E5846150;
  __int16 v17 = v26;
  id v18 = v32;
  uint64_t v19 = v24;
  id v15 = v6;
  id v16 = v34;
  id v13 = v6;
  dispatch_group_notify(v11, v12, block);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
}

void __78__PHLivePhoto__loadConstituentURLsWithNetworkAccessAllowed_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __78__PHLivePhoto__loadConstituentURLsWithNetworkAccessAllowed_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void *__78__PHLivePhoto__loadConstituentURLsWithNetworkAccessAllowed_completionHandler___block_invoke_3(void *result)
{
  if (*(void *)(*(void *)(result[5] + 8) + 40)) {
    BOOL v1 = *(void *)(*(void *)(result[6] + 8) + 40) != 0;
  }
  else {
    BOOL v1 = 0;
  }
  uint64_t v2 = result[4];
  if (v2) {
    return (void *)(*(uint64_t (**)(void, BOOL))(v2 + 16))(result[4], v1);
  }
  return result;
}

- (id)_imageManager
{
  uint64_t v2 = [(PHLivePhoto *)self imageManager];
  if (!v2)
  {
    uint64_t v2 = +[PHImageManager defaultManager];
  }

  return v2;
}

- (PHAsset)asset
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = self->_asset;
  if (!v3)
  {
    BOOL v3 = [(PHLivePhoto *)self assetUUID];

    if (v3)
    {
      BOOL v4 = [(PHLivePhoto *)self assetUUID];
      id v5 = +[PHObject localIdentifierWithUUID:v4];

      if (v5)
      {
        id v6 = +[PHPhotoLibrary sharedPhotoLibrary];
        v11[0] = v5;
        uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
        id v8 = [v6 librarySpecificFetchOptions];
        uint64_t v9 = +[PHAsset fetchAssetsWithLocalIdentifiers:v7 options:v8];
        BOOL v3 = [v9 firstObject];
      }
      else
      {
        BOOL v3 = 0;
      }
    }
  }

  return v3;
}

- (id)videoFileLoader
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__PHLivePhoto_videoFileLoader__block_invoke;
  aBlock[3] = &unk_1E5846100;
  aBlock[4] = self;
  uint64_t v2 = _Block_copy(aBlock);
  BOOL v3 = _Block_copy(v2);

  return v3;
}

void __30__PHLivePhoto_videoFileLoader__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) videoURL];
  if (v9)
  {
    if (v8) {
      v8[2](v8, v9, 0);
    }
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) _imageManager];
    id v11 = [*(id *)(a1 + 32) asset];
    id v12 = objc_alloc_init(PHVideoRequestOptions);
    [(PHVideoRequestOptions *)v12 setNetworkAccessAllowed:a2];
    if (v7)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __30__PHLivePhoto_videoFileLoader__block_invoke_2;
      v15[3] = &unk_1E58472C8;
      id v16 = v7;
      [(PHVideoRequestOptions *)v12 setProgressHandler:v15];
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __30__PHLivePhoto_videoFileLoader__block_invoke_3;
    v13[3] = &unk_1E5846FA0;
    id v14 = v8;
    [v10 requestURLForVideo:v11 options:v12 resultHandler:v13];
  }
}

uint64_t __30__PHLivePhoto_videoFileLoader__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __30__PHLivePhoto_videoFileLoader__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v14 = a3;
  id v5 = (objc_class *)MEMORY[0x1E4F8B9D0];
  id v6 = a2;
  id v7 = [v5 alloc];
  id v8 = [v14 objectForKeyedSubscript:@"PHImageFileSandboxExtensionTokenKey"];
  uint64_t v9 = [v7 initWithURL:v6 sandboxExtensionToken:v8 consume:1];

  uint64_t v10 = [v14 objectForKeyedSubscript:@"PHImageErrorKey"];
  if (!(v9 | v10))
  {
    id v11 = [v14 objectForKeyedSubscript:@"PHImageResultIsInCloudKey"];
    int v12 = [v11 BOOLValue];

    if (v12)
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3164, @"resource not available locally, retry with network access allowed");
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  if (!(v9 | v10))
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"resource not available");
  }
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v13, v9, v10);
  }
}

- (id)imageFileLoader
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__PHLivePhoto_imageFileLoader__block_invoke;
  aBlock[3] = &unk_1E5846100;
  aBlock[4] = self;
  uint64_t v2 = _Block_copy(aBlock);
  BOOL v3 = _Block_copy(v2);

  return v3;
}

void __30__PHLivePhoto_imageFileLoader__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) imageURL];
  if (v9)
  {
    if (v8) {
      v8[2](v8, v9, 0);
    }
  }
  else
  {
    uint64_t v10 = [*(id *)(a1 + 32) _imageManager];
    id v11 = [*(id *)(a1 + 32) asset];
    int v12 = objc_alloc_init(PHImageRequestOptions);
    [(PHImageRequestOptions *)v12 setNetworkAccessAllowed:a2];
    [(PHImageRequestOptions *)v12 setSynchronous:1];
    if (v7)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __30__PHLivePhoto_imageFileLoader__block_invoke_2;
      v15[3] = &unk_1E58472C8;
      id v16 = v7;
      [(PHImageRequestOptions *)v12 setProgressHandler:v15];
    }
    [(PHImageRequestOptions *)v12 setLoadingMode:0x10000];
    [(PHImageRequestOptions *)v12 setDeliveryMode:1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __30__PHLivePhoto_imageFileLoader__block_invoke_3;
    v13[3] = &unk_1E58460D8;
    id v14 = v8;
    objc_msgSend(v10, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v11, 0, v12, v13, -1.0, -1.0);
  }
}

uint64_t __30__PHLivePhoto_imageFileLoader__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __30__PHLivePhoto_imageFileLoader__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F8B9D0]);
  id v5 = [v12 objectForKeyedSubscript:@"PHImageFileURLKey"];
  id v6 = [v12 objectForKeyedSubscript:@"PHImageFileSandboxExtensionTokenKey"];
  uint64_t v7 = [v4 initWithURL:v5 sandboxExtensionToken:v6 consume:1];

  uint64_t v8 = [v12 objectForKeyedSubscript:@"PHImageErrorKey"];
  if (!(v7 | v8))
  {
    uint64_t v9 = [v12 objectForKeyedSubscript:@"PHImageResultIsInCloudKey"];
    int v10 = [v9 BOOLValue];

    if (v10)
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3164, @"resource not available locally, retry with network access allowed");
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  if (!(v7 | v8))
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"resource not available");
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, v7, v8);
  }
}

- (NSString)videoTypeIdentifier
{
  return (NSString *)[(id)*MEMORY[0x1E4F44490] identifier];
}

- (NSString)imageTypeIdentifier
{
  BOOL v3 = [(PHLivePhoto *)self imageURL];
  id v4 = v3;
  if (v3)
  {
    id v5 = (void *)MEMORY[0x1E4F442D8];
    id v6 = [v3 pathExtension];
    uint64_t v7 = [v5 typeWithFilenameExtension:v6 conformingToType:*MEMORY[0x1E4F44400]];
    uint64_t v8 = [v7 identifier];
  }
  else
  {
    id v6 = [(PHLivePhoto *)self asset];
    uint64_t v8 = [v6 uniformTypeIdentifier];
  }

  return (NSString *)v8;
}

- (NSString)originalFilename
{
  BOOL v3 = [(PHLivePhoto *)self imageURL];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 lastPathComponent];
    [v5 stringByDeletingPathExtension];
  }
  else
  {
    id v5 = [(PHLivePhoto *)self asset];
    [v5 filename];
  id v6 = };

  return (NSString *)v6;
}

- (BOOL)hasPhotoColorAdjustments
{
  return self->_options & 1;
}

- (NSString)uniqueIdentifier
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uniqueIdentifier = v2->_uniqueIdentifier;
  if (!uniqueIdentifier)
  {
    id v4 = [(id)objc_opt_class() description];
    id v5 = [MEMORY[0x1E4F29128] UUID];
    id v6 = [v5 UUIDString];
    uint64_t v7 = [v4 stringByAppendingFormat:@"-%@", v6];
    uint64_t v8 = v2->_uniqueIdentifier;
    v2->_uniqueIdentifier = (NSString *)v7;

    uniqueIdentifier = v2->_uniqueIdentifier;
  }
  uint64_t v9 = uniqueIdentifier;
  objc_sync_exit(v2);

  return v9;
}

- (void)_ensureConstituentData
{
  if (!self->_skipInstantiatingImageAndAVAsset)
  {
    if (!self->_plImage)
    {
      BOOL v3 = [(PHLivePhoto *)self imageURL];

      if (v3)
      {
        id v4 = [(PHLivePhoto *)self imageURL];
        [(PHLivePhoto *)self prefersHDR];
        id v5 = DCIM_newPLImageWithContentsOfFileURL();
        plImage = self->_plImage;
        self->_plImage = v5;
      }
    }
    if (!self->_videoAsset)
    {
      uint64_t v7 = [(PHLivePhoto *)self videoURL];
      if (v7)
      {
        uint64_t v8 = [MEMORY[0x1E4F16330] assetWithURL:v7];
        videoAsset = self->_videoAsset;
        self->_videoAsset = v8;
      }
    }
  }
  if ((self->_photoTime.flags & 0x1D) != 1)
  {
    +[PHLivePhoto _photoTimeForLivePhotoWithImageURL:self->_imageURL videoURL:self->_videoURL];
    *(_OWORD *)&self->_photoTime.value = v10;
    self->_photoTime.epoch = v11;
  }
}

- (id)image
{
  return self->_plImage;
}

- (BOOL)_synchronouslyLoadImageURL:(id *)a3 videoURL:(id *)a4 error:(id *)a5
{
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__27816;
  id v35 = __Block_byref_object_dispose__27817;
  id v36 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__27816;
  v29 = __Block_byref_object_dispose__27817;
  id v30 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__27816;
  v23 = __Block_byref_object_dispose__27817;
  id v24 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__PHLivePhoto__synchronouslyLoadImageURL_videoURL_error___block_invoke;
  v13[3] = &unk_1E58460B0;
  id v15 = &v37;
  id v16 = &v19;
  __int16 v17 = &v31;
  id v18 = &v25;
  long long v10 = v9;
  id v14 = v10;
  [(PHLivePhoto *)self _loadConstituentURLsWithNetworkAccessAllowed:1 completionHandler:v13];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a3) {
    *a3 = (id) v32[5];
  }
  if (a4) {
    *a4 = (id) v26[5];
  }
  if (a5) {
    *a5 = (id) v20[5];
  }
  char v11 = *((unsigned char *)v38 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  return v11;
}

void __57__PHLivePhoto__synchronouslyLoadImageURL_videoURL_error___block_invoke(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v18 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    uint64_t v13 = a1 + 64;
    id v14 = v10;
  }
  else
  {
    uint64_t v13 = a1 + 48;
    id v14 = v11;
  }
  uint64_t v15 = *(void *)(*(void *)v13 + 8);
  id v16 = v14;
  __int16 v17 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v16;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  id v13 = 0;
  id v11 = 0;
  id v4 = a3;
  BOOL v5 = [(PHLivePhoto *)self _synchronouslyLoadImageURL:&v13 videoURL:&v12 error:&v11];
  id v6 = v13;
  id v7 = v12;
  id v8 = v11;
  if (!v5)
  {
    dispatch_semaphore_t v9 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = self;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Failed to encode Live Photo %@: %@", buf, 0x16u);
    }
  }
  objc_msgSend(v4, "ph_encodeSandboxedURL:forKey:", v6, @"imageURL");
  objc_msgSend(v4, "ph_encodeSandboxedURL:forKey:", v7, @"videoURL");
  objc_msgSend(v4, "encodeCGSize:forKey:", @"targetSize", self->_targetSize.width, self->_targetSize.height);
  [v4 encodeInteger:self->_contentMode forKey:@"contentMode"];
  [v4 encodeInt64:self->_photoTime.value forKey:@"photoTime.value"];
  [v4 encodeInt64:self->_photoTime.timescale forKey:@"photoTime.timescale"];
  [v4 encodeInteger:self->_options forKey:@"options"];
  objc_msgSend(v4, "encodeCGSize:forKey:", @"size", self->_size.width, self->_size.height);
  *(float *)&double v10 = self->_audioVolume;
  [v4 encodeFloat:@"audioVolume" forKey:v10];
}

- (PHLivePhoto)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PHLivePhoto;
  BOOL v5 = [(PHLivePhoto *)&v24 init];
  if (v5)
  {
    id v23 = 0;
    uint64_t v6 = objc_msgSend(v4, "ph_decodeSandboxedURLForKey:sandboxExtensionWrapper:", @"imageURL", &v23);
    id v7 = v23;
    id v8 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v6;

    dispatch_semaphore_t v9 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v7;
    id v10 = v7;

    id v22 = 0;
    uint64_t v11 = objc_msgSend(v4, "ph_decodeSandboxedURLForKey:sandboxExtensionWrapper:", @"videoURL", &v22);
    id v12 = v22;
    id v13 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v11;

    id v14 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v12;

    CMTimeMake(&v21, [v4 decodeInt64ForKey:@"photoTime.value"], objc_msgSend(v4, "decodeInt32ForKey:", @"photoTime.timescale"));
    *(CMTime *)(v5 + 160) = v21;
    [v4 decodeCGSizeForKey:@"targetSize"];
    *((void *)v5 + 18) = v15;
    *((void *)v5 + 19) = v16;
    *((void *)v5 + 14) = [v4 decodeIntegerForKey:@"contentMode"];
    *((void *)v5 + 7) = [v4 decodeIntegerForKey:@"options"];
    [v4 decodeCGSizeForKey:@"size"];
    *((void *)v5 + 16) = v17;
    *((void *)v5 + 17) = v18;
    [v4 decodeFloatForKey:@"audioVolume"];
    *((_DWORD *)v5 + 7) = v19;
    [v5 _ensureConstituentData];
  }
  return (PHLivePhoto *)v5;
}

- (id)_initWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 videoAsset:(id)a5 photoTime:(id *)a6 asset:(id)a7 assetUUID:(id)a8 options:(unint64_t)a9 videoComposition:(id)a10
{
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a10;
  v20 = [(PHLivePhoto *)self init];
  if (v20)
  {
    double Width = (double)CGImageGetWidth(a3);
    double Height = (double)CGImageGetHeight(a3);
    if (a3)
    {
      uint64_t v23 = DCIM_newPLImageWithCGImage();
      plImage = v20->_plImage;
      v20->_plImage = v23;
    }
    else
    {
      plImage = v20->_plImage;
      v20->_plImage = 0;
    }

    v20->_size.double width = Width;
    v20->_size.double height = Height;
    objc_storeStrong((id *)&v20->_videoAsset, a5);
    long long v25 = *(_OWORD *)&a6->var0;
    v20->_photoTime.epoch = a6->var3;
    *(_OWORD *)&v20->_photoTime.value = v25;
    objc_storeStrong((id *)&v20->_asset, a7);
    uint64_t v26 = [v18 copy];
    assetUUID = v20->_assetUUID;
    v20->_assetUUID = (NSString *)v26;

    v20->_options = a9;
    uint64_t v28 = [v19 copy];
    videoComposition = v20->_videoComposition;
    v20->_videoComposition = (AVVideoComposition *)v28;

    v20->_audioVolume = 1.0;
  }

  return v20;
}

- (PHLivePhoto)initWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 videoAsset:(id)a5 photoTime:(id *)a6 assetUUID:(id)a7 options:(unint64_t)a8 videoComposition:(id)a9
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a6;
  return (PHLivePhoto *)[(PHLivePhoto *)self _initWithImage:a3 uiOrientation:a4 videoAsset:a5 photoTime:&v10 asset:0 assetUUID:a7 options:a8 videoComposition:a9];
}

- (PHLivePhoto)initWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 videoAsset:(id)a5 photoTime:(id *)a6 asset:(id)a7 options:(unint64_t)a8 videoComposition:(id)a9
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a6;
  return (PHLivePhoto *)[(PHLivePhoto *)self _initWithImage:a3 uiOrientation:a4 videoAsset:a5 photoTime:&v10 asset:a7 assetUUID:0 options:a8 videoComposition:a9];
}

- (id)_initWithImageURL:(id)a3 videoURL:(id)a4 videoComplementMetadata:(id)a5 targetSize:(CGSize)a6 contentMode:(int64_t)a7 skipInstantiatingImageAndAVAsset:(BOOL)a8 prefersHDR:(BOOL)a9
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  CMTime v21 = [(PHLivePhoto *)self init];
  id v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_imageURL, a3);
    objc_storeStrong((id *)&v22->_videoURL, a4);
    v22->_targetSize.CGFloat width = width;
    v22->_targetSize.CGFloat height = height;
    v22->_contentMode = a7;
    v22->_audioVolume = 1.0;
    v22->_skipInstantiatingImageAndAVAsset = a8;
    v22->_prefersHDR = a9;
    if (v20)
    {
      [v20 imageDisplayTime];
      *(_OWORD *)&v22->_photoTime.value = v26;
      v22->_photoTime.epoch = v27;
    }
    [(PHLivePhoto *)v22 _ensureConstituentData];
    DCIM_sizeFromPLImage();
    v22->_size.CGFloat width = v23;
    v22->_size.CGFloat height = v24;
  }

  return v22;
}

- (id)_initWithImageURL:(id)a3 videoURL:(id)a4 videoComplementMetadata:(id)a5 targetSize:(CGSize)a6 contentMode:(int64_t)a7 prefersHDR:(BOOL)a8
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = [(PHLivePhoto *)self init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_imageURL, a3);
    objc_storeStrong((id *)&v20->_videoURL, a4);
    v20->_targetSize.CGFloat width = width;
    v20->_targetSize.CGFloat height = height;
    v20->_contentMode = a7;
    v20->_audioVolume = 1.0;
    v20->_prefersHDR = a8;
    if (v18)
    {
      [v18 imageDisplayTime];
      *(_OWORD *)&v20->_photoTime.value = v24;
      v20->_photoTime.epoch = v25;
    }
    [(PHLivePhoto *)v20 _ensureConstituentData];
    DCIM_sizeFromPLImage();
    v20->_size.CGFloat width = v21;
    v20->_size.CGFloat height = v22;
  }

  return v20;
}

- (PHLivePhoto)initWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 videoAsset:(id)a5 photoTime:(id *)a6 asset:(id)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a6;
  return [(PHLivePhoto *)self initWithImage:a3 uiOrientation:a4 videoAsset:a5 photoTime:&v8 asset:a7 options:0];
}

- (PHLivePhoto)initWithImage:(CGImage *)a3 uiOrientation:(int64_t)a4 videoAsset:(id)a5 photoTime:(id *)a6 asset:(id)a7 options:(unint64_t)a8
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a6;
  return (PHLivePhoto *)[(PHLivePhoto *)self _initWithImage:a3 uiOrientation:a4 videoAsset:a5 photoTime:&v9 asset:a7 assetUUID:0 options:a8 videoComposition:0];
}

- (PHLivePhoto)initWithBundleAtURL:(id)a3 prefersHDR:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F8CE20];
  id v7 = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = (void *)[[v6 alloc] initWithBundleAtURL:v7];

  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = [v8 imagePath];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [v8 videoPath];
  if ([v9 length] && objc_msgSend(v10, "length"))
  {
    uint64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];
    id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10 isDirectory:0];
    self = (PHLivePhoto *)-[PHLivePhoto _initWithImageURL:videoURL:videoComplementMetadata:targetSize:contentMode:prefersHDR:](self, "_initWithImageURL:videoURL:videoComplementMetadata:targetSize:contentMode:prefersHDR:", v11, v12, 0, 0, v4, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

    id v13 = self;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (PHLivePhoto)initWithBundleAtURL:(id)a3
{
  return [(PHLivePhoto *)self initWithBundleAtURL:a3 prefersHDR:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)_photoTimeForLivePhotoWithImageURL:(SEL)a3 videoURL:(id)a4
{
  id v7 = a5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [a4 path];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = [v7 path];

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  if (v8 && v9)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = (void *)[objc_alloc(MEMORY[0x1E4F8CE20]) initWithPathToVideo:v9 pathToImage:v8];
    uint64_t v11 = v10;
    if (v10)
    {
      [v10 imageDisplayTime];
    }
    else
    {
      long long v13 = 0uLL;
      int64_t v14 = 0;
    }
    *(_OWORD *)&retstr->var0 = v13;
    retstr->var3 = v14;
  }
  return result;
}

+ (BOOL)_validateFileURLs:(id)a3 validationOptions:(unint64_t)a4 videoComplementMetadata:(id)a5 outError:(id *)a6
{
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = objc_alloc_init(PHValidator);
  id v16 = 0;
  BOOL v12 = [(PHValidator *)v11 validateURLs:v10 withOptions:a4 videoComplementMetadata:v9 error:&v16];

  id v13 = v16;
  int64_t v14 = v13;
  if (a6 && !v12) {
    *a6 = v13;
  }

  return v12;
}

+ (BOOL)_canCreateLoopingLivePhotoWithURLs:(id)a3 videoComplementMetadata:(id)a4 outError:(id *)a5
{
  return [a1 _validateFileURLs:a3 validationOptions:2 videoComplementMetadata:a4 outError:a5];
}

+ (BOOL)_canCreateLivePhotoWithURLs:(id)a3 videoComplementMetadata:(id)a4 outError:(id *)a5
{
  return [a1 _validateFileURLs:a3 validationOptions:66 videoComplementMetadata:a4 outError:a5];
}

+ (BOOL)_identifyResourceURLs:(id)a3 outImageURL:(id *)a4 outVideoURL:(id *)a5 error:(id *)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = __Block_byref_object_copy__27816;
  char v40 = __Block_byref_object_dispose__27817;
  id v41 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PHLivePhoto__identifyResourceURLs_outImageURL_outVideoURL_error___block_invoke;
  aBlock[3] = &unk_1E5848C60;
  aBlock[4] = &v36;
  id v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (!v8)
  {

    id v27 = 0;
LABEL_21:
    id v19 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3303, @"Missing image fileURL");
    v7[2](v7, v19);

    id v29 = 0;
    goto LABEL_22;
  }
  id v27 = 0;
  id v29 = 0;
  uint64_t v9 = *(void *)v32;
  uint64_t v10 = *MEMORY[0x1E4F44400];
  uint64_t v28 = *MEMORY[0x1E4F44448];
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v32 != v9) {
        objc_enumerationMutation(obj);
      }
      BOOL v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      id v13 = (void *)MEMORY[0x1E4F442D8];
      int64_t v14 = [v12 pathExtension];
      uint64_t v15 = [v13 typeWithFilenameExtension:v14];

      if (v15)
      {
        if ([v15 conformsToType:v10])
        {
          if (v29)
          {
            id v16 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Multiple image fileURLs");
            v7[2](v7, v16);
          }
          else
          {
            id v29 = v12;
          }
        }
        else if ([v15 conformsToType:v28])
        {
          if (v27)
          {
            id v17 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Multiple video fileURLs");
            v7[2](v7, v17);
          }
          else
          {
            id v27 = v12;
          }
        }
        else
        {
          id v18 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3302, @"Unknown type for fileURL %@", v12);
          v7[2](v7, v18);
        }
      }
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
  }
  while (v8);

  if (!v29) {
    goto LABEL_21;
  }
LABEL_22:
  if (!v27)
  {
    id v20 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3303, @"Missing video fileURL");
    v7[2](v7, v20);
  }
  uint64_t v21 = v37[5];
  if (v21)
  {
    CGFloat v22 = (void *)v37[5];
    a5 = a6;
    if (!a6) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (a4) {
    *a4 = v29;
  }
  CGFloat v22 = v27;
  if (a5) {
LABEL_30:
  }
    *a5 = v22;
LABEL_31:

  _Block_object_dispose(&v36, 8);
  return v21 == 0;
}

void __67__PHLivePhoto__identifyResourceURLs_outImageURL_outVideoURL_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_ERROR, "Failed to create live photo: %@", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (!*(void *)(v5 + 40))
  {
    if (v3)
    {
      id v6 = v3;
      id v7 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v6;
    }
    else
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, 0);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      id v7 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
}

+ (id)_livePhotoWithResourceFileURLs:(id)a3 pairingIdentifier:(id)a4 videoDuration:(id *)a5 photoTime:(id *)a6 targetSize:(CGSize)a7 contentMode:(int64_t)a8 skipValidation:(BOOL)a9 isLooping:(BOOL)a10 skipInstantiatingImageAndAVAsset:(BOOL)a11 prefersHDR:(BOOL)a12 error:(id *)a13
{
  BOOL v48 = a9;
  double height = a7.height;
  double width = a7.width;
  id v19 = a13;
  id v20 = a3;
  id v51 = a4;
  uint64_t v21 = PLPhotoKitGetLog();
  os_signpost_id_t v22 = os_signpost_id_make_with_pointer(v21, v20);

  CGFloat v23 = PLPhotoKitGetLog();
  long long v24 = v23;
  unint64_t v50 = v22 - 1;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "com.apple.photos.photokit.phlivephoto", (const char *)&unk_19B30018E, buf, 2u);
  }
  os_signpost_id_t spid = v22;

  id v60 = 0;
  v61[0] = 0;
  id v59 = 0;
  int v25 = [a1 _identifyResourceURLs:v20 outImageURL:v61 outVideoURL:&v60 error:&v59];
  id v26 = v61[0];
  id v27 = v60;
  id v28 = v59;
  if (v25)
  {
    v46 = (objc_class *)a1;
    id v47 = v27;
    id v29 = (void *)MEMORY[0x1E4F16330];
    id v30 = (void *)MEMORY[0x1E4F1CB10];
    long long v31 = [v27 path];
    long long v32 = [v30 fileURLWithPath:v31];
    uint64_t v33 = [v29 assetWithURL:v32];

    long long v34 = (void *)v33;
    id v58 = v28;
    *(_OWORD *)buf = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    long long v54 = *(_OWORD *)&a6->var0;
    int64_t v55 = a6->var3;
    id v35 = PFVideoComplementMetadataForVideoAVAssetWithKnownValues();
    id v36 = v58;

    if (v35)
    {
      if (a10)
      {
        id v53 = v36;
        uint64_t v37 = &v53;
        uint64_t v38 = v46;
        char v39 = [(objc_class *)v46 _canCreateLoopingLivePhotoWithURLs:v20 videoComplementMetadata:v35 outError:&v53];
      }
      else
      {
        id v52 = v36;
        uint64_t v37 = &v52;
        uint64_t v38 = v46;
        char v39 = [(objc_class *)v46 _canCreateLivePhotoWithURLs:v20 videoComplementMetadata:v35 outError:&v52];
      }
      char v42 = v39;
      unint64_t v41 = v50;
      id v28 = *v37;

      if ((v42 & 1) != 0 || v48)
      {
        id v27 = v47;
        char v40 = objc_msgSend([v38 alloc], "_initWithImageURL:videoURL:videoComplementMetadata:targetSize:contentMode:skipInstantiatingImageAndAVAsset:prefersHDR:", v26, v47, v35, 1, a11, a12, width, height);
        id v19 = a13;
      }
      else
      {
        char v40 = 0;
        id v27 = v47;
        id v19 = a13;
      }
    }
    else
    {
      char v40 = 0;
      id v28 = v36;
      id v27 = v47;
      id v19 = a13;
      unint64_t v41 = v50;
    }
  }
  else
  {
    char v40 = 0;
    unint64_t v41 = v50;
  }
  uint64_t v43 = PLPhotoKitGetLog();
  v44 = v43;
  if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v44, OS_SIGNPOST_INTERVAL_END, spid, "com.apple.photos.photokit.phlivephoto", (const char *)&unk_19B30018E, buf, 2u);
  }

  if (v19) {
    *id v19 = v28;
  }

  return v40;
}

+ (id)_livePhotoWithResourceFileURLs:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 skipValidation:(BOOL)a6 isLooping:(BOOL)a7 skipInstantiatingImageAndAVAsset:(BOOL)a8 prefersHDR:(BOOL)a9 error:(id *)a10
{
  long long v15 = *MEMORY[0x1E4F1F9F8];
  uint64_t v16 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  long long v13 = v15;
  uint64_t v14 = v16;
  BYTE2(v12) = a9;
  BYTE1(v12) = a8;
  LOBYTE(v12) = a7;
  int v10 = objc_msgSend(a1, "_livePhotoWithResourceFileURLs:pairingIdentifier:videoDuration:photoTime:targetSize:contentMode:skipValidation:isLooping:skipInstantiatingImageAndAVAsset:prefersHDR:error:", a3, 0, &v15, &v13, a5, a6, a4.width, a4.height, v12, a10);

  return v10;
}

+ (PHLivePhoto)livePhotoWithResourceFileURLs:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 skipValidation:(BOOL)a6 prefersHDR:(BOOL)a7 error:(id *)a8
{
  return (PHLivePhoto *)objc_msgSend(a1, "_livePhotoWithResourceFileURLs:targetSize:contentMode:skipValidation:isLooping:skipInstantiatingImageAndAVAsset:prefersHDR:error:", a3, a5, a6, 0, 0, a7, a4.width, a4.height, a8);
}

+ (id)_livePhotoWithResourceFileURLs:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 skipInstantiatingImageAndAVAsset:(BOOL)a6 prefersHDR:(BOOL)a7 error:(id *)a8
{
  return (id)objc_msgSend(a1, "_livePhotoWithResourceFileURLs:targetSize:contentMode:skipValidation:isLooping:skipInstantiatingImageAndAVAsset:prefersHDR:error:", a3, 1, 0, 0, a6, a7, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), a8);
}

+ (PHLivePhoto)livePhotoWithResourceFileURLs:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 skipInstantiatingImageAndAVAsset:(BOOL)a6 error:(id *)a7
{
  return (PHLivePhoto *)objc_msgSend(a1, "_livePhotoWithResourceFileURLs:targetSize:contentMode:skipInstantiatingImageAndAVAsset:prefersHDR:error:", a3, 1, a6, 0, a7, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

+ (id)loopingLivePhotoWithResourceFileURLs:(id)a3 skipInstantiatingImageAndAVAsset:(BOOL)a4 error:(id *)a5
{
  return (id)objc_msgSend(a1, "_livePhotoWithResourceFileURLs:targetSize:contentMode:skipValidation:isLooping:skipInstantiatingImageAndAVAsset:prefersHDR:error:", a3, 1, 0, 1, a4, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), a5);
}

+ (PHLivePhoto)livePhotoWithResourceFileURLs:(id)a3 pairingIdentifier:(id)a4 videoDuration:(id *)a5 photoTime:(id *)a6 error:(id *)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a6;
  BYTE2(v9) = 0;
  LOWORD(v9) = 0;
  id v7 = objc_msgSend(a1, "_livePhotoWithResourceFileURLs:pairingIdentifier:videoDuration:photoTime:targetSize:contentMode:skipValidation:isLooping:skipInstantiatingImageAndAVAsset:prefersHDR:error:", a3, a4, &v11, &v10, 1, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v9, a7);

  return (PHLivePhoto *)v7;
}

+ (PHLivePhoto)livePhotoWithResourceFileURLs:(id)a3 prefersHDR:(BOOL)a4 error:(id *)a5
{
  return (PHLivePhoto *)objc_msgSend(a1, "_livePhotoWithResourceFileURLs:targetSize:contentMode:skipInstantiatingImageAndAVAsset:prefersHDR:error:", a3, 1, 0, a4, a5, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

+ (PHLivePhoto)livePhotoWithResourceFileURLs:(id)a3 error:(id *)a4
{
  return (PHLivePhoto *)[a1 livePhotoWithResourceFileURLs:a3 prefersHDR:0 error:a4];
}

+ (void)cancelLivePhotoRequestWithRequestID:(PHLivePhotoRequestID)requestID
{
  if (sOperationsByRequestQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PHLivePhoto_cancelLivePhotoRequestWithRequestID___block_invoke;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    PHLivePhotoRequestID v4 = requestID;
    dispatch_sync((dispatch_queue_t)sOperationsByRequestQueue, block);
  }
}

void __51__PHLivePhoto_cancelLivePhotoRequestWithRequestID___block_invoke(uint64_t a1)
{
  id v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  BOOL v1 = [(id)sCreationOperationsByRequestID objectForKeyedSubscript:v2];
  [v1 cancel];
  [(id)sCreationOperationsByRequestID removeObjectForKey:v2];
}

+ (int)requestLivePhotoWithResourceFileURLs:(id)a3 placeholderImage:(id)a4 targetSize:(CGSize)a5 contentMode:(int64_t)a6 prefersHDR:(BOOL)a7 resultHandler:(id)a8
{
  BOOL v9 = a7;
  double height = a5.height;
  double width = a5.width;
  v45[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  if (requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler__onceToken != -1) {
    dispatch_once(&requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler__onceToken, &__block_literal_global_27933);
  }
  unsigned int add = atomic_fetch_add(sCreationRequestCounter, 1u);
  if (v15)
  {
    id v18 = v15;
    uint64_t v19 = DCIM_CGImageRefFromPLImage();
    uint64_t v20 = MEMORY[0x19F388500](v18);

    uint64_t v21 = [PHLivePhoto alloc];
    long long v42 = *MEMORY[0x1E4F1F9F8];
    uint64_t v43 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    os_signpost_id_t v22 = [(PHLivePhoto *)v21 initWithImage:v19 uiOrientation:v20 videoAsset:0 photoTime:&v42 asset:0];
    v44 = @"PHLivePhotoInfoIsDegradedKey";
    v45[0] = MEMORY[0x1E4F1CC38];
    CGFloat v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_2;
    block[3] = &unk_1E58487E0;
    id v40 = v23;
    id v41 = v16;
    char v39 = v22;
    id v24 = v23;
    int v25 = v22;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  id v26 = [PHLivePhotoCreationOperation alloc];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_3;
  v35[3] = &unk_1E5846088;
  unsigned int v37 = add + 1;
  id v36 = v16;
  id v27 = v16;
  id v28 = -[PHLivePhotoCreationOperation initWithResourceURLs:targetSize:contentMode:prefersHDR:resultHandler:](v26, "initWithResourceURLs:targetSize:contentMode:prefersHDR:resultHandler:", v14, a6, v9, v35, width, height);
  id v29 = sOperationsByRequestQueue;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_6;
  v32[3] = &unk_1E5846BC8;
  unsigned int v34 = add + 1;
  uint64_t v33 = v28;
  id v30 = v28;
  dispatch_sync(v29, v32);
  [(id)requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler__creationOperationQueue addOperation:v30];

  return add + 1;
}

uint64_t __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_4;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    int v17 = *(_DWORD *)(a1 + 40);
    dispatch_sync((dispatch_queue_t)sOperationsByRequestQueue, block);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_5;
  v12[3] = &unk_1E58487E0;
  id v9 = *(id *)(a1 + 32);
  id v14 = v8;
  id v15 = v9;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = (void *)sCreationOperationsByRequestID;
  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  [v2 setObject:v1 forKeyedSubscript:v3];
}

void __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = (void *)sCreationOperationsByRequestID;
  id v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  [v1 removeObjectForKey:v2];
}

uint64_t __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __117__PHLivePhoto_requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  uint64_t v1 = (void *)requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler__creationOperationQueue;
  requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler__creationOperationQueue = (uint64_t)v0;

  [(id)requestLivePhotoWithResourceFileURLs_placeholderImage_targetSize_contentMode_prefersHDR_resultHandler__creationOperationQueue setQualityOfService:25];
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.livephoto.creationoperationsbyid", 0);
  id v3 = (void *)sOperationsByRequestQueue;
  sOperationsByRequestQueue = (uint64_t)v2;

  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = (void *)sCreationOperationsByRequestID;
  sCreationOperationsByRequestID = v4;
}

+ (PHLivePhotoRequestID)requestLivePhotoWithResourceFileURLs:(NSArray *)fileURLs placeholderImage:(UIImage *)image targetSize:(CGSize)targetSize contentMode:(PHImageContentMode)contentMode resultHandler:(void *)resultHandler
{
  return objc_msgSend(a1, "requestLivePhotoWithResourceFileURLs:placeholderImage:targetSize:contentMode:prefersHDR:resultHandler:", fileURLs, image, contentMode, 0, resultHandler, targetSize.width, targetSize.height);
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v8];
  int v10 = PFIsLivePhotoBundleType();

  if (!v10) {
    goto LABEL_15;
  }
  id v11 = v7;
  uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
  id v13 = [v12 UUIDString];
  id v14 = [v13 stringByAppendingPathExtension:*MEMORY[0x1E4F8CED8]];

  id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v16 = [v15 temporaryDirectory];
  int v17 = [v16 URLByAppendingPathComponent:@"live-photo-bundle"];
  id v18 = [v17 URLByAppendingPathComponent:v14];

  uint64_t v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  v57[0] = 0;
  LODWORD(v16) = [v19 createDirectoryAtURL:v18 withIntermediateDirectories:1 attributes:0 error:v57];
  id v20 = v57[0];

  if (!v16)
  {
    id v24 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v59 = (uint64_t)v18;
      __int16 v60 = 2112;
      id v61 = v20;
      _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_ERROR, "Failed to create directory (%@) to unzip bundle: %@", buf, 0x16u);
    }

    goto LABEL_10;
  }
  archive_read_new();
  archive_read_support_format_all();
  archive_read_support_filter_all();
  id v21 = v11;
  [v21 bytes];
  [v21 length];
  if (!archive_read_open_memory())
  {
    archive_write_disk_new();
    archive_write_disk_set_options();
    archive_write_disk_set_standard_lookup();
    int64_t v55 = v14;
    id v56 = v18;
    v57[1] = 0;
    id v53 = a5;
    id v54 = v7;
    id v52 = v8;
LABEL_22:
    int next_header = archive_read_next_header();
    if (next_header)
    {
      int v48 = next_header;
      if (next_header == 1)
      {
LABEL_39:

        archive_write_free();
        archive_read_free();
        if (v48 == 1) {
          int v25 = v56;
        }
        else {
          int v25 = 0;
        }
        goto LABEL_11;
      }
      long long v31 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v49 = archive_error_string();
        *(_DWORD *)buf = 136315138;
        uint64_t v59 = v49;
        _os_log_impl(&dword_19B043000, v31, OS_LOG_TYPE_ERROR, "Failed to read zipped bundle (unable to read header): %s", buf, 0xCu);
      }
LABEL_38:

      goto LABEL_39;
    }
    long long v31 = [NSString stringWithUTF8String:archive_entry_pathname()];
    long long v32 = [v31 pathComponents];
    if ((unint64_t)[v32 count] < 2)
    {
      v45 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v59 = (uint64_t)v32;
        v44 = "Failed to read zipped bundle (invalid path components): %@";
LABEL_35:
        _os_log_impl(&dword_19B043000, v45, OS_LOG_TYPE_ERROR, v44, buf, 0xCu);
      }
    }
    else
    {
      uint64_t v33 = v18;
      id v34 = v20;
      id v35 = NSString;
      id v36 = objc_msgSend(v32, "subarrayWithRange:", 1, objc_msgSend(v32, "count") - 1);
      uint64_t v37 = [v35 pathWithComponents:v36];

      uint64_t v38 = v37;
      char v39 = [v56 URLByAppendingPathComponent:v37];
      id v40 = [v39 path];
      [v40 fileSystemRepresentation];
      archive_entry_set_pathname();

      int v41 = archive_write_header();
      if (v41)
      {
        int v48 = v41;
        unint64_t v50 = PLPhotoKitGetLog();
        id v20 = v34;
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          uint64_t v51 = archive_error_string();
          *(_DWORD *)buf = 136315138;
          uint64_t v59 = v51;
          _os_log_impl(&dword_19B043000, v50, OS_LOG_TYPE_ERROR, "Failed to unzip bundle (unable to write header): %s", buf, 0xCu);
        }

        id v18 = v33;
        a5 = v53;
        id v7 = v54;
        long long v31 = v38;
        id v8 = v52;
        goto LABEL_37;
      }
      id v20 = v34;
      id v18 = v33;
      a5 = v53;
      id v7 = v54;
      long long v31 = v38;
      id v8 = v52;
      do
      {
        memset(&v57[2], 0, 24);
        int data_block = archive_read_data_block();
        if (data_block)
        {
          if (data_block == 1)
          {

            id v14 = v55;
            goto LABEL_22;
          }
          v45 = PLPhotoKitGetLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            uint64_t v43 = archive_error_string();
            *(_DWORD *)buf = 136315138;
            uint64_t v59 = v43;
            v44 = "Failed to read zipped bundle (unable to read data): %s";
            goto LABEL_35;
          }
          goto LABEL_36;
        }
      }
      while (archive_write_data_block() != -1);
      v45 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        uint64_t v47 = archive_error_string();
        *(_DWORD *)buf = 136315138;
        uint64_t v59 = v47;
        v44 = "Failed to unzip bundle (unable to write data): %s";
        goto LABEL_35;
      }
    }
LABEL_36:

    int v48 = -25;
LABEL_37:

    id v14 = v55;
    goto LABEL_38;
  }
  os_signpost_id_t v22 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = archive_error_string();
    *(_DWORD *)buf = 136315138;
    uint64_t v59 = v23;
    _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, "Failed to open zipped bundle: %s", buf, 0xCu);
  }

  archive_read_free();
LABEL_10:
  int v25 = 0;
LABEL_11:
  id v26 = v25;

  if (v26)
  {
    id v27 = [[PHLivePhoto alloc] initWithBundleAtURL:v26];
    if (v27)
    {
      id v28 = v27;

      goto LABEL_18;
    }
  }

LABEL_15:
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, 0);
    id v28 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v28 = 0;
  }
LABEL_18:

  return v28;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v6[1] = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v2 = PFCurrentPlatformLivePhotoBundleType();
  id v3 = [v2 identifier];
  v6[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return (NSArray *)v4;
}

@end