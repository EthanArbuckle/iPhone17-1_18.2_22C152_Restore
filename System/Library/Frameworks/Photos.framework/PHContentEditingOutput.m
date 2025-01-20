@interface PHContentEditingOutput
+ (BOOL)_currentDeviceSupportsHEICEncoding;
+ (BOOL)supportsSecureCoding;
+ (id)_renderURLWithExtensionForMediaType:(int64_t)a3 useHEICImage:(BOOL)a4 appropriateForURL:(id)a5;
+ (id)_renderURLWithExtensionForUniformTypeIdentifierType:(id)a3 appropriateForURL:(id)a4;
+ (id)defaultExtensionForUniformTypeIdentifierType:(id)a3;
+ (id)imageRenderURLUsingHEICFormat:(BOOL)a3 appropriateForURL:(id)a4;
+ (unint64_t)maximumAdjustmentDataLength;
- (BOOL)isAsyncAdjustment;
- (BOOL)isLoopingLivePhoto;
- (BOOL)isOnlyChangingOriginalChoice;
- (BOOL)isSubstandardRender;
- (BOOL)shouldPreferHEICForRenderedImages;
- (NSArray)supportedRenderedContentTypes;
- (NSData)penultimateRenderedJPEGData;
- (NSNumber)originalResourceChoice;
- (NSNumber)playbackVariation;
- (NSNumber)videoDuration;
- (NSString)accessibilityDescription;
- (NSURL)adjustmentSecondaryDataURL;
- (NSURL)editorBundleURL;
- (NSURL)penultimateRenderedVideoComplementContentURL;
- (NSURL)penultimateRenderedVideoContentURL;
- (NSURL)renderedContentURL;
- (NSURL)renderedContentURLForType:(UTType *)type error:(NSError *)error;
- (NSURL)renderedPreviewContentURL;
- (NSURL)renderedVideoComplementContentURL;
- (NSURL)renderedVideoPosterURL;
- (PHAdjustmentData)adjustmentData;
- (PHContentEditingOutput)initWithAdjustmentBaseVersion:(int64_t)a3 mediaType:(int64_t)a4 appropriateForURL:(id)a5;
- (PHContentEditingOutput)initWithCoder:(id)a3;
- (PHContentEditingOutput)initWithContentEditingInput:(PHContentEditingInput *)contentEditingInput;
- (PHContentEditingOutput)initWithContentEditingInput:(id)a3 withOptions:(id)a4;
- (PHContentEditingOutput)initWithPlaceholderForCreatedAsset:(PHObjectPlaceholder *)placeholderForCreatedAsset;
- (PHContentEditingOutputRequestOptions)requestOptions;
- (UTType)defaultRenderedContentType;
- (double)fullSizeRenderDuration;
- (id)assetAdjustmentsWithEditorBundleID:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)renderURLWithExtensionForMediaType:(int64_t)a3;
- (id)setAdjustmentsOptions;
- (int64_t)baseVersion;
- (int64_t)fullSizeRenderHeight;
- (int64_t)fullSizeRenderWidth;
- (int64_t)mediaType;
- (void)_setupRequiredRenderedContentURLsWithEditingInput:(id)a3 options:(id)a4;
- (void)clearRenderedContentURL;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityDescription:(id)a3;
- (void)setAdjustmentData:(PHAdjustmentData *)adjustmentData;
- (void)setAdjustmentSecondaryDataURL:(id)a3;
- (void)setBaseVersion:(int64_t)a3;
- (void)setEditorBundleURL:(id)a3;
- (void)setFullSizeRenderDuration:(double)a3;
- (void)setFullSizeRenderHeight:(int64_t)a3;
- (void)setFullSizeRenderWidth:(int64_t)a3;
- (void)setIsAsyncAdjustment:(BOOL)a3;
- (void)setIsSubstandardRender:(BOOL)a3;
- (void)setOriginalResourceChoice:(id)a3;
- (void)setPenultimateRenderedJPEGData:(id)a3;
- (void)setPenultimateRenderedVideoComplementContentURL:(id)a3;
- (void)setPenultimateRenderedVideoContentURL:(id)a3;
- (void)setPlaybackVariation:(id)a3;
- (void)setRenderedContentURL:(id)a3;
- (void)setRenderedJPEGData:(id)a3;
- (void)setRenderedPreviewContentURL:(id)a3;
- (void)setRenderedVideoComplementContentURL:(id)a3;
- (void)setRenderedVideoPosterURL:(id)a3;
- (void)setVideoDuration:(id)a3;
@end

@implementation PHContentEditingOutput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_videoDuration, 0);
  objc_storeStrong((id *)&self->_playbackVariation, 0);
  objc_storeStrong((id *)&self->_renderedPreviewContentURL, 0);
  objc_storeStrong((id *)&self->_editorBundleURL, 0);
  objc_storeStrong((id *)&self->_penultimateRenderedVideoComplementContentURL, 0);
  objc_storeStrong((id *)&self->_renderedVideoComplementContentURL, 0);
  objc_storeStrong((id *)&self->_renderedVideoPosterURL, 0);
  objc_storeStrong((id *)&self->_penultimateRenderedVideoContentURL, 0);
  objc_storeStrong((id *)&self->_penultimateRenderedJPEGData, 0);
  objc_storeStrong((id *)&self->_adjustmentSecondaryDataURL, 0);
  objc_storeStrong((id *)&self->_originalResourceChoice, 0);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_renderedContentURL, 0);
  objc_storeStrong((id *)&self->_appropriateURLForDerivingRenderedContentURLs, 0);
  objc_storeStrong((id *)&self->_deliveredRenderedContentURLs, 0);

  objc_storeStrong((id *)&self->_adjustmentData, 0);
}

- (void)setAccessibilityDescription:(id)a3
{
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setVideoDuration:(id)a3
{
}

- (NSNumber)videoDuration
{
  return self->_videoDuration;
}

- (void)setPlaybackVariation:(id)a3
{
}

- (NSNumber)playbackVariation
{
  return self->_playbackVariation;
}

- (void)setIsAsyncAdjustment:(BOOL)a3
{
  self->_isAsyncAdjustment = a3;
}

- (BOOL)isAsyncAdjustment
{
  return self->_isAsyncAdjustment;
}

- (void)setRenderedPreviewContentURL:(id)a3
{
}

- (NSURL)renderedPreviewContentURL
{
  return self->_renderedPreviewContentURL;
}

- (BOOL)isLoopingLivePhoto
{
  return self->_loopingLivePhoto;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setEditorBundleURL:(id)a3
{
}

- (NSURL)editorBundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 144, 1);
}

- (void)setPenultimateRenderedVideoComplementContentURL:(id)a3
{
}

- (NSURL)penultimateRenderedVideoComplementContentURL
{
  return (NSURL *)objc_getProperty(self, a2, 136, 1);
}

- (void)setRenderedVideoComplementContentURL:(id)a3
{
}

- (NSURL)renderedVideoComplementContentURL
{
  return (NSURL *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRenderedVideoPosterURL:(id)a3
{
}

- (NSURL)renderedVideoPosterURL
{
  return (NSURL *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPenultimateRenderedVideoContentURL:(id)a3
{
}

- (NSURL)penultimateRenderedVideoContentURL
{
  return (NSURL *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPenultimateRenderedJPEGData:(id)a3
{
}

- (NSData)penultimateRenderedJPEGData
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setAdjustmentSecondaryDataURL:(id)a3
{
}

- (NSURL)adjustmentSecondaryDataURL
{
  return self->_adjustmentSecondaryDataURL;
}

- (void)setFullSizeRenderDuration:(double)a3
{
  self->_fullSizeRenderDuration = a3;
}

- (double)fullSizeRenderDuration
{
  return self->_fullSizeRenderDuration;
}

- (void)setFullSizeRenderHeight:(int64_t)a3
{
  self->_fullSizeRenderHeight = a3;
}

- (int64_t)fullSizeRenderHeight
{
  return self->_fullSizeRenderHeight;
}

- (void)setFullSizeRenderWidth:(int64_t)a3
{
  self->_fullSizeRenderWidth = a3;
}

- (int64_t)fullSizeRenderWidth
{
  return self->_fullSizeRenderWidth;
}

- (void)setIsSubstandardRender:(BOOL)a3
{
  self->_isSubstandardRender = a3;
}

- (BOOL)isSubstandardRender
{
  return self->_isSubstandardRender;
}

- (void)setOriginalResourceChoice:(id)a3
{
}

- (NSNumber)originalResourceChoice
{
  return self->_originalResourceChoice;
}

- (PHContentEditingOutputRequestOptions)requestOptions
{
  return self->_requestOptions;
}

- (void)setRenderedContentURL:(id)a3
{
}

- (NSURL)renderedContentURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (id)setAdjustmentsOptions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F8A9C8]);
  objc_msgSend(v3, "setFullSizeRenderSize:", (double)-[PHContentEditingOutput fullSizeRenderWidth](self, "fullSizeRenderWidth"), (double)-[PHContentEditingOutput fullSizeRenderHeight](self, "fullSizeRenderHeight"));
  [(PHContentEditingOutput *)self fullSizeRenderDuration];
  objc_msgSend(v3, "setFullSizeRenderDuration:");
  [v3 setShouldGenerateThumbnails:1];
  v4 = [(PHContentEditingOutput *)self adjustmentSecondaryDataURL];
  [v3 setAdjustmentSecondaryDataURL:v4];

  if ([(PHContentEditingOutput *)self isAsyncAdjustment])
  {
    v5 = [(PHContentEditingOutput *)self renderedPreviewContentURL];
    [v3 setRenderedContentURL:v5];

    [v3 setSubstandardRender:1];
    [v3 setDeferred:1];
    v6 = [(PHContentEditingOutput *)self renderedVideoPosterURL];
    [v3 setRenderedVideoPosterContentURL:v6];
  }
  else
  {
    v7 = [(PHContentEditingOutput *)self renderedContentURL];
    [v3 setRenderedContentURL:v7];

    v8 = [(PHContentEditingOutput *)self penultimateRenderedJPEGData];
    [v3 setPenultimateRenderedJPEGData:v8];

    v9 = [(PHContentEditingOutput *)self penultimateRenderedVideoContentURL];
    [v3 setPenultimateRenderedVideoContentURL:v9];

    objc_msgSend(v3, "setSubstandardRender:", -[PHContentEditingOutput isSubstandardRender](self, "isSubstandardRender"));
    v10 = [(PHContentEditingOutput *)self renderedVideoComplementContentURL];
    [v3 setRenderedVideoComplementContentURL:v10];

    v11 = [(PHContentEditingOutput *)self penultimateRenderedVideoComplementContentURL];
    [v3 setPenultimateRenderedVideoComplementContentURL:v11];

    v12 = [(PHContentEditingOutput *)self renderedVideoPosterURL];
    [v3 setRenderedVideoPosterContentURL:v12];

    [v3 setShouldUpdateAttributes:1];
  }

  return v3;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  if (self->_isAsyncAdjustment) {
    v7 = @" (async)";
  }
  else {
    v7 = &stru_1EEAC1950;
  }
  [v3 appendFormat:@"<%@ %p>%@\n", v5, self, v7];

  unint64_t v8 = self->_mediaType - 1;
  if (v8 > 2) {
    v9 = @"unknown";
  }
  else {
    v9 = off_1E58454F0[v8];
  }
  v10 = v9;
  v11 = v10;
  if (self->_loopingLivePhoto) {
    v12 = @" (looping)";
  }
  else {
    v12 = &stru_1EEAC1950;
  }
  [v3 appendFormat:@"  mediaType: %@%@\n", v10, v12];

  [v3 appendFormat:@"  adjustmentData: %@\n", self->_adjustmentData];
  originalResourceChoice = self->_originalResourceChoice;
  if (originalResourceChoice)
  {
    unint64_t v14 = [(NSNumber *)originalResourceChoice integerValue];
    if (v14 > 3) {
      v15 = 0;
    }
    else {
      v15 = off_1E5845480[v14];
    }
    v16 = v15;
    [v3 appendFormat:@"  originalChoice: %@\n", v16];
  }
  if (self->_isAsyncAdjustment) {
    [v3 appendFormat:@"  renderedPreviewContentURL: %@\n", self->_renderedPreviewContentURL];
  }

  return v3;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)PHContentEditingOutput;
  id v3 = [(PHContentEditingOutput *)&v9 description];
  v4 = [(PHContentEditingOutput *)self adjustmentData];
  uint64_t v5 = [(PHContentEditingOutput *)self renderedContentURL];
  v6 = [(PHContentEditingOutput *)self renderedPreviewContentURL];
  v7 = [v3 stringByAppendingFormat:@" adjustmentData=%@, renderedContentURL=%@, renderedPreviewContentURL=%@", v4, v5, v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t mediaType = self->_mediaType;
  id v13 = a3;
  [v13 encodeInteger:mediaType forKey:@"mediaType"];
  [v13 encodeBool:self->_loopingLivePhoto forKey:@"loopingLivePhoto"];
  [v13 encodeObject:self->_adjustmentData forKey:@"adjustmentData"];
  uint64_t v5 = OutboundURLForURL(self->_renderedContentURL);
  [v13 encodeObject:v5 forKey:@"renderedContentURL"];

  v6 = OutboundURLForURL(self->_renderedVideoComplementContentURL);
  [v13 encodeObject:v6 forKey:@"renderedVideoComplementContentURL"];

  v7 = OutboundURLForURL(self->_renderedPreviewContentURL);
  [v13 encodeObject:v7 forKey:@"renderedPreviewContentURL"];

  unint64_t v8 = OutboundURLForURL(self->_adjustmentSecondaryDataURL);
  [v13 encodeObject:v8 forKey:@"adjustmentSecondaryDataURL"];

  [v13 encodeObject:self->_penultimateRenderedJPEGData forKey:@"penultimateRenderedJPEGData"];
  objc_super v9 = OutboundURLForURL(self->_penultimateRenderedVideoContentURL);
  [v13 encodeObject:v9 forKey:@"penultimateRenderedVideoContentURL"];

  v10 = OutboundURLForURL(self->_penultimateRenderedVideoComplementContentURL);
  [v13 encodeObject:v10 forKey:@"penultimateRenderedVideoComplementContentURL"];

  [v13 encodeBool:self->_isSubstandardRender forKey:@"isSubstandardRender"];
  [v13 encodeInteger:self->_fullSizeRenderWidth forKey:@"fullSizeRenderWidth"];
  [v13 encodeInteger:self->_fullSizeRenderHeight forKey:@"fullSizeRenderHeight"];
  [v13 encodeDouble:@"fullSizeRenderDuration" forKey:self->_fullSizeRenderDuration];
  v11 = OutboundURLForURL(self->_editorBundleURL);
  [v13 encodeObject:v11 forKey:@"editorBundleURL"];

  [v13 encodeObject:self->_originalResourceChoice forKey:@"originalResourceChoice"];
  [v13 encodeBool:self->_isAsyncAdjustment forKey:@"isAsyncAdjustment"];
  v12 = OutboundURLForURL(self->_renderedVideoPosterURL);
  [v13 encodeObject:v12 forKey:@"renderedVideoPosterURL"];

  [v13 encodeObject:self->_playbackVariation forKey:@"playbackVariation"];
  [v13 encodeObject:self->_videoDuration forKey:@"videoDuration"];
  [v13 encodeObject:self->_accessibilityDescription forKey:@"accessibilityDescription"];
  [v13 encodeObject:self->_requestOptions forKey:@"requestOptions"];
}

- (PHContentEditingOutput)initWithCoder:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PHContentEditingOutput;
  uint64_t v5 = [(PHContentEditingOutput *)&v39 init];
  if (v5)
  {
    v5->_int64_t mediaType = [v4 decodeIntegerForKey:@"mediaType"];
    v5->_loopingLivePhoto = [v4 decodeBoolForKey:@"loopingLivePhoto"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adjustmentData"];
    adjustmentData = v5->_adjustmentData;
    v5->_adjustmentData = (PHAdjustmentData *)v6;

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v4 decodeObjectOfClass:v8 forKey:@"renderedContentURL"];
    renderedContentURL = v5->_renderedContentURL;
    v5->_renderedContentURL = (NSURL *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:v8 forKey:@"renderedVideoComplementContentURL"];
    renderedVideoComplementContentURL = v5->_renderedVideoComplementContentURL;
    v5->_renderedVideoComplementContentURL = (NSURL *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:v8 forKey:@"renderedPreviewContentURL"];
    renderedPreviewContentURL = v5->_renderedPreviewContentURL;
    v5->_renderedPreviewContentURL = (NSURL *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:v8 forKey:@"adjustmentSecondaryDataURL"];
    adjustmentSecondaryDataURL = v5->_adjustmentSecondaryDataURL;
    v5->_adjustmentSecondaryDataURL = (NSURL *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"penultimateRenderedJPEGData"];
    penultimateRenderedJPEGData = v5->_penultimateRenderedJPEGData;
    v5->_penultimateRenderedJPEGData = (NSData *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:v8 forKey:@"penultimateRenderedVideoContentURL"];
    penultimateRenderedVideoContentURL = v5->_penultimateRenderedVideoContentURL;
    v5->_penultimateRenderedVideoContentURL = (NSURL *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:v8 forKey:@"penultimateRenderedVideoComplementContentURL"];
    penultimateRenderedVideoComplementContentURL = v5->_penultimateRenderedVideoComplementContentURL;
    v5->_penultimateRenderedVideoComplementContentURL = (NSURL *)v21;

    v5->_isSubstandardRender = [v4 decodeBoolForKey:@"isSubstandardRender"];
    v5->_fullSizeRenderWidth = [v4 decodeIntegerForKey:@"fullSizeRenderWidth"];
    v5->_fullSizeRenderHeight = [v4 decodeIntegerForKey:@"fullSizeRenderHeight"];
    [v4 decodeDoubleForKey:@"fullSizeRenderDuration"];
    v5->_fullSizeRenderDuration = v23;
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"editorBundleURL"];
    editorBundleURL = v5->_editorBundleURL;
    v5->_editorBundleURL = (NSURL *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalResourceChoice"];
    originalResourceChoice = v5->_originalResourceChoice;
    v5->_originalResourceChoice = (NSNumber *)v26;

    v5->_isAsyncAdjustment = [v4 decodeBoolForKey:@"isAsyncAdjustment"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"renderedVideoPosterURL"];
    renderedVideoPosterURL = v5->_renderedVideoPosterURL;
    v5->_renderedVideoPosterURL = (NSURL *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"playbackVariation"];
    playbackVariation = v5->_playbackVariation;
    v5->_playbackVariation = (NSNumber *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"videoDuration"];
    videoDuration = v5->_videoDuration;
    v5->_videoDuration = (NSNumber *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityDescription"];
    accessibilityDescription = v5->_accessibilityDescription;
    v5->_accessibilityDescription = (NSString *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestOptions"];
    requestOptions = v5->_requestOptions;
    v5->_requestOptions = (PHContentEditingOutputRequestOptions *)v36;
  }
  return v5;
}

- (BOOL)shouldPreferHEICForRenderedImages
{
  requestOptions = self->_requestOptions;
  if (!requestOptions
    || ![(PHContentEditingOutputRequestOptions *)requestOptions preferHEICForRenderedImages])
  {
    return 0;
  }
  id v3 = objc_opt_class();

  return [v3 _currentDeviceSupportsHEICEncoding];
}

- (void)_setupRequiredRenderedContentURLsWithEditingInput:(id)a3 options:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isAsyncAdjustment])
  {
    uint64_t v8 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [v6 mediaType];
      if ((unint64_t)(v9 - 1) > 2) {
        v10 = @"unknown";
      }
      else {
        v10 = off_1E58454F0[v9 - 1];
      }
      uint64_t v21 = v10;
      int v32 = 138543362;
      v33 = v21;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEBUG, "Preparing async content editing output URLs for %{public}@", (uint8_t *)&v32, 0xCu);
    }
    v22 = [(PHContentEditingOutput *)self renderURLWithExtensionForMediaType:1];
    renderedPreviewContentURL = self->_renderedPreviewContentURL;
    self->_renderedPreviewContentURL = v22;

    if ([v6 mediaType] == 2)
    {
      v20 = [(PHContentEditingOutput *)self renderURLWithExtensionForMediaType:1];
LABEL_25:
      renderedVideoPosterURL = self->_renderedVideoPosterURL;
      self->_renderedVideoPosterURL = v20;
LABEL_26:
    }
  }
  else
  {
    if ([v7 playbackStyle]) {
      uint64_t v11 = v7;
    }
    else {
      uint64_t v11 = v6;
    }
    uint64_t v12 = [v11 playbackStyle];
    BOOL v13 = [(PHContentEditingOutput *)self shouldPreferHEICForRenderedImages];
    BOOL v14 = [v6 mediaType] == 1 && v12 == 5;
    BOOL v15 = v14;
    if (v14 || [v6 mediaType] == 2)
    {
      v16 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = @"normal video";
        if (v15) {
          uint64_t v17 = @"looping live photo";
        }
        int v32 = 138543362;
        v33 = v17;
        _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEBUG, "Preparing video-based content editing output URLs for %{public}@", (uint8_t *)&v32, 0xCu);
      }

      self->_loopingLivePhoto = v15;
      v18 = [(PHContentEditingOutput *)self renderURLWithExtensionForMediaType:2];
      renderedContentURL = self->_renderedContentURL;
      self->_renderedContentURL = v18;

      v20 = [(id)objc_opt_class() imageRenderURLUsingHEICFormat:v13 appropriateForURL:self->_appropriateURLForDerivingRenderedContentURLs];
      goto LABEL_25;
    }
    v25 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v26 = [v6 livePhoto];
      v27 = @"live photo";
      if (!v26) {
        v27 = @"still photo";
      }
      int v32 = 138543362;
      v33 = v27;
      _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_DEBUG, "Preparing photo-based content editing output URLs for %{public}@", (uint8_t *)&v32, 0xCu);
    }
    uint64_t v28 = [(id)objc_opt_class() _renderURLWithExtensionForMediaType:self->_mediaType useHEICImage:v13 appropriateForURL:self->_appropriateURLForDerivingRenderedContentURLs];
    v29 = self->_renderedContentURL;
    self->_renderedContentURL = v28;

    uint64_t v30 = [v6 livePhoto];

    if (v30)
    {
      v31 = [(PHContentEditingOutput *)self renderURLWithExtensionForMediaType:2];
      renderedVideoPosterURL = self->_renderedVideoComplementContentURL;
      self->_renderedVideoComplementContentURL = v31;
      goto LABEL_26;
    }
  }
}

- (BOOL)isOnlyChangingOriginalChoice
{
  id v3 = [(PHContentEditingOutput *)self adjustmentData];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = [(PHContentEditingOutput *)self originalResourceChoice];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (id)assetAdjustmentsWithEditorBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PHContentEditingOutput *)self adjustmentData];
  id v6 = [v5 formatIdentifier];

  id v7 = [(PHContentEditingOutput *)self adjustmentData];
  uint64_t v8 = [v7 formatVersion];

  uint64_t v9 = [(PHContentEditingOutput *)self adjustmentData];
  uint64_t v10 = [v9 baseVersion];

  uint64_t v11 = [(PHContentEditingOutput *)self adjustmentData];
  uint64_t v12 = [v11 data];

  BOOL v13 = [(PHContentEditingOutput *)self adjustmentData];
  uint64_t v14 = [v13 adjustmentRenderTypes];

  BOOL v15 = (void *)[objc_alloc(MEMORY[0x1E4F8CBB8]) initWithFormatIdentifier:v6 formatVersion:v8 data:v12 baseVersion:v10 editorBundleID:v4 renderTypes:v14];

  return v15;
}

- (void)setRenderedJPEGData:(id)a3
{
  id v4 = a3;
  id v5 = [(PHContentEditingOutput *)self renderedContentURL];
  [v4 writeToURL:v5 options:1073741825 error:0];
}

- (void)setBaseVersion:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_baseVersion = a3;
  [(PHAdjustmentData *)obj->_adjustmentData setBaseVersion:a3];
  objc_sync_exit(obj);
}

- (int64_t)baseVersion
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t baseVersion = v2->_baseVersion;
  objc_sync_exit(v2);

  return baseVersion;
}

- (void)setAdjustmentData:(PHAdjustmentData *)adjustmentData
{
  id v4 = adjustmentData;
  [(PHAdjustmentData *)v4 setBaseVersion:self->_baseVersion];
  id v5 = [(PHAdjustmentData *)v4 formatIdentifier];

  if (!v5) {
    [(PHAdjustmentData *)v4 setFormatIdentifier:&stru_1EEAC1950];
  }
  id v6 = [(PHAdjustmentData *)v4 formatVersion];

  if (!v6) {
    [(PHAdjustmentData *)v4 setFormatVersion:&stru_1EEAC1950];
  }
  id v7 = [(PHAdjustmentData *)v4 data];
  unint64_t v8 = [v7 length];
  unint64_t v9 = +[PHContentEditingOutput maximumAdjustmentDataLength];

  if (v8 > v9 && (PLIsAssetsd() & 1) == 0 && (PLIsProcessWithAppleBundleIdentifier() & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Adjustment data is too large" userInfo:0];
    objc_exception_throw(v11);
  }
  obj = self;
  objc_sync_enter(obj);
  uint64_t v10 = obj->_adjustmentData;
  obj->_adjustmentData = v4;

  objc_sync_exit(obj);
}

- (PHAdjustmentData)adjustmentData
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_adjustmentData;
  objc_sync_exit(v2);

  return v3;
}

- (void)clearRenderedContentURL
{
  renderedContentURL = self->_renderedContentURL;
  self->_renderedContentURL = 0;
}

- (id)renderURLWithExtensionForMediaType:(int64_t)a3
{
  BOOL v5 = [(PHContentEditingOutput *)self shouldPreferHEICForRenderedImages];
  id v6 = objc_opt_class();
  appropriateURLForDerivingRenderedContentURLs = self->_appropriateURLForDerivingRenderedContentURLs;

  return (id)[v6 _renderURLWithExtensionForMediaType:a3 useHEICImage:v5 appropriateForURL:appropriateURLForDerivingRenderedContentURLs];
}

- (NSURL)renderedContentURLForType:(UTType *)type error:(NSError *)error
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = type;
  if (!self->_deliveredRenderedContentURLs)
  {
    id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    deliveredRenderedContentURLs = self->_deliveredRenderedContentURLs;
    self->_deliveredRenderedContentURLs = v7;
  }
  unint64_t v9 = [(PHContentEditingOutput *)self supportedRenderedContentTypes];
  int v10 = [v9 containsObject:v6];

  if (!v10)
  {
    BOOL v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28228];
    uint64_t v22 = *MEMORY[0x1E4F28228];
    v23[0] = @"Unsupported UTType";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    id v11 = [v13 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v14];

    if ([(NSMutableSet *)self->_deliveredRenderedContentURLs count] != 1)
    {
LABEL_8:

      v18 = 0;
      goto LABEL_9;
    }
LABEL_7:
    BOOL v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = v12;
    uint64_t v21 = @"Cannot request another rendered content URL for UTType";
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v17 = [v15 errorWithDomain:@"PHPhotosErrorDomain" code:-1 userInfo:v16];

    id v11 = (void *)v17;
    goto LABEL_8;
  }
  if ([(NSMutableSet *)self->_deliveredRenderedContentURLs count] == 1)
  {
    id v11 = 0;
    uint64_t v12 = *MEMORY[0x1E4F28228];
    goto LABEL_7;
  }
  v18 = [(id)objc_opt_class() _renderURLWithExtensionForUniformTypeIdentifierType:v6 appropriateForURL:self->_appropriateURLForDerivingRenderedContentURLs];
  [(NSMutableSet *)self->_deliveredRenderedContentURLs addObject:v18];
  objc_storeStrong((id *)&self->_renderedContentURL, v18);
  if (error) {
    *error = 0;
  }
LABEL_9:

  return (NSURL *)v18;
}

- (UTType)defaultRenderedContentType
{
  int64_t mediaType = self->_mediaType;
  if (mediaType == 1)
  {
    id v3 = (id *)MEMORY[0x1E4F44410];
    goto LABEL_5;
  }
  if (mediaType == 2)
  {
    id v3 = (id *)MEMORY[0x1E4F44490];
LABEL_5:
    id v4 = *v3;
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:

  return (UTType *)v4;
}

- (NSArray)supportedRenderedContentTypes
{
  v11[2] = *MEMORY[0x1E4F143B8];
  int64_t mediaType = self->_mediaType;
  if (mediaType == 2)
  {
    uint64_t v9 = *MEMORY[0x1E4F44490];
    id v4 = (void *)MEMORY[0x1E4F1C978];
    BOOL v5 = &v9;
LABEL_8:
    uint64_t v6 = 1;
    goto LABEL_9;
  }
  if (mediaType != 1)
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_10;
  }
  if (![(id)objc_opt_class() _currentDeviceSupportsHEICEncoding])
  {
    uint64_t v10 = *MEMORY[0x1E4F44410];
    id v4 = (void *)MEMORY[0x1E4F1C978];
    BOOL v5 = &v10;
    goto LABEL_8;
  }
  uint64_t v3 = *MEMORY[0x1E4F443E0];
  v11[0] = *MEMORY[0x1E4F44410];
  v11[1] = v3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  BOOL v5 = v11;
  uint64_t v6 = 2;
LABEL_9:
  id v7 = [v4 arrayWithObjects:v5 count:v6];
LABEL_10:

  return (NSArray *)v7;
}

- (PHContentEditingOutput)initWithAdjustmentBaseVersion:(int64_t)a3 mediaType:(int64_t)a4 appropriateForURL:(id)a5
{
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PHContentEditingOutput;
  uint64_t v10 = [(PHContentEditingOutput *)&v15 init];
  id v11 = v10;
  if (v10)
  {
    v10->_int64_t baseVersion = a3;
    v10->_int64_t mediaType = a4;
    uint64_t v12 = [(PHContentEditingOutput *)v10 renderURLWithExtensionForMediaType:a4];
    renderedContentURL = v11->_renderedContentURL;
    v11->_renderedContentURL = (NSURL *)v12;

    objc_storeStrong((id *)&v11->_appropriateURLForDerivingRenderedContentURLs, a5);
  }

  return v11;
}

- (PHContentEditingOutput)initWithPlaceholderForCreatedAsset:(PHObjectPlaceholder *)placeholderForCreatedAsset
{
  BOOL v5 = placeholderForCreatedAsset;
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PHContentEditingOutput.m", 89, @"Invalid parameter not satisfying: %@", @"placeholderForCreatedAsset != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)PHContentEditingOutput;
  uint64_t v6 = [(PHContentEditingOutput *)&v13 init];
  id v7 = v6;
  if (v6)
  {
    v6->_int64_t baseVersion = 0;
    uint64_t v8 = [(PHObjectPlaceholder *)v5 assetMediaType];
    v7->_int64_t mediaType = v8;
    uint64_t v9 = [(PHContentEditingOutput *)v7 renderURLWithExtensionForMediaType:v8];
    renderedContentURL = v7->_renderedContentURL;
    v7->_renderedContentURL = (NSURL *)v9;
  }
  return v7;
}

- (PHContentEditingOutput)initWithContentEditingInput:(id)a3 withOptions:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PHContentEditingOutput.m", 60, @"Invalid parameter not satisfying: %@", @"contentEditingInput != nil" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)PHContentEditingOutput;
  uint64_t v9 = [(PHContentEditingOutput *)&v20 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requestOptions, a4);
    v10->_int64_t baseVersion = [v7 baseVersion];
    v10->_int64_t mediaType = [v7 mediaType];
    uint64_t v11 = [v7 appropriateURLForDerivingRenderedContentURLs];
    appropriateURLForDerivingRenderedContentURLs = v10->_appropriateURLForDerivingRenderedContentURLs;
    v10->_appropriateURLForDerivingRenderedContentURLs = (NSURL *)v11;

    if (([v8 isAsyncAdjustment] & 1) != 0
      || [v8 isOnlyChangingOriginalChoice])
    {
      v10->_isAsyncAdjustment = 1;
    }
    [(PHContentEditingOutput *)v10 _setupRequiredRenderedContentURLsWithEditingInput:v7 options:v8];
    objc_super v13 = [v7 originalResourceChoice];

    if (v13)
    {
      if (v10->_baseVersion)
      {
        p_super = PLPhotoKitGetLog();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B043000, p_super, OS_LOG_TYPE_ERROR, "Original resource choice is only valid for an unadjusted base version", buf, 2u);
        }
      }
      else
      {
        uint64_t v15 = [v7 originalResourceChoice];
        p_super = &v10->_originalResourceChoice->super.super;
        v10->_originalResourceChoice = (NSNumber *)v15;
      }
    }
    v16 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [(PHContentEditingOutput *)v10 debugDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v17;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEBUG, "Initialized content editing output:\n%@", buf, 0xCu);
    }
  }

  return v10;
}

- (PHContentEditingOutput)initWithContentEditingInput:(PHContentEditingInput *)contentEditingInput
{
  return [(PHContentEditingOutput *)self initWithContentEditingInput:contentEditingInput withOptions:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (unint64_t)maximumAdjustmentDataLength
{
  return 0x200000;
}

+ (id)_renderURLWithExtensionForUniformTypeIdentifierType:(id)a3 appropriateForURL:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a1 defaultExtensionForUniformTypeIdentifierType:a3];
  if (v7) {
    id v8 = (__CFString *)v7;
  }
  else {
    id v8 = &stru_1EEAC1950;
  }
  uint64_t v9 = [MEMORY[0x1E4F8B980] temporaryRenderContentURLForInternalRendersWithExtension:v8 appropriateForURL:v6];

  return v9;
}

+ (id)defaultExtensionForUniformTypeIdentifierType:(id)a3
{
  v11[4] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = *MEMORY[0x1E4F443E0];
    v10[0] = *MEMORY[0x1E4F44410];
    v10[1] = v3;
    v11[0] = @"JPG";
    v11[1] = @"HEIC";
    uint64_t v4 = *MEMORY[0x1E4F44530];
    v10[2] = *MEMORY[0x1E4F44490];
    v10[3] = v4;
    v11[2] = @"MOV";
    void v11[3] = @"WAV";
    BOOL v5 = (void *)MEMORY[0x1E4F1C9E8];
    id v6 = a3;
    uint64_t v7 = [v5 dictionaryWithObjects:v11 forKeys:v10 count:4];
    id v8 = [v7 objectForKeyedSubscript:v6];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_renderURLWithExtensionForMediaType:(int64_t)a3 useHEICImage:(BOOL)a4 appropriateForURL:(id)a5
{
  switch(a3)
  {
    case 3:
      uint64_t v7 = (id *)MEMORY[0x1E4F44530];
LABEL_9:
      id v8 = *v7;
      goto LABEL_11;
    case 2:
      uint64_t v7 = (id *)MEMORY[0x1E4F44490];
      goto LABEL_9;
    case 1:
      uint64_t v7 = (id *)MEMORY[0x1E4F443E0];
      if (!a4) {
        uint64_t v7 = (id *)MEMORY[0x1E4F44410];
      }
      goto LABEL_9;
  }
  id v8 = 0;
LABEL_11:
  uint64_t v9 = [a1 _renderURLWithExtensionForUniformTypeIdentifierType:v8 appropriateForURL:a5];

  return v9;
}

+ (id)imageRenderURLUsingHEICFormat:(BOOL)a3 appropriateForURL:(id)a4
{
  return (id)[a1 _renderURLWithExtensionForMediaType:1 useHEICImage:a3 appropriateForURL:a4];
}

+ (BOOL)_currentDeviceSupportsHEICEncoding
{
  return [MEMORY[0x1E4F8CC30] currentDeviceHEVCCapabilities] & 1;
}

@end