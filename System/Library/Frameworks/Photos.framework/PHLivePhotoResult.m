@interface PHLivePhotoResult
- (BOOL)containsValidData;
- (BOOL)isDegraded;
- (BOOL)isPlaceholder;
- (CGImage)imageRef;
- (id)allowedInfoKeys;
- (id)exifOrientation;
- (id)imageData;
- (id)imageURL;
- (id)sanitizedInfoDictionary;
- (id)uniformTypeIdentifier;
- (id)videoAdjustmentData;
- (id)videoURL;
- (int64_t)uiOrientation;
- (unsigned)cgOrientation;
- (void)_mergeInfoDictionaryFromResult:(id)a3;
- (void)addImageResult:(id)a3;
- (void)addVideoResult:(id)a3;
- (void)setDegraded:(BOOL)a3;
- (void)setRequiresImageResult:(BOOL)a3;
@end

@implementation PHLivePhotoResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoResult, 0);

  objc_storeStrong((id *)&self->_imageResult, 0);
}

- (void)addVideoResult:(id)a3
{
  id v5 = a3;
  if (self->_videoResult)
  {
    v6 = PLImageManagerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Cannot set more than 1 video on a live photo result", v7, 2u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_videoResult, a3);
    [(PHLivePhotoResult *)self _mergeInfoDictionaryFromResult:v5];
  }
}

- (void)addImageResult:(id)a3
{
  id v5 = a3;
  if (self->_imageResult)
  {
    v6 = PLImageManagerGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Cannot set more than 1 image on a live photo result", v7, 2u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_imageResult, a3);
    [(PHLivePhotoResult *)self _mergeInfoDictionaryFromResult:v5];
  }
}

- (void)_mergeInfoDictionaryFromResult:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 error];
  if (v4)
  {
    id v5 = (void *)v4;
    v6 = [(PHCompositeMediaResult *)self error];

    if (!v6)
    {
      v7 = [v8 error];
      [(PHCompositeMediaResult *)self setError:v7];
    }
  }
  if ([v8 isInCloud]) {
    [(PHCompositeMediaResult *)self setIsInCloud:1];
  }
  if ([v8 isCancelled]) {
    [(PHCompositeMediaResult *)self setCancelled:1];
  }
}

- (void)setRequiresImageResult:(BOOL)a3
{
  self->_requiresImageResult = a3;
}

- (BOOL)isDegraded
{
  return self->_isDegraded;
}

- (void)setDegraded:(BOOL)a3
{
  self->_isDegraded = a3;
}

- (BOOL)isPlaceholder
{
  return [(PHCompositeMediaResult *)self->_imageResult isPlaceholder];
}

- (id)uniformTypeIdentifier
{
  return [(PHCompositeMediaResult *)self->_imageResult uniformTypeIdentifier];
}

- (id)videoAdjustmentData
{
  return [(PHCompositeMediaResult *)self->_videoResult videoAdjustmentData];
}

- (id)videoURL
{
  return [(PHCompositeMediaResult *)self->_videoResult videoURL];
}

- (unsigned)cgOrientation
{
  return [(PHCompositeMediaResult *)self->_imageResult cgOrientation];
}

- (int64_t)uiOrientation
{
  return [(PHCompositeMediaResult *)self->_imageResult uiOrientation];
}

- (id)exifOrientation
{
  return [(PHCompositeMediaResult *)self->_imageResult exifOrientation];
}

- (id)imageData
{
  return [(PHCompositeMediaResult *)self->_imageResult imageData];
}

- (id)imageURL
{
  return [(PHCompositeMediaResult *)self->_imageResult imageURL];
}

- (CGImage)imageRef
{
  return [(PHCompositeMediaResult *)self->_imageResult imageRef];
}

- (id)sanitizedInfoDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)PHLivePhotoResult;
  v3 = [(PHCompositeMediaResult *)&v6 sanitizedInfoDictionary];
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[PHLivePhotoResult isDegraded](self, "isDegraded"));
  [v3 setObject:v4 forKeyedSubscript:@"PHImageResultIsDegradedKey"];

  return v3;
}

- (id)allowedInfoKeys
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PHLivePhotoResult_allowedInfoKeys__block_invoke;
  block[3] = &unk_1E5848578;
  block[4] = self;
  if (allowedInfoKeys_onceToken_37659 != -1) {
    dispatch_once(&allowedInfoKeys_onceToken_37659, block);
  }
  return (id)allowedInfoKeys_allowedKeys_37660;
}

void __36__PHLivePhotoResult_allowedInfoKeys__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)PHLivePhotoResult;
  v3 = objc_msgSendSuper2(&v7, sel_allowedInfoKeys);
  uint64_t v4 = (void *)[v2 initWithSet:v3];

  v8[0] = @"PHImageResultIsDegradedKey";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v4 addObjectsFromArray:v5];

  objc_super v6 = (void *)allowedInfoKeys_allowedKeys_37660;
  allowedInfoKeys_allowedKeys_37660 = (uint64_t)v4;
}

- (BOOL)containsValidData
{
  if (![(PHCompositeMediaResult *)self->_imageResult containsValidData]
    && self->_requiresImageResult)
  {
    return 0;
  }
  videoResult = self->_videoResult;

  return [(PHCompositeMediaResult *)videoResult containsValidData];
}

@end