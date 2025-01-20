@interface PUEditingInitialPayload
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoStillDisplayTime;
- (CLLocation)location;
- (NSData)displaySizeImageData;
- (NSData)placeholderImageData;
- (NSDate)creationDate;
- (NSString)accessibilityDescription;
- (NSString)fullSizeImageURLSandboxExtensionToken;
- (NSString)uniformTypeIdentifier;
- (NSString)videoPathSandboxExtensionToken;
- (NSURL)fullSizeImageURL;
- (NSURL)videoURL;
- (PHAdjustmentData)adjustmentData;
- (PUEditingInitialPayload)initWithCoder:(id)a3;
- (int)fullSizeImageExifOrientation;
- (int64_t)adjustmentBaseVersion;
- (int64_t)mediaType;
- (int64_t)playbackStyle;
- (unint64_t)mediaSubtypes;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibilityDescription:(id)a3;
- (void)setAdjustmentBaseVersion:(int64_t)a3;
- (void)setAdjustmentData:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDisplaySizeImageData:(id)a3;
- (void)setFullSizeImageExifOrientation:(int)a3;
- (void)setFullSizeImageURL:(id)a3;
- (void)setFullSizeImageURLSandboxExtensionToken:(id)a3;
- (void)setLivePhotoStillDisplayTime:(id *)a3;
- (void)setLocation:(id)a3;
- (void)setMediaSubtypes:(unint64_t)a3;
- (void)setMediaType:(int64_t)a3;
- (void)setPlaceholderImageData:(id)a3;
- (void)setPlaybackStyle:(int64_t)a3;
- (void)setUniformTypeIdentifier:(id)a3;
- (void)setVideoPathSandboxExtensionToken:(id)a3;
- (void)setVideoURL:(id)a3;
@end

@implementation PUEditingInitialPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniformTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_fullSizeImageURLSandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_fullSizeImageURL, 0);
  objc_storeStrong((id *)&self->_videoPathSandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_displaySizeImageData, 0);
  objc_storeStrong((id *)&self->_placeholderImageData, 0);
  objc_storeStrong((id *)&self->_adjustmentData, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (void)setUniformTypeIdentifier:(id)a3
{
}

- (NSString)uniformTypeIdentifier
{
  return self->_uniformTypeIdentifier;
}

- (void)setAccessibilityDescription:(id)a3
{
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setFullSizeImageExifOrientation:(int)a3
{
  self->_fullSizeImageExifOrientation = a3;
}

- (int)fullSizeImageExifOrientation
{
  return self->_fullSizeImageExifOrientation;
}

- (void)setFullSizeImageURLSandboxExtensionToken:(id)a3
{
}

- (NSString)fullSizeImageURLSandboxExtensionToken
{
  return self->_fullSizeImageURLSandboxExtensionToken;
}

- (void)setFullSizeImageURL:(id)a3
{
}

- (NSURL)fullSizeImageURL
{
  return self->_fullSizeImageURL;
}

- (void)setLivePhotoStillDisplayTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_livePhotoStillDisplayTime.epoch = a3->var3;
  *(_OWORD *)&self->_livePhotoStillDisplayTime.value = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoStillDisplayTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 136);
  return self;
}

- (void)setVideoPathSandboxExtensionToken:(id)a3
{
}

- (NSString)videoPathSandboxExtensionToken
{
  return self->_videoPathSandboxExtensionToken;
}

- (void)setVideoURL:(id)a3
{
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setDisplaySizeImageData:(id)a3
{
}

- (NSData)displaySizeImageData
{
  return self->_displaySizeImageData;
}

- (void)setPlaceholderImageData:(id)a3
{
}

- (NSData)placeholderImageData
{
  return self->_placeholderImageData;
}

- (void)setAdjustmentBaseVersion:(int64_t)a3
{
  self->_adjustmentBaseVersion = a3;
}

- (int64_t)adjustmentBaseVersion
{
  return self->_adjustmentBaseVersion;
}

- (void)setAdjustmentData:(id)a3
{
}

- (PHAdjustmentData)adjustmentData
{
  return self->_adjustmentData;
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

- (void)setPlaybackStyle:(int64_t)a3
{
  self->_playbackStyle = a3;
}

- (int64_t)playbackStyle
{
  return self->_playbackStyle;
}

- (void)setMediaSubtypes:(unint64_t)a3
{
  self->_mediaSubtypes = a3;
}

- (unint64_t)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t mediaType = self->_mediaType;
  id v5 = a3;
  [v5 encodeInteger:mediaType forKey:@"mediaType"];
  [v5 encodeInteger:self->_mediaSubtypes forKey:@"mediaSubtypes"];
  [v5 encodeInteger:self->_playbackStyle forKey:@"playbackStyle"];
  [v5 encodeObject:self->_creationDate forKey:@"creationDate"];
  [v5 encodeObject:self->_location forKey:@"location"];
  [v5 encodeObject:self->_adjustmentData forKey:@"adjustmentData"];
  [v5 encodeInteger:self->_adjustmentBaseVersion forKey:@"adjustmentBaseVersion"];
  [v5 encodeObject:self->_placeholderImageData forKey:@"placeholderImageData"];
  [v5 encodeObject:self->_displaySizeImageData forKey:@"displaySizeImageData"];
  [v5 encodeObject:self->_videoURL forKey:@"videoURL"];
  [v5 encodeObject:self->_videoPathSandboxExtensionToken forKey:@"videoPathSandboxExtensionToken"];
  [v5 encodeInt64:self->_livePhotoStillDisplayTime.value forKey:@"livePhotoStillDisplayTime.value"];
  [v5 encodeInt32:self->_livePhotoStillDisplayTime.timescale forKey:@"livePhotoStillDisplayTime.timescale"];
  [v5 encodeInt32:self->_livePhotoStillDisplayTime.flags forKey:@"livePhotoStillDisplayTime.flags"];
  [v5 encodeInt64:self->_livePhotoStillDisplayTime.epoch forKey:@"livePhotoStillDisplayTime.epoch"];
  [v5 encodeObject:self->_uniformTypeIdentifier forKey:@"uniformTypeIdentifier"];
  [v5 encodeObject:self->_fullSizeImageURL forKey:@"fullSizeImageURL"];
  [v5 encodeObject:self->_fullSizeImageURLSandboxExtensionToken forKey:@"fullSizeImageURLSandboxExtensionToken"];
  [v5 encodeInt:self->_fullSizeImageExifOrientation forKey:@"fullSizeImageExifOrientation"];
  [v5 encodeObject:self->_accessibilityDescription forKey:@"accessibilityDescription"];
}

- (PUEditingInitialPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PUEditingInitialPayload;
  id v5 = [(PUEditingInitialPayload *)&v30 init];
  if (v5)
  {
    *((void *)v5 + 2) = [v4 decodeIntegerForKey:@"mediaType"];
    *((void *)v5 + 3) = [v4 decodeIntegerForKey:@"mediaSubtypes"];
    *((void *)v5 + 4) = [v4 decodeIntegerForKey:@"playbackStyle"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    v7 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    v9 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adjustmentData"];
    v11 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v10;

    *((void *)v5 + 8) = [v4 decodeIntegerForKey:@"adjustmentBaseVersion"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderImageData"];
    v13 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displaySizeImageData"];
    v15 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"videoURL"];
    v17 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"videoPathSandboxExtensionToken"];
    v19 = (void *)*((void *)v5 + 12);
    *((void *)v5 + 12) = v18;

    CMTimeMake(&v29, [v4 decodeInt64ForKey:@"livePhotoStillDisplayTime.value"], objc_msgSend(v4, "decodeInt32ForKey:", @"livePhotoStillDisplayTime.timescale"));
    *(CMTime *)(v5 + 136) = v29;
    *((_DWORD *)v5 + 37) = [v4 decodeInt32ForKey:@"livePhotoStillDisplayTime.flags"];
    *((void *)v5 + 19) = [v4 decodeInt64ForKey:@"livePhotoStillDisplayTime.epoch"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniformTypeIdentifier"];
    v21 = (void *)*((void *)v5 + 16);
    *((void *)v5 + 16) = v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullSizeImageURL"];
    v23 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullSizeImageURLSandboxExtensionToken"];
    v25 = (void *)*((void *)v5 + 14);
    *((void *)v5 + 14) = v24;

    *((_DWORD *)v5 + 2) = [v4 decodeIntForKey:@"fullSizeImageExifOrientation"];
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilityDescription"];
    v27 = (void *)*((void *)v5 + 15);
    *((void *)v5 + 15) = v26;
  }
  return (PUEditingInitialPayload *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end