@interface PHContentEditingInputResult
- (BOOL)canHandleAdjustmentData;
- (BOOL)containsValidData;
- (CGImage)imageRef;
- (NSNumber)baseVersionNeeded;
- (NSURL)backSwappingImageRenderURL;
- (NSURL)backSwappingVideoRenderURL;
- (NSURL)frontSwappingImageRenderURL;
- (NSURL)frontSwappingVideoRenderURL;
- (NSURL)overCapturePhotoURL;
- (NSURL)overCaptureVideoURL;
- (PHAdjustmentData)originalAdjustmentData;
- (id)adjustmentData;
- (id)adjustmentSecondaryDataURL;
- (id)cancelledInfoKey;
- (id)description;
- (id)error;
- (id)errorInfoKey;
- (id)exifOrientation;
- (id)flipImageURLs;
- (id)flipVideoURLs;
- (id)imageData;
- (id)imagePropertiesLoadIfNeeded:(BOOL)a3;
- (id)imageSandboxExtensionToken;
- (id)imageURL;
- (id)inCloudInfoKey;
- (id)uniformTypeIdentifier;
- (id)videoAdjustmentData;
- (id)videoSandboxExtensionToken;
- (id)videoURL;
- (void)addAdjustmentDataResult:(id)a3;
- (void)addAdjustmentSecondaryDataResult:(id)a3;
- (void)addFlipImageURL:(id)a3 forAssetResourceType:(int64_t)a4;
- (void)addFlipVideoURL:(id)a3 forAssetResourceType:(int64_t)a4;
- (void)addImageResult:(id)a3;
- (void)addVideoResult:(id)a3;
- (void)clearAdjustmentData;
- (void)mergeInfoDictionaryFromResult:(id)a3;
- (void)setBackSwappingImageRenderURL:(id)a3;
- (void)setBackSwappingVideoRenderURL:(id)a3;
- (void)setBaseVersionNeeded:(id)a3;
- (void)setCanHandleAdjustmentData:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setFrontSwappingImageRenderURL:(id)a3;
- (void)setFrontSwappingVideoRenderURL:(id)a3;
- (void)setOriginalAdjustmentData:(id)a3;
- (void)setOverCapturePhotoURL:(id)a3;
- (void)setOverCaptureVideoURL:(id)a3;
@end

@implementation PHContentEditingInputResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAdjustmentData, 0);
  objc_storeStrong((id *)&self->_backSwappingVideoRenderURL, 0);
  objc_storeStrong((id *)&self->_frontSwappingVideoRenderURL, 0);
  objc_storeStrong((id *)&self->_backSwappingImageRenderURL, 0);
  objc_storeStrong((id *)&self->_frontSwappingImageRenderURL, 0);
  objc_storeStrong((id *)&self->_overCaptureVideoURL, 0);
  objc_storeStrong((id *)&self->_overCapturePhotoURL, 0);
  objc_storeStrong((id *)&self->_baseVersionNeeded, 0);
  objc_storeStrong((id *)&self->_flipVideoURLs, 0);
  objc_storeStrong((id *)&self->_flipImageURLs, 0);
  objc_storeStrong((id *)&self->_adjustmentSecondaryDataResult, 0);
  objc_storeStrong((id *)&self->_videoResult, 0);
  objc_storeStrong((id *)&self->_imageResult, 0);

  objc_storeStrong((id *)&self->_adjustmentData, 0);
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

- (void)setBaseVersionNeeded:(id)a3
{
}

- (NSNumber)baseVersionNeeded
{
  return self->_baseVersionNeeded;
}

- (void)setCanHandleAdjustmentData:(BOOL)a3
{
  self->_canHandleAdjustmentData = a3;
}

- (BOOL)canHandleAdjustmentData
{
  return self->_canHandleAdjustmentData;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PHContentEditingInputResult *)self imageURL];
  v7 = [(PHContentEditingInputResult *)self videoURL];
  v8 = [v3 stringWithFormat:@"<%@ %p> imageURL: %@, videoURL: %@", v5, self, v6, v7];

  return v8;
}

- (void)addFlipVideoURL:(id)a3 forAssetResourceType:(int64_t)a4
{
  id v10 = a3;
  flipVideoURLs = self->_flipVideoURLs;
  if (!flipVideoURLs)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8 = self->_flipVideoURLs;
    self->_flipVideoURLs = v7;

    flipVideoURLs = self->_flipVideoURLs;
  }
  v9 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)flipVideoURLs setObject:v10 forKeyedSubscript:v9];
}

- (void)addFlipImageURL:(id)a3 forAssetResourceType:(int64_t)a4
{
  id v10 = a3;
  flipImageURLs = self->_flipImageURLs;
  if (!flipImageURLs)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8 = self->_flipImageURLs;
    self->_flipImageURLs = v7;

    flipImageURLs = self->_flipImageURLs;
  }
  v9 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)flipImageURLs setObject:v10 forKeyedSubscript:v9];
}

- (id)flipVideoURLs
{
  return self->_flipVideoURLs;
}

- (id)flipImageURLs
{
  return self->_flipImageURLs;
}

- (void)addVideoResult:(id)a3
{
  objc_storeStrong((id *)&self->_videoResult, a3);
  id v5 = a3;
  [(PHContentEditingInputResult *)self mergeInfoDictionaryFromResult:v5];
}

- (void)addImageResult:(id)a3
{
  id v13 = a3;
  if (!self->_imageResult)
  {
    v4 = [PHImageResult alloc];
    id v5 = [v13 info];
    v6 = [v5 objectForKeyedSubscript:@"PHImageResultRequestIDKey"];
    v7 = -[PHCompositeMediaResult initWithRequestID:](v4, "initWithRequestID:", [v6 intValue]);
    imageResult = self->_imageResult;
    self->_imageResult = v7;
  }
  v9 = [v13 imageURL];

  if (v9)
  {
    id v10 = [v13 imageURL];
    [(PHImageResult *)self->_imageResult setImageURL:v10];

    v11 = [v13 uniformTypeIdentifier];
    [(PHImageResult *)self->_imageResult setUniformTypeIdentifier:v11];

    v12 = [v13 exifOrientation];
    [(PHImageResult *)self->_imageResult setExifOrientation:v12];
  }
  if ([v13 imageRef]) {
    -[PHImageResult setImageRef:](self->_imageResult, "setImageRef:", [v13 imageRef]);
  }
  [(PHContentEditingInputResult *)self mergeInfoDictionaryFromResult:v13];
}

- (void)clearAdjustmentData
{
  adjustmentData = self->_adjustmentData;
  self->_adjustmentData = 0;
}

- (void)addAdjustmentSecondaryDataResult:(id)a3
{
  objc_storeStrong((id *)&self->_adjustmentSecondaryDataResult, a3);
  id v5 = a3;
  [(PHContentEditingInputResult *)self mergeInfoDictionaryFromResult:v5];
}

- (void)addAdjustmentDataResult:(id)a3
{
  id v6 = a3;
  v4 = [v6 adjustmentData];
  adjustmentData = self->_adjustmentData;
  self->_adjustmentData = v4;

  [(PHContentEditingInputResult *)self mergeInfoDictionaryFromResult:v6];
}

- (void)mergeInfoDictionaryFromResult:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 error];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(PHContentEditingInputResult *)self error];

    if (!v6)
    {
      v7 = [v8 error];
      [(PHContentEditingInputResult *)self setError:v7];
    }
  }
  if ([v8 isInCloud]) {
    [(PHCompositeMediaResult *)self setIsInCloud:1];
  }
  if ([v8 isCancelled]) {
    [(PHCompositeMediaResult *)self setCancelled:1];
  }
}

- (id)videoSandboxExtensionToken
{
  return [(PHCompositeMediaResult *)self->_videoResult sandboxExtensionToken];
}

- (id)imageSandboxExtensionToken
{
  return [(PHCompositeMediaResult *)self->_imageResult sandboxExtensionToken];
}

- (id)error
{
  return (id)[(NSMutableDictionary *)self->super._mutableInfo objectForKeyedSubscript:@"PHContentEditingInputErrorKey"];
}

- (void)setError:(id)a3
{
}

- (id)imagePropertiesLoadIfNeeded:(BOOL)a3
{
  return [(PHCompositeMediaResult *)self->_imageResult imagePropertiesLoadIfNeeded:a3];
}

- (id)uniformTypeIdentifier
{
  imageResult = self->_imageResult;
  if (imageResult || (imageResult = self->_videoResult) != 0)
  {
    imageResult = [imageResult uniformTypeIdentifier];
  }

  return imageResult;
}

- (id)videoAdjustmentData
{
  return [(PHCompositeMediaResult *)self->_videoResult videoAdjustmentData];
}

- (id)videoURL
{
  return [(PHCompositeMediaResult *)self->_videoResult videoURL];
}

- (id)exifOrientation
{
  return [(PHImageResult *)self->_imageResult exifOrientation];
}

- (id)imageData
{
  return [(PHImageResult *)self->_imageResult imageData];
}

- (id)imageURL
{
  return [(PHImageResult *)self->_imageResult imageURL];
}

- (CGImage)imageRef
{
  return [(PHImageResult *)self->_imageResult imageRef];
}

- (id)adjustmentSecondaryDataURL
{
  return [(PHCompositeMediaResult *)self->_adjustmentSecondaryDataResult adjustmentSecondaryDataURL];
}

- (id)adjustmentData
{
  return self->_adjustmentData;
}

- (id)inCloudInfoKey
{
  v2 = @"PHContentEditingInputResultIsInCloudKey";
  return @"PHContentEditingInputResultIsInCloudKey";
}

- (id)cancelledInfoKey
{
  v2 = @"PHContentEditingInputCancelledKey";
  return @"PHContentEditingInputCancelledKey";
}

- (id)errorInfoKey
{
  v2 = @"PHContentEditingInputErrorKey";
  return @"PHContentEditingInputErrorKey";
}

- (BOOL)containsValidData
{
  imageResult = self->_imageResult;
  if (imageResult)
  {
    int v4 = [(PHImageResult *)imageResult containsValidData];
    videoResult = self->_videoResult;
  }
  else
  {
    videoResult = self->_videoResult;
    if (!videoResult) {
      return 0;
    }
    int v4 = 1;
  }
  if (videoResult) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v4;
  }
  if (videoResult) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    return v6;
  }

  return [(PHCompositeMediaResult *)videoResult containsValidData];
}

@end