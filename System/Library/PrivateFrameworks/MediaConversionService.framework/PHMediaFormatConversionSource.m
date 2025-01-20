@interface PHMediaFormatConversionSource
+ (Class)requestClass;
+ (id)imageSourceForFileURL:(id)a3;
+ (id)imageSourceForFileURL:(id)a3 dimensions:(CGSize)a4;
+ (id)sourceForFileURL:(id)a3;
+ (id)sourceForFileURL:(id)a3 mediaType:(int64_t)a4 imageDimensions:(CGSize)a5;
+ (id)videoSourceForFileURL:(id)a3;
- (BOOL)checkForIsHDR;
- (BOOL)containsHEIFImage;
- (BOOL)containsHEVCVideo;
- (BOOL)containsImageWithFormatEligibleForTranscoding;
- (BOOL)containsProResVideoWithFormatEligibleForTranscoding;
- (BOOL)containsVideoWithFormatEligibleForTranscoding;
- (BOOL)determineMediaTypeFromPathExtensionWithError:(id *)a3;
- (BOOL)didCheckForIsHDR;
- (BOOL)didCheckForLivePhotoPairingIdentifier;
- (BOOL)didCheckForVideoWithFormatEligibleForTranscoding;
- (BOOL)isHDR;
- (BOOL)preflightWithError:(id *)a3;
- (BOOL)preflighted;
- (CGSize)imageDimensions;
- (NSString)livePhotoPairingIdentifier;
- (NSString)renderOriginatingSignature;
- (PFMetadata)metadata;
- (id)transcodingEligibleVideoTrackFormatDescription;
- (int64_t)accessibilityDescriptionMetadataStatus;
- (int64_t)captionMetadataStatus;
- (int64_t)locationMetadataStatus;
- (int64_t)sourceAccessibilityDescriptionMetadataStatus;
- (int64_t)sourceCaptionMetadataStatus;
- (int64_t)sourceLocationMetadataStatus;
- (unsigned)firstVideoTrackCodec;
- (void)checkForAccessibilityDescriptionData;
- (void)checkForCaptionData;
- (void)checkForImageEligibleForTranscoding;
- (void)checkForLivePhotoPairingIdentifier;
- (void)checkForLocationData;
- (void)checkForVideoEligibleForTranscoding;
- (void)markAccessibilityDescriptionMetadataAsCheckedWithStatus:(int64_t)a3;
- (void)markCaptionMetadataAsCheckedWithStatus:(int64_t)a3;
- (void)markContainsVideoEligibleForTranscodingAsCheckedWithValue:(BOOL)a3 codec:(unsigned int)a4;
- (void)markContainsVideoEligibleForTranscodingAsCheckedWithValue:(BOOL)a3 codec:(unsigned int)a4 isProRes:(BOOL)a5;
- (void)markIsHDRAsCheckedWithValue:(BOOL)a3;
- (void)markLivePhotoPairingIdentifierAsCheckedWithValue:(id)a3;
- (void)markLocationMetadataAsCheckedWithStatus:(int64_t)a3;
- (void)setAccessibilityDescriptionMetadataStatus:(int64_t)a3;
- (void)setCaptionMetadataStatus:(int64_t)a3;
- (void)setContainsVideoWithFormatEligibleForTranscoding:(BOOL)a3;
- (void)setDidCheckForIsHDR:(BOOL)a3;
- (void)setDidCheckForLivePhotoPairingIdentifier:(BOOL)a3;
- (void)setDidCheckForVideoWithFormatEligibleForTranscoding:(BOOL)a3;
- (void)setFirstVideoTrackCodec:(unsigned int)a3;
- (void)setImageDimensions:(CGSize)a3;
- (void)setIsHDR:(BOOL)a3;
- (void)setLivePhotoPairingIdentifier:(id)a3;
- (void)setLocationMetadataStatus:(int64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setPreflighted:(BOOL)a3;
- (void)setRenderOriginatingSignature:(id)a3;
@end

@implementation PHMediaFormatConversionSource

- (BOOL)containsHEIFImage
{
  return self->_containsHEIFImage;
}

- (NSString)renderOriginatingSignature
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)markLivePhotoPairingIdentifierAsCheckedWithValue:(id)a3
{
  id v4 = a3;
  [(PHMediaFormatConversionSource *)self setDidCheckForLivePhotoPairingIdentifier:1];
  [(PHMediaFormatConversionSource *)self setLivePhotoPairingIdentifier:v4];
}

- (void)setLivePhotoPairingIdentifier:(id)a3
{
}

- (void)setDidCheckForLivePhotoPairingIdentifier:(BOOL)a3
{
  self->_didCheckForLivePhotoPairingIdentifier = a3;
}

+ (Class)requestClass
{
  return (Class)objc_opt_class();
}

+ (id)sourceForFileURL:(id)a3 mediaType:(int64_t)a4 imageDimensions:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v10 = a3;
  if (!v10)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PHMediaFormatConversion.m", 154, @"Invalid parameter not satisfying: %@", @"fileURL" object file lineNumber description];
  }
  v11 = objc_opt_new();
  [v11 setFileURL:v10];
  [v11 setMediaType:a4];
  objc_msgSend(v11, "setImageDimensions:", width, height);

  return v11;
}

- (void)setImageDimensions:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_imageDimensions, &v3, 16, 1, 0);
}

- (BOOL)preflightWithError:(id *)a3
{
  if ([(PHMediaFormatConversionSource *)self preflighted])
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:299 description:@"Preflight of already preflighted source"];
  }
  [(PHMediaFormatConversionSource *)self setPreflighted:1];
  if ([(PHMediaFormatConversionContent *)self mediaType]
    || (BOOL v6 = [(PHMediaFormatConversionSource *)self determineMediaTypeFromPathExtensionWithError:a3]))
  {
    if ([(PHMediaFormatConversionContent *)self mediaType] == 2)
    {
      [(PHMediaFormatConversionSource *)self checkForImageEligibleForTranscoding];
    }
    else if ([(PHMediaFormatConversionContent *)self mediaType] == 1)
    {
      [(PHMediaFormatConversionSource *)self checkForVideoEligibleForTranscoding];
    }
    [(PHMediaFormatConversionSource *)self checkForIsHDR];
    [(PHMediaFormatConversionSource *)self checkForLivePhotoPairingIdentifier];
    [(PHMediaFormatConversionSource *)self checkForLocationData];
    [(PHMediaFormatConversionSource *)self checkForCaptionData];
    [(PHMediaFormatConversionSource *)self checkForAccessibilityDescriptionData];
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (void)checkForLivePhotoPairingIdentifier
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (![(PHMediaFormatConversionSource *)self didCheckForLivePhotoPairingIdentifier])
  {
    CGSize v3 = [(PHMediaFormatConversionSource *)self metadata];
    id v4 = v3;
    if (v3)
    {
      v5 = [v3 livePhotoPairingIdentifier];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        BOOL v6 = [(PHMediaFormatConversionContent *)self fileURL];
        int v8 = 138412546;
        v9 = v5;
        __int16 v10 = 2112;
        v11 = v6;
        _os_log_debug_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Read pairing identifier: %@ from file: %@", (uint8_t *)&v8, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v7 = [(PHMediaFormatConversionContent *)self fileURL];
        int v8 = 138412290;
        v9 = v7;
        _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to read pairing identifier from %@", (uint8_t *)&v8, 0xCu);
      }
      v5 = 0;
    }
    [(PHMediaFormatConversionSource *)self markLivePhotoPairingIdentifierAsCheckedWithValue:v5];
  }
}

- (BOOL)didCheckForLivePhotoPairingIdentifier
{
  return self->_didCheckForLivePhotoPairingIdentifier;
}

- (void)checkForLocationData
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_locationMetadataStatus)
  {
    int64_t v3 = [(PHMediaFormatConversionSource *)self sourceLocationMetadataStatus];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      id v4 = [(PHMediaFormatConversionContent *)self fileURL];
      int v5 = 134218242;
      int64_t v6 = v3;
      __int16 v7 = 2112;
      int v8 = v4;
      _os_log_debug_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Read location metadata status: %ld from file: %@", (uint8_t *)&v5, 0x16u);
    }
    [(PHMediaFormatConversionSource *)self markLocationMetadataAsCheckedWithStatus:v3];
  }
}

- (void)checkForCaptionData
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_captionMetadataStatus)
  {
    int64_t v3 = [(PHMediaFormatConversionSource *)self sourceCaptionMetadataStatus];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      id v4 = [(PHMediaFormatConversionContent *)self fileURL];
      int v5 = 134218242;
      int64_t v6 = v3;
      __int16 v7 = 2112;
      int v8 = v4;
      _os_log_debug_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Read caption metadata status: %ld from file: %@", (uint8_t *)&v5, 0x16u);
    }
    [(PHMediaFormatConversionSource *)self markCaptionMetadataAsCheckedWithStatus:v3];
  }
}

- (void)checkForAccessibilityDescriptionData
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (!self->_accessibilityDescriptionMetadataStatus)
  {
    int64_t v3 = [(PHMediaFormatConversionSource *)self sourceAccessibilityDescriptionMetadataStatus];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      id v4 = [(PHMediaFormatConversionContent *)self fileURL];
      int v5 = 134218242;
      int64_t v6 = v3;
      __int16 v7 = 2112;
      int v8 = v4;
      _os_log_debug_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Read accessibility description metadata status: %ld from file: %@", (uint8_t *)&v5, 0x16u);
    }
    [(PHMediaFormatConversionSource *)self markAccessibilityDescriptionMetadataAsCheckedWithStatus:v3];
  }
}

- (void)setPreflighted:(BOOL)a3
{
  self->_preflighted = a3;
}

- (BOOL)preflighted
{
  return self->_preflighted;
}

- (void)markLocationMetadataAsCheckedWithStatus:(int64_t)a3
{
  self->_locationMetadataStatus = a3;
}

- (void)markCaptionMetadataAsCheckedWithStatus:(int64_t)a3
{
  self->_captionMetadataStatus = a3;
}

- (void)markAccessibilityDescriptionMetadataAsCheckedWithStatus:(int64_t)a3
{
  self->_accessibilityDescriptionMetadataStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transcodingEligibleVideoTrackFormatDescription, 0);
  objc_storeStrong((id *)&self->_livePhotoPairingIdentifier, 0);
  objc_storeStrong((id *)&self->_renderOriginatingSignature, 0);
  objc_storeStrong((id *)&self->_cachedMetadata, 0);
}

- (void)setDidCheckForIsHDR:(BOOL)a3
{
  self->_didCheckForIsHDR = a3;
}

- (BOOL)didCheckForIsHDR
{
  return self->_didCheckForIsHDR;
}

- (void)setIsHDR:(BOOL)a3
{
  self->_isHDR = a3;
}

- (BOOL)isHDR
{
  return self->_isHDR;
}

- (id)transcodingEligibleVideoTrackFormatDescription
{
  return self->_transcodingEligibleVideoTrackFormatDescription;
}

- (void)setAccessibilityDescriptionMetadataStatus:(int64_t)a3
{
  self->_accessibilityDescriptionMetadataStatus = a3;
}

- (int64_t)accessibilityDescriptionMetadataStatus
{
  return self->_accessibilityDescriptionMetadataStatus;
}

- (void)setCaptionMetadataStatus:(int64_t)a3
{
  self->_captionMetadataStatus = a3;
}

- (int64_t)captionMetadataStatus
{
  return self->_captionMetadataStatus;
}

- (void)setLocationMetadataStatus:(int64_t)a3
{
  self->_locationMetadataStatus = a3;
}

- (int64_t)locationMetadataStatus
{
  return self->_locationMetadataStatus;
}

- (void)setDidCheckForVideoWithFormatEligibleForTranscoding:(BOOL)a3
{
  self->_didCheckForVideoWithFormatEligibleForTranscoding = a3;
}

- (BOOL)didCheckForVideoWithFormatEligibleForTranscoding
{
  return self->_didCheckForVideoWithFormatEligibleForTranscoding;
}

- (BOOL)containsImageWithFormatEligibleForTranscoding
{
  return self->_containsImageWithFormatEligibleForTranscoding;
}

- (BOOL)containsProResVideoWithFormatEligibleForTranscoding
{
  return self->_containsProResVideoWithFormatEligibleForTranscoding;
}

- (void)setContainsVideoWithFormatEligibleForTranscoding:(BOOL)a3
{
  self->_containsVideoWithFormatEligibleForTranscoding = a3;
}

- (BOOL)containsVideoWithFormatEligibleForTranscoding
{
  return self->_containsVideoWithFormatEligibleForTranscoding;
}

- (void)setFirstVideoTrackCodec:(unsigned int)a3
{
  self->_firstVideoTrackCodec = a3;
}

- (unsigned)firstVideoTrackCodec
{
  return self->_firstVideoTrackCodec;
}

- (CGSize)imageDimensions
{
  objc_copyStruct(v4, &self->_imageDimensions, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setRenderOriginatingSignature:(id)a3
{
}

- (void)setMetadata:(id)a3
{
}

- (NSString)livePhotoPairingIdentifier
{
  if (![(PHMediaFormatConversionSource *)self preflighted])
  {
    int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    __int16 v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"PHMediaFormatConversion.m", 445, @"Source must be preflighted or marked as checked before accessing %@", v7 object file lineNumber description];
  }
  livePhotoPairingIdentifier = self->_livePhotoPairingIdentifier;
  return livePhotoPairingIdentifier;
}

- (int64_t)sourceAccessibilityDescriptionMetadataStatus
{
  double v2 = [(PHMediaFormatConversionSource *)self metadata];
  double v3 = v2;
  if (v2)
  {
    id v4 = [v2 artworkContentDescription];
    if (v4) {
      int64_t v5 = 2;
    }
    else {
      int64_t v5 = 3;
    }
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

- (int64_t)sourceCaptionMetadataStatus
{
  double v2 = [(PHMediaFormatConversionSource *)self metadata];
  double v3 = v2;
  if (v2)
  {
    id v4 = [v2 captionAbstract];
    if (v4) {
      int64_t v5 = 2;
    }
    else {
      int64_t v5 = 3;
    }
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

- (int64_t)sourceLocationMetadataStatus
{
  double v2 = [(PHMediaFormatConversionSource *)self metadata];
  double v3 = v2;
  if (v2)
  {
    id v4 = [v2 gpsLocation];
    if (v4) {
      int64_t v5 = 2;
    }
    else {
      int64_t v5 = 3;
    }
  }
  else
  {
    int64_t v5 = 1;
  }

  return v5;
}

- (PFMetadata)metadata
{
  cachedMetadata = self->_cachedMetadata;
  if (!cachedMetadata)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F8CC48]);
    int64_t v5 = [(PHMediaFormatConversionContent *)self fileURL];
    int64_t v6 = (PFMetadata *)[v4 initWithMediaURL:v5 options:13 timeZoneLookup:0 shouldCache:1];
    __int16 v7 = self->_cachedMetadata;
    self->_cachedMetadata = v6;

    cachedMetadata = self->_cachedMetadata;
  }
  return cachedMetadata;
}

- (void)checkForImageEligibleForTranscoding
{
  double v3 = [(PFMetadata *)self->_cachedMetadata contentType];

  if (v3)
  {
    id v4 = [(PFMetadata *)self->_cachedMetadata contentType];
    self->_containsHEIFImage = [v4 conformsToType:*MEMORY[0x1E4F44568]];
  }
  else
  {
    id v4 = [(PHMediaFormatConversionContent *)self fileURL];
    int64_t v5 = [v4 pathExtension];
    int64_t v6 = [v5 lowercaseString];
    self->_containsHEIFImage = [&unk_1F394BF88 containsObject:v6];
  }
  __int16 v7 = [(PFMetadata *)self->_cachedMetadata contentType];
  if (!v7)
  {
    int v8 = (void *)MEMORY[0x1E4F442D8];
    uint64_t v9 = [(PHMediaFormatConversionContent *)self fileURL];
    __int16 v10 = [v9 pathExtension];
    __int16 v7 = [v8 typeWithFilenameExtension:v10 conformingToType:*MEMORY[0x1E4F44400]];
  }
  v11 = [MEMORY[0x1E4F8CDF8] imageTypesNotWellSupportedForSharing];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__PHMediaFormatConversionSource_checkForImageEligibleForTranscoding__block_invoke;
  v16[3] = &unk_1E6CFE9D8;
  id v12 = v7;
  id v17 = v12;
  uint64_t v13 = [v11 indexOfObjectPassingTest:v16];
  if ([(PFMetadata *)self->_cachedMetadata isHDR_TS22028]) {
    char v14 = 1;
  }
  else {
    char v14 = [(PFMetadata *)self->_cachedMetadata isHDR_ExtendedRange];
  }
  if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
    BOOL v15 = v14;
  }
  else {
    BOOL v15 = 1;
  }
  self->_containsImageWithFormatEligibleForTranscoding = v15;
}

uint64_t __68__PHMediaFormatConversionSource_checkForImageEligibleForTranscoding__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) conformsToType:a2];
}

- (void)markIsHDRAsCheckedWithValue:(BOOL)a3
{
  self->_isHDR = a3;
  self->_didCheckForIsHDR = 1;
}

- (BOOL)checkForIsHDR
{
  if (self->_didCheckForIsHDR) {
    return self->_isHDR;
  }
  if (!self->_preflighted)
  {
    __int16 v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:255 description:@"Must preflight source before calling this method"];
  }
  if (!self->_containsVideoWithFormatEligibleForTranscoding
    || self->_didCheckForLivePhotoPairingIdentifier && self->_livePhotoPairingIdentifier)
  {
    uint64_t v4 = 0;
  }
  else
  {
    int64_t v5 = [(PHMediaFormatConversionSource *)self metadata];
    uint64_t v4 = [v5 isHDR];
  }
  [(PHMediaFormatConversionSource *)self markIsHDRAsCheckedWithValue:v4];
  return [(PHMediaFormatConversionSource *)self isHDR];
}

- (BOOL)containsHEVCVideo
{
  if (![(PHMediaFormatConversionSource *)self preflighted])
  {
    int64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PHMediaFormatConversion.m" lineNumber:247 description:@"Must preflight source before calling this method"];
  }
  return self->_containsVideoWithFormatEligibleForTranscoding;
}

- (void)markContainsVideoEligibleForTranscodingAsCheckedWithValue:(BOOL)a3 codec:(unsigned int)a4 isProRes:(BOOL)a5
{
  self->_didCheckForVideoWithFormatEligibleForTranscoding = 1;
  self->_containsVideoWithFormatEligibleForTranscoding = a3;
  self->_firstVideoTrackCodec = a4;
  self->_containsProResVideoWithFormatEligibleForTranscoding = a5;
}

- (void)markContainsVideoEligibleForTranscodingAsCheckedWithValue:(BOOL)a3 codec:(unsigned int)a4
{
}

- (void)checkForVideoEligibleForTranscoding
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!self->_didCheckForVideoWithFormatEligibleForTranscoding)
  {
    self->_didCheckForVideoWithFormatEligibleForTranscoding = 1;
    double v3 = [(PHMediaFormatConversionSource *)self metadata];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 firstVideoTrackCodec];
      uint64_t v6 = v5;
      if (!self->_firstVideoTrackCodec) {
        self->_firstVideoTrackCodec = v5;
      }
      if ([MEMORY[0x1E4F8CC30] videoCodecIsProResEligibleForBackwardsCompatibilityTranscoding:v5])self->_containsProResVideoWithFormatEligibleForTranscoding = 1; {
      if ([MEMORY[0x1E4F8CC30] videoCodecIsEligibleForBackwardsCompatibilityTranscoding:v6])
      }
      {
        self->_containsVideoWithFormatEligibleForTranscoding = 1;
        __int16 v7 = [v4 videoTrackFormatDescription];
        id transcodingEligibleVideoTrackFormatDescription = self->_transcodingEligibleVideoTrackFormatDescription;
        self->_id transcodingEligibleVideoTrackFormatDescription = v7;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = [(PHMediaFormatConversionContent *)self fileURL];
      int v10 = 138412290;
      v11 = v9;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to get metadata for URL: %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (BOOL)determineMediaTypeFromPathExtensionWithError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[PHMediaFormatConversionContent typeFromFileExtensionWithError:](self, "typeFromFileExtensionWithError:");
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  if (![v5 conformsToType:*MEMORY[0x1E4F44400]])
  {
    if ([v6 conformsToType:*MEMORY[0x1E4F44448]])
    {
      LOBYTE(a3) = 1;
      [(PHMediaFormatConversionContent *)self setMediaType:1];
      goto LABEL_10;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v10 = [(NSURL *)self->super._fileURL path];
      *(_DWORD *)buf = 138478083;
      char v14 = v10;
      __int16 v15 = 2114;
      v16 = v6;
      _os_log_error_impl(&dword_1DD979000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to determine image/video type for %{private}@ from UTI %{public}@", buf, 0x16u);

      if (!a3) {
        goto LABEL_10;
      }
    }
    else if (!a3)
    {
      goto LABEL_10;
    }
    __int16 v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    uint64_t v12 = @"Unable to determine source media type from type identifier. Use videoSourceForFileURL/imageSourceForFileURL instead";
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    *a3 = [v7 errorWithDomain:@"PHMediaFormatConversionErrorDomain" code:2 userInfo:v8];

LABEL_9:
    LOBYTE(a3) = 0;
    goto LABEL_10;
  }
  [(PHMediaFormatConversionContent *)self setMediaType:2];
  LOBYTE(a3) = 1;
LABEL_10:

  return (char)a3;
}

+ (id)sourceForFileURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 pathExtension];
  uint64_t v6 = [v5 lowercaseString];

  if ([v6 isEqualToString:@"pvt"])
  {
    __int16 v7 = PHMediaFormatConversionLivePhotoBundleSource;
LABEL_5:
    uint64_t v8 = [(__objc2_class *)v7 sourceForFileURL:v4];
    goto LABEL_7;
  }
  if ([v6 isEqualToString:@"photosasset"])
  {
    __int16 v7 = PHMediaFormatConversionAssetBundleSource;
    goto LABEL_5;
  }
  uint64_t v8 = objc_msgSend(a1, "sourceForFileURL:mediaType:imageDimensions:", v4, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
LABEL_7:
  uint64_t v9 = (void *)v8;

  return v9;
}

+ (id)imageSourceForFileURL:(id)a3 dimensions:(CGSize)a4
{
  return (id)objc_msgSend(a1, "sourceForFileURL:mediaType:imageDimensions:", a3, 2, a4.width, a4.height);
}

+ (id)imageSourceForFileURL:(id)a3
{
  return (id)objc_msgSend(a1, "sourceForFileURL:mediaType:imageDimensions:", a3, 2, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

+ (id)videoSourceForFileURL:(id)a3
{
  return (id)objc_msgSend(a1, "sourceForFileURL:mediaType:imageDimensions:", a3, 1, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

@end