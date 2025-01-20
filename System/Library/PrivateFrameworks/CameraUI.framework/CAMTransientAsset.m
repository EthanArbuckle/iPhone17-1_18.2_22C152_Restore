@interface CAMTransientAsset
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration;
- (BOOL)canPlayLoopingVideo;
- (BOOL)canPlayPhotoIris;
- (BOOL)hasPhotoColorAdjustments;
- (BOOL)isAnimatedImage;
- (BOOL)isFavorite;
- (BOOL)isHDR;
- (BOOL)isHidden;
- (BOOL)isLivePhoto;
- (BOOL)isPhotoIrisPlaceholder;
- (BOOL)isTemporaryPlaceholder;
- (BOOL)representsBurst;
- (CAMTransientAsset)init;
- (CAMTransientAsset)initWithAsset:(id)a3 convertible:(id)a4;
- (CAMTransientAsset)initWithAsset:(id)a3 uuid:(id)a4;
- (CAMTransientAsset)initWithUUID:(id)a3;
- (CLLocation)location;
- (NSDate)creationDate;
- (NSDate)localCreationDate;
- (NSDate)modificationDate;
- (NSString)burstIdentifier;
- (NSString)description;
- (NSString)localizedGeoDescription;
- (NSString)uniformTypeIdentifier;
- (NSString)uuid;
- (NSURL)persistenceURL;
- (UIImage)placeholderImage;
- (double)aspectRatio;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)playbackStyle;
- (unint64_t)deferredLogInfo;
- (unint64_t)isContentEqualTo:(id)a3;
- (unint64_t)mediaSubtypes;
- (unint64_t)mediaType;
- (unint64_t)numberOfRepresentedAssets;
- (unint64_t)originalFilesize;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unsigned)playbackVariation;
- (void)_populateStillImageTransientAssetFromConvertible:(id)a3;
- (void)_populateVideoTransientAssetFromConvertible:(id)a3;
@end

@implementation CAMTransientAsset

- (CAMTransientAsset)initWithAsset:(id)a3 convertible:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v6) {
    id v7 = v6;
  }
  v9 = [v7 uuid];
  v10 = [(CAMTransientAsset *)self initWithAsset:v6 uuid:v9];
  if (v10)
  {
    uint64_t v11 = [v6 mediaType];
    if (!v11)
    {
      uint64_t v11 = [v8 mediaType];
      v10->_mediaType = v11;
    }
    v10->_isTemporaryPlaceholder = [v8 isTransientAssetTemporaryPlaceholder];
    switch(v11)
    {
      case 0:
      case 3:
        v12 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 134217984;
          uint64_t v16 = v11;
          _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "Attempting to populate a transient asset for an unsupported media type %ld", (uint8_t *)&v15, 0xCu);
        }

        break;
      case 1:
        [(CAMTransientAsset *)v10 _populateStillImageTransientAssetFromConvertible:v8];
        break;
      case 2:
        [(CAMTransientAsset *)v10 _populateVideoTransientAssetFromConvertible:v8];
        break;
      default:
        break;
    }
    v13 = v10;
  }

  return v10;
}

- (CAMTransientAsset)initWithAsset:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = [(CAMTransientAsset *)self initWithUUID:a4];
  if (v7)
  {
    v7->_mediaType = [v6 mediaType];
    v7->_mediaSubtypes = [v6 mediaSubtypes];
    v7->_pixelWidth = [v6 pixelWidth];
    v7->_pixelHeight = [v6 pixelHeight];
    [v6 duration];
    v7->_duration = v8;
    uint64_t v9 = [v6 creationDate];
    creationDate = v7->_creationDate;
    v7->_creationDate = (NSDate *)v9;

    uint64_t v11 = [v6 modificationDate];
    modificationDate = v7->_modificationDate;
    v7->_modificationDate = (NSDate *)v11;

    v7->_playbackVariation = [v6 playbackVariation];
    v7->_canPlayPhotoIris = [v6 canPlayPhotoIris];
    p_photoIrisStillDisplayTime = &v7->_photoIrisStillDisplayTime;
    if (v6)
    {
      [v6 photoIrisStillDisplayTime];
      *(_OWORD *)&p_photoIrisStillDisplayTime->value = v18;
      v7->_photoIrisStillDisplayTime.epoch = v19;
      [v6 photoIrisVideoDuration];
    }
    else
    {
      p_photoIrisStillDisplayTime->value = 0;
      *(void *)&v7->_photoIrisStillDisplayTime.timescale = 0;
      v7->_photoIrisStillDisplayTime.epoch = 0;
      long long v18 = 0uLL;
      int64_t v19 = 0;
    }
    *(_OWORD *)&v7->_photoIrisVideoDuration.value = v18;
    v7->_photoIrisVideoDuration.epoch = v19;
    uint64_t v14 = [v6 placeholderImage];
    placeholderImage = v7->_placeholderImage;
    v7->_placeholderImage = (UIImage *)v14;

    v7->_isTemporaryPlaceholder = [v6 isTemporaryPlaceholder];
    uint64_t v16 = v7;
  }

  return v7;
}

- (CAMTransientAsset)initWithUUID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMTransientAsset;
  v5 = [(CAMTransientAsset *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    v5->_mediaType = 0;
    double v8 = v5;
  }

  return v5;
}

- (void)_populateStillImageTransientAssetFromConvertible:(id)a3
{
  id v4 = a3;
  [v4 finalExpectedPixelSize];
  self->_pixelWidth = (unint64_t)v5;
  [v4 finalExpectedPixelSize];
  self->_pixelHeight = (unint64_t)v6;
  id v7 = [v4 captureDate];
  objc_storeStrong((id *)&self->_creationDate, v7);
  objc_storeStrong((id *)&self->_modificationDate, v7);
  double v8 = [MEMORY[0x263EFFA18] localTimeZone];
  uint64_t v9 = [v8 secondsFromGMTForDate:v7];

  objc_super v10 = [v7 dateByAddingTimeInterval:(double)v9];
  localCreationDate = self->_localCreationDate;
  self->_localCreationDate = v10;

  v12 = [v4 burstIdentifier];
  self->_numberOfRepresentedAssets = [v4 numberOfRepresentedAssets];
  self->_representsBurst = v12 != 0;
  objc_storeStrong((id *)&self->_burstIdentifier, v12);
  unint64_t v13 = self->_mediaSubtypes | [v4 mediaSubtypes];
  self->_mediaSubtypes = v13;
  self->_HDR = (v13 & 2) != 0;
  uint64_t v14 = [v4 placeholderImage];
  [(UIImage *)self->_placeholderImage size];
  double v16 = v15;
  double v18 = v17;
  [v14 size];
  if (v20 > v16 && v19 > v18) {
    objc_storeStrong((id *)&self->_placeholderImage, v14);
  }
  if ([v4 isExpectingPairedVideo])
  {
    self->_canPlayPhotoIris = 1;
    self->_mediaSubtypes |= 8uLL;
    self->_isPhotoIrisPlaceholder = 1;
    p_photoIrisStillDisplayTime = &self->_photoIrisStillDisplayTime;
    if (v4)
    {
      [v4 irisStillDisplayTime];
      *(_OWORD *)&p_photoIrisStillDisplayTime->value = v22;
      self->_photoIrisStillDisplayTime.epoch = v23;
      [v4 duration];
    }
    else
    {
      p_photoIrisStillDisplayTime->value = 0;
      *(void *)&self->_photoIrisStillDisplayTime.timescale = 0;
      self->_photoIrisStillDisplayTime.epoch = 0;
      long long v22 = 0uLL;
      int64_t v23 = 0;
    }
    *(_OWORD *)&self->_photoIrisVideoDuration.value = v22;
    self->_photoIrisVideoDuration.epoch = v23;
  }
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)burstIdentifier
{
  return self->_burstIdentifier;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (unint64_t)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (int64_t)playbackStyle
{
  unint64_t v3 = [(CAMTransientAsset *)self mediaType];
  if (!v3 || v3 == 3) {
    return 0;
  }
  if (v3 != 1) {
    return 4;
  }
  if ([(CAMTransientAsset *)self isLivePhoto]) {
    return 3;
  }
  return 1;
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (unsigned)playbackVariation
{
  return self->_playbackVariation;
}

- (BOOL)canPlayPhotoIris
{
  return self->_canPlayPhotoIris;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisStillDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)photoIrisVideoDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[6];
  return self;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_burstIdentifier, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_persistenceURL, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_localCreationDate, 0);
}

- (BOOL)isFavorite
{
  return 0;
}

- (BOOL)isHidden
{
  return 0;
}

- (double)aspectRatio
{
  if (![(CAMTransientAsset *)self pixelHeight]) {
    return 1.0;
  }
  double v3 = (double)[(CAMTransientAsset *)self pixelWidth];
  return v3 / (double)[(CAMTransientAsset *)self pixelHeight];
}

- (NSString)localizedGeoDescription
{
  return 0;
}

- (NSString)uniformTypeIdentifier
{
  return 0;
}

- (unint64_t)originalFilesize
{
  return 0;
}

- (CLLocation)location
{
  return 0;
}

- (BOOL)isAnimatedImage
{
  return 0;
}

- (BOOL)isLivePhoto
{
  if ([(CAMTransientAsset *)self canPlayPhotoIris]) {
    return 1;
  }
  return [(CAMTransientAsset *)self isPhotoIrisPlaceholder];
}

- (unint64_t)deferredLogInfo
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CAMTransientAsset alloc];
  double v5 = [(CAMTransientAsset *)self uuid];
  double v6 = [(CAMTransientAsset *)v4 initWithAsset:self uuid:v5];

  return v6;
}

- (NSString)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(CAMTransientAsset *)self uuid];
  double v6 = [(CAMTransientAsset *)self creationDate];
  id v7 = [(CAMTransientAsset *)self creationDate];
  [v7 timeIntervalSince1970];
  uint64_t v9 = v8;
  objc_super v10 = [(CAMTransientAsset *)self modificationDate];
  uint64_t v11 = [(CAMTransientAsset *)self modificationDate];
  [v11 timeIntervalSince1970];
  uint64_t v13 = v12;
  BOOL v14 = [(CAMTransientAsset *)self representsBurst];
  if (v14)
  {
    double v15 = [NSString stringWithFormat:@"YES, %ld frames", -[CAMTransientAsset numberOfRepresentedAssets](self, "numberOfRepresentedAssets")];
  }
  else
  {
    double v15 = @"NO";
  }
  double v16 = [(CAMTransientAsset *)self burstIdentifier];
  double v17 = [v3 stringWithFormat:@"<%@ uuid:%@ creationDate:%@ (%.6f) modificationDate:%@ (%.3f) burst:%@ burstIdentifier:%@>", v4, v5, v6, v9, v10, v13, v15, v16];

  if (v14) {
  return (NSString *)v17;
  }
}

- (CAMTransientAsset)init
{
  [(CAMTransientAsset *)self doesNotRecognizeSelector:a2];
  return [(CAMTransientAsset *)self initWithUUID:&stru_26BD78BA0];
}

- (void)_populateVideoTransientAssetFromConvertible:(id)a3
{
  id v4 = a3;
  char v5 = [v4 isTransientAssetTemporaryPlaceholder];
  double v6 = [v4 placeholderImage];

  if (v6)
  {
    id v7 = [v4 placeholderImage];
    placeholderImage = self->_placeholderImage;
    self->_placeholderImage = v7;
  }
  uint64_t v9 = [v4 persistenceURL];
  objc_super v10 = v9;
  if ((v5 & 1) == 0)
  {
    uint64_t v11 = (NSURL *)[v9 copy];
    persistenceURL = self->_persistenceURL;
    self->_persistenceURL = v11;
  }
  [v4 finalExpectedPixelSize];
  if (v13 == 0.0 || (double height = v14, v14 == 0.0))
  {
    double v17 = [MEMORY[0x263EFA8D0] assetWithURL:v10];
    double v18 = [v17 tracksWithMediaType:*MEMORY[0x263EF9D48]];
    double v19 = [v18 firstObject];

    if (v19)
    {
      CGFloat v20 = *MEMORY[0x263F00148];
      CGFloat v21 = *(double *)(MEMORY[0x263F00148] + 8);
      [v19 naturalSize];
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      [v19 preferredTransform];
      v34.origin.x = v20;
      v34.origin.y = v21;
      v34.size.double width = v23;
      v34.size.double height = v25;
      CGRect v35 = CGRectApplyAffineTransform(v34, &v33);
      v35.origin.x = 0.0;
      v35.origin.y = 0.0;
      CGRect v36 = CGRectStandardize(v35);
      double width = v36.size.width;
      double height = v36.size.height;
    }
    else
    {
      [(UIImage *)self->_placeholderImage size];
      double width = v26;
      double height = v27;
    }
  }
  else
  {
    double width = v13;
  }
  if (width > 0.0 && height > 0.0)
  {
    self->_pixelWidth = (unint64_t)width;
    self->_pixelHeight = (unint64_t)height;
  }
  if ((v5 & 1) == 0)
  {
    if (v4) {
      [v4 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    self->_duration = CMTimeGetSeconds(&time);
  }
  v28 = [v4 captureDate];
  objc_storeStrong((id *)&self->_creationDate, v28);
  modificationDate = self->_modificationDate;
  self->_modificationDate = v28;
  v30 = v28;

  self->_representsBurst = 0;
  burstIdentifier = self->_burstIdentifier;
  self->_burstIdentifier = 0;

  self->_numberOfRepresentedAssets = 0;
}

- (BOOL)hasPhotoColorAdjustments
{
  return self->_HDR;
}

- (unint64_t)isContentEqualTo:(id)a3
{
  id v4 = (CAMTransientAsset *)a3;
  char v5 = v4;
  if (v4 == self) {
    goto LABEL_14;
  }
  double v6 = [(CAMTransientAsset *)v4 uuid];
  id v7 = [(CAMTransientAsset *)self uuid];
  int v8 = [v6 isEqualToString:v7];

  if (!v8)
  {
    unint64_t v11 = v5 == 0;
    goto LABEL_15;
  }
  unint64_t v9 = [(CAMTransientAsset *)self mediaType];
  BOOL v10 = [(CAMTransientAsset *)self canPlayPhotoIris];
  if (v9 == 2 || v10)
  {
    uint64_t v12 = [(CAMTransientAsset *)self persistenceURL];
    if (v12 || (objc_opt_respondsToSelector() & 1) == 0)
    {
    }
    else
    {
      double v13 = [(CAMTransientAsset *)v5 persistenceURL];

      if (v13) {
        goto LABEL_5;
      }
    }
    if ([(CAMTransientAsset *)self isTemporaryPlaceholder])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_5;
      }
    }
LABEL_14:
    unint64_t v11 = 2;
    goto LABEL_15;
  }
LABEL_5:
  unint64_t v11 = 1;
LABEL_15:

  return v11;
}

- (NSDate)localCreationDate
{
  return self->_localCreationDate;
}

- (BOOL)isTemporaryPlaceholder
{
  return self->_isTemporaryPlaceholder;
}

- (BOOL)canPlayLoopingVideo
{
  return self->_canPlayLoopingVideo;
}

- (BOOL)isPhotoIrisPlaceholder
{
  return self->_isPhotoIrisPlaceholder;
}

- (NSURL)persistenceURL
{
  return self->_persistenceURL;
}

- (BOOL)isHDR
{
  return self->_HDR;
}

- (BOOL)representsBurst
{
  return self->_representsBurst;
}

- (unint64_t)numberOfRepresentedAssets
{
  return self->_numberOfRepresentedAssets;
}

@end