@interface PHContentEditingInput
- (AVAsset)audiovisualAsset;
- (BOOL)isMediaSubtype:(unint64_t)a3;
- (CLLocation)location;
- (NSDate)creationDate;
- (NSNumber)originalResourceChoice;
- (NSString)accessibilityDescription;
- (NSString)uniformTypeIdentifier;
- (NSURL)adjustmentSecondaryDataURL;
- (NSURL)appropriateURLForDerivingRenderedContentURLs;
- (NSURL)backSwappingImageRenderURL;
- (NSURL)backSwappingVideoRenderURL;
- (NSURL)frontSwappingImageRenderURL;
- (NSURL)frontSwappingVideoRenderURL;
- (NSURL)fullSizeImageURL;
- (NSURL)overCapturePhotoURL;
- (NSURL)overCaptureVideoURL;
- (NSURL)videoURL;
- (PHAdjustmentData)adjustmentData;
- (PHAdjustmentData)originalAdjustmentData;
- (PHAssetMediaSubtype)mediaSubtypes;
- (PHAssetMediaType)mediaType;
- (PHAssetPlaybackStyle)playbackStyle;
- (PHContentEditingInput)initWithAppropriateURL:(id)a3;
- (PHLivePhoto)livePhoto;
- (UIImage)displaySizeImage;
- (id)audioMix;
- (id)description;
- (id)videoComposition;
- (int)fullSizeImageOrientation;
- (int64_t)baseVersion;
- (void)_invalidateAVAsset;
- (void)consumeSandboxExtensionToken:(id)a3;
- (void)dealloc;
- (void)loadFullSizeImageDataWithCompletionHandler:(id)a3;
- (void)requestFullSizeImageURLWithCompletionHandler:(id)a3;
- (void)setAccessibilityDescription:(id)a3;
- (void)setAdjustmentData:(id)a3;
- (void)setAdjustmentSecondaryDataURL:(id)a3;
- (void)setBackSwappingImageRenderURL:(id)a3;
- (void)setBackSwappingVideoRenderURL:(id)a3;
- (void)setBaseVersion:(int64_t)a3;
- (void)setCreationDate:(id)a3;
- (void)setDisplaySizeImage:(id)a3;
- (void)setFrontSwappingImageRenderURL:(id)a3;
- (void)setFrontSwappingVideoRenderURL:(id)a3;
- (void)setFullSizeImageOrientation:(int)a3;
- (void)setFullSizeImageURL:(id)a3;
- (void)setLivePhoto:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMediaSubtypes:(unint64_t)a3;
- (void)setMediaType:(int64_t)a3;
- (void)setOriginalAdjustmentData:(id)a3;
- (void)setOriginalResourceChoice:(id)a3;
- (void)setOverCapturePhotoURL:(id)a3;
- (void)setOverCaptureVideoURL:(id)a3;
- (void)setPlaybackStyle:(int64_t)a3;
- (void)setUniformTypeIdentifier:(id)a3;
- (void)setVideoURL:(id)a3;
@end

@implementation PHContentEditingInput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appropriateURLForDerivingRenderedContentURLs, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_adjustmentSecondaryDataURL, 0);
  objc_storeStrong((id *)&self->_originalAdjustmentData, 0);
  objc_storeStrong((id *)&self->_backSwappingVideoRenderURL, 0);
  objc_storeStrong((id *)&self->_frontSwappingVideoRenderURL, 0);
  objc_storeStrong((id *)&self->_backSwappingImageRenderURL, 0);
  objc_storeStrong((id *)&self->_frontSwappingImageRenderURL, 0);
  objc_storeStrong((id *)&self->_overCaptureVideoURL, 0);
  objc_storeStrong((id *)&self->_overCapturePhotoURL, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_originalResourceChoice, 0);
  objc_storeStrong((id *)&self->_livePhoto, 0);
  objc_storeStrong((id *)&self->_fullSizeImageURL, 0);
  objc_storeStrong((id *)&self->_displaySizeImage, 0);
  objc_storeStrong((id *)&self->_adjustmentData, 0);
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_avAsset, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionHandles, 0);

  objc_storeStrong((id *)&self->_avAssetIsolationQueue, 0);
}

- (NSURL)appropriateURLForDerivingRenderedContentURLs
{
  return self->_appropriateURLForDerivingRenderedContentURLs;
}

- (void)setAccessibilityDescription:(id)a3
{
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAdjustmentSecondaryDataURL:(id)a3
{
}

- (NSURL)adjustmentSecondaryDataURL
{
  return self->_adjustmentSecondaryDataURL;
}

- (void)setOriginalAdjustmentData:(id)a3
{
}

- (PHAdjustmentData)originalAdjustmentData
{
  return self->_originalAdjustmentData;
}

- (void)setBackSwappingVideoRenderURL:(id)a3
{
}

- (NSURL)backSwappingVideoRenderURL
{
  return self->_backSwappingVideoRenderURL;
}

- (void)setFrontSwappingVideoRenderURL:(id)a3
{
}

- (NSURL)frontSwappingVideoRenderURL
{
  return self->_frontSwappingVideoRenderURL;
}

- (void)setBackSwappingImageRenderURL:(id)a3
{
}

- (NSURL)backSwappingImageRenderURL
{
  return self->_backSwappingImageRenderURL;
}

- (void)setFrontSwappingImageRenderURL:(id)a3
{
}

- (NSURL)frontSwappingImageRenderURL
{
  return self->_frontSwappingImageRenderURL;
}

- (void)setOverCaptureVideoURL:(id)a3
{
}

- (NSURL)overCaptureVideoURL
{
  return self->_overCaptureVideoURL;
}

- (void)setOverCapturePhotoURL:(id)a3
{
}

- (NSURL)overCapturePhotoURL
{
  return self->_overCapturePhotoURL;
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setOriginalResourceChoice:(id)a3
{
}

- (NSNumber)originalResourceChoice
{
  return self->_originalResourceChoice;
}

- (void)setBaseVersion:(int64_t)a3
{
  self->_baseVersion = a3;
}

- (int64_t)baseVersion
{
  return self->_baseVersion;
}

- (void)setLivePhoto:(id)a3
{
}

- (PHLivePhoto)livePhoto
{
  return self->_livePhoto;
}

- (void)setFullSizeImageOrientation:(int)a3
{
  self->_fullSizeImageOrientation = a3;
}

- (int)fullSizeImageOrientation
{
  return self->_fullSizeImageOrientation;
}

- (void)setFullSizeImageURL:(id)a3
{
}

- (NSURL)fullSizeImageURL
{
  return self->_fullSizeImageURL;
}

- (void)setDisplaySizeImage:(id)a3
{
}

- (UIImage)displaySizeImage
{
  return self->_displaySizeImage;
}

- (void)setAdjustmentData:(id)a3
{
}

- (PHAdjustmentData)adjustmentData
{
  return self->_adjustmentData;
}

- (void)setPlaybackStyle:(int64_t)a3
{
  self->_playbackStyle = a3;
}

- (PHAssetPlaybackStyle)playbackStyle
{
  return self->_playbackStyle;
}

- (void)setUniformTypeIdentifier:(id)a3
{
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void)setLocation:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setMediaSubtypes:(unint64_t)a3
{
  self->_mediaSubtypes = a3;
}

- (PHAssetMediaSubtype)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (PHAssetMediaType)mediaType
{
  return self->_mediaType;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)PHContentEditingInput;
  v3 = [(PHContentEditingInput *)&v11 description];
  PHAssetMediaType v4 = [(PHContentEditingInput *)self mediaType];
  PHAssetMediaSubtype v5 = [(PHContentEditingInput *)self mediaSubtypes];
  v6 = [(PHContentEditingInput *)self creationDate];
  v7 = [(PHContentEditingInput *)self location];
  v8 = [(PHContentEditingInput *)self adjustmentData];
  v9 = [v3 stringByAppendingFormat:@" mediaType=%ld/%ld, creationDate=%@, location=%d, adjustmentData=%@", v4, v5, v6, v7 != 0, v8];

  return v9;
}

- (void)_invalidateAVAsset
{
}

void __43__PHContentEditingInput__invalidateAVAsset__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 removeObserver:*(void *)(a1 + 32) name:*MEMORY[0x1E4F157A8] object:*(void *)(*(void *)(a1 + 32) + 32)];

    uint64_t v3 = *(void *)(a1 + 32);
    PHAssetMediaType v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;
  }
}

- (AVAsset)audiovisualAsset
{
  uint64_t v4 = 0;
  PHAssetMediaSubtype v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__36690;
  v8 = __Block_byref_object_dispose__36691;
  id v9 = 0;
  pl_dispatch_sync();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (AVAsset *)v2;
}

void __41__PHContentEditingInput_audiovisualAsset__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[4];
  if (!v3)
  {
    uint64_t v4 = [v2 videoURL];
    if (v4)
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F166C8]) initWithURL:v4 options:0];
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = *(void **)(v6 + 32);
      *(void *)(v6 + 32) = v5;

      v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:*(void *)(a1 + 32) selector:sel__invalidateAVAsset name:*MEMORY[0x1E4F157A8] object:*(void *)(*(void *)(a1 + 32) + 32)];
    }
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  id v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  objc_storeStrong(v9, v3);
}

- (void)setVideoURL:(id)a3
{
  uint64_t v4 = (NSURL *)a3;
  uint64_t v5 = v4;
  if (self->_videoURL != v4)
  {
    id v9 = v4;
    char v6 = -[NSURL isEqual:](v4, "isEqual:");
    uint64_t v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (NSURL *)[(NSURL *)v9 copy];
      videoURL = self->_videoURL;
      self->_videoURL = v7;

      [(PHContentEditingInput *)self _invalidateAVAsset];
      uint64_t v5 = v9;
    }
  }
}

- (void)consumeSandboxExtensionToken:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (!self->_sandboxExtensionHandles)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    sandboxExtensionHandles = self->_sandboxExtensionHandles;
    self->_sandboxExtensionHandles = v5;

    id v4 = v9;
  }
  if ([v4 length])
  {
    v7 = NSNumber;
    [v9 UTF8String];
    v8 = [v7 numberWithLongLong:sandbox_extension_consume()];
    [(NSMutableArray *)self->_sandboxExtensionHandles addObject:v8];
  }
}

- (void)requestFullSizeImageURLWithCompletionHandler:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = [(PHContentEditingInput *)self fullSizeImageURL];
    (*((void (**)(id, id, void))a3 + 2))(v5, v6, [(PHContentEditingInput *)self fullSizeImageOrientation]);
  }
}

- (id)videoComposition
{
  return 0;
}

- (id)audioMix
{
  return 0;
}

- (void)loadFullSizeImageDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PHContentEditingInput_loadFullSizeImageDataWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5847318;
  id v7 = v4;
  id v5 = v4;
  [(PHContentEditingInput *)self requestFullSizeImageURLWithCompletionHandler:v6];
}

void __68__PHContentEditingInput_loadFullSizeImageDataWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a2 options:1 error:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isMediaSubtype:(unint64_t)a3
{
  return (a3 & ~self->_mediaSubtypes) == 0;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_sandboxExtensionHandles;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v7) integerValue];
        sandbox_extension_release();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self];

  v9.receiver = self;
  v9.super_class = (Class)PHContentEditingInput;
  [(PHContentEditingInput *)&v9 dealloc];
}

- (PHContentEditingInput)initWithAppropriateURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHContentEditingInput;
  uint64_t v6 = [(PHContentEditingInput *)&v10 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.photos.contenteditinginput.avasset", 0);
    avAssetIsolationQueue = v6->_avAssetIsolationQueue;
    v6->_avAssetIsolationQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_appropriateURLForDerivingRenderedContentURLs, a3);
  }

  return v6;
}

@end