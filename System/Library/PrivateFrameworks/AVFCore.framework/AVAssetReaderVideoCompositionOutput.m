@interface AVAssetReaderVideoCompositionOutput
+ (AVAssetReaderVideoCompositionOutput)assetReaderVideoCompositionOutputWithVideoTracks:(NSArray *)videoTracks videoSettings:(NSDictionary *)videoSettings;
- (AVAssetReaderVideoCompositionOutput)init;
- (AVAssetReaderVideoCompositionOutput)initWithVideoTracks:(NSArray *)videoTracks videoSettings:(NSDictionary *)videoSettings;
- (AVVideoComposition)videoComposition;
- (BOOL)_enableTrackExtractionReturningError:(id *)a3;
- (BOOL)_prepareForReadingReturningError:(id *)a3;
- (BOOL)alwaysCopiesSampleData;
- (NSArray)videoTracks;
- (NSDictionary)videoSettings;
- (id)_asset;
- (id)_errorForOSStatus:(int)a3;
- (id)_formatDescriptions;
- (id)_videoCompositionProcessorColorProperties;
- (id)customVideoCompositor;
- (id)description;
- (id)mediaType;
- (id)sampleDataTrackIDs;
- (void)_setVideoComposition:(id)a3;
- (void)_setVideoComposition:(id)a3 customVideoCompositorSession:(id)a4;
- (void)dealloc;
- (void)setVideoComposition:(AVVideoComposition *)videoComposition;
@end

@implementation AVAssetReaderVideoCompositionOutput

+ (AVAssetReaderVideoCompositionOutput)assetReaderVideoCompositionOutputWithVideoTracks:(NSArray *)videoTracks videoSettings:(NSDictionary *)videoSettings
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithVideoTracks:videoTracks videoSettings:videoSettings];
  return (AVAssetReaderVideoCompositionOutput *)v4;
}

- (AVAssetReaderVideoCompositionOutput)init
{
  return [(AVAssetReaderVideoCompositionOutput *)self initWithVideoTracks:0 videoSettings:0];
}

- (AVAssetReaderVideoCompositionOutput)initWithVideoTracks:(NSArray *)videoTracks videoSettings:(NSDictionary *)videoSettings
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v54.receiver = self;
  v54.super_class = (Class)AVAssetReaderVideoCompositionOutput;
  v7 = [(AVAssetReaderOutput *)&v54 init];
  v8 = v7;
  if (!videoTracks)
  {
    v32 = v7;
    v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    uint64_t v31 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, @"invalid parameter not satisfying: %s", v33, v34, v35, v36, v37, (uint64_t)"videoTracks != nil");
LABEL_30:
    objc_exception_throw((id)[v27 exceptionWithName:v28 reason:v31 userInfo:0]);
  }
  v47 = a2;
  v48 = videoSettings;
  if (![(NSArray *)videoTracks count])
  {
    v38 = v8;
    v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    v46 = (NSString *)"[videoTracks count] >= 1";
    v29 = @"invalid parameter not satisfying: %s";
LABEL_29:
    uint64_t v31 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, v47, (uint64_t)v29, v22, v23, v24, v25, v26, (uint64_t)v46);
    goto LABEL_30;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v9 = [(NSArray *)videoTracks countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v51;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v51 != v12) {
        objc_enumerationMutation(videoTracks);
      }
      v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      v15 = (void *)[v14 mediaType];
      if (([v15 isEqualToString:@"vide"] & 1) == 0
        && ([v15 isEqualToString:@"auxv"] & 1) == 0)
      {
        v30 = v8;
        v27 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v28 = *MEMORY[0x1E4F1C3C8];
        v29 = @"tracks must all have media type AVMediaTypeVideo";
        goto LABEL_29;
      }
      uint64_t v16 = [v14 asset];
      if (v11)
      {
        if (v16 != v11)
        {
          v21 = v8;
          v27 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v28 = *MEMORY[0x1E4F1C3C8];
          v29 = @"tracks must all be part of the same AVAsset";
          goto LABEL_29;
        }
      }
      else
      {
        uint64_t v11 = v16;
      }
    }
    uint64_t v10 = [(NSArray *)videoTracks countByEnumeratingWithState:&v50 objects:v55 count:16];
  }
  while (v10);
LABEL_16:
  if (v8)
  {
    v17 = objc_alloc_init(AVAssetReaderVideoCompositionOutputInternal);
    v8->_videoCompositionOutputInternal = v17;
    if (!v17)
    {

      return 0;
    }
    CFRetain(v17);
    v8->_videoCompositionOutputInternal->videoTracks = (NSArray *)[(NSArray *)videoTracks copyWithZone:[(AVAssetReaderVideoCompositionOutput *)v8 zone]];
    if (v48)
    {
      if ([(NSDictionary *)v48 objectForKey:@"AVVideoCleanApertureKey"]
        || [(NSDictionary *)v48 objectForKey:@"AVVideoPixelAspectRatioKey"])
      {
        v39 = v8;
        v27 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v28 = *MEMORY[0x1E4F1C3C8];
        v40 = (objc_class *)objc_opt_class();
        v46 = NSStringFromClass(v40);
        v29 = @"%@ does not currently support AVVideoCleanApertureKey or AVVideoPixelAspectRatioKey";
      }
      else if ([(NSDictionary *)v48 objectForKey:@"AVVideoScalingModeKey"])
      {
        v41 = v8;
        v27 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v28 = *MEMORY[0x1E4F1C3C8];
        v42 = (objc_class *)objc_opt_class();
        v46 = NSStringFromClass(v42);
        v29 = @"%@ does not currently support AVVideoScalingModeKey";
      }
      else if ([(NSDictionary *)v48 objectForKey:@"AVVideoDecompressionPropertiesKey"])
      {
        v43 = v8;
        v27 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v28 = *MEMORY[0x1E4F1C3C8];
        v44 = (objc_class *)objc_opt_class();
        v46 = NSStringFromClass(v44);
        v29 = @"%@ does not currently support AVVideoDecompressionPropertiesKey";
      }
      else
      {
        v49 = 0;
        v8->_videoCompositionOutputInternal->videoOutputSettings = (AVVideoOutputSettings *)+[AVVideoOutputSettings _videoOutputSettingsWithVideoSettingsDictionary:v48 exceptionReason:&v49];
        videoOutputSettings = v8->_videoCompositionOutputInternal->videoOutputSettings;
        if (videoOutputSettings)
        {
          if ([(AVOutputSettings *)videoOutputSettings willYieldCompressedSamples])
          {
            v19 = v8;
            v27 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v28 = *MEMORY[0x1E4F1C3C8];
            v29 = @"AVAssetReaderOutput does not currently support compressed output";
            goto LABEL_29;
          }
          return v8;
        }
        v45 = v8;
        v27 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v28 = *MEMORY[0x1E4F1C3C8];
        v29 = v49;
      }
      goto LABEL_29;
    }
  }
  return v8;
}

- (void)dealloc
{
  videoCompositionOutputInternal = self->_videoCompositionOutputInternal;
  if (videoCompositionOutputInternal)
  {

    v4 = self->_videoCompositionOutputInternal;
    figVideoCompositor = v4->figVideoCompositor;
    if (figVideoCompositor)
    {
      CFRelease(figVideoCompositor);
      v4 = self->_videoCompositionOutputInternal;
    }

    CFRelease(self->_videoCompositionOutputInternal);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVAssetReaderVideoCompositionOutput;
  [(AVAssetReaderOutput *)&v6 dealloc];
}

- (BOOL)alwaysCopiesSampleData
{
  int v3 = dyld_program_sdk_at_least();
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVAssetReaderVideoCompositionOutput;
    LOBYTE(v3) = [(AVAssetReaderOutput *)&v5 alwaysCopiesSampleData];
  }
  return v3;
}

- (id)description
{
  int v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p, videoTracks = %@>", NSStringFromClass(v4), self, -[AVAssetReaderVideoCompositionOutput videoTracks](self, "videoTracks")];
}

- (NSArray)videoTracks
{
  return self->_videoCompositionOutputInternal->videoTracks;
}

- (id)sampleDataTrackIDs
{
  return self->_videoCompositionOutputInternal->sampleDataTrackIDs;
}

- (NSDictionary)videoSettings
{
  return [(AVVideoOutputSettings *)self->_videoCompositionOutputInternal->videoOutputSettings videoSettingsDictionary];
}

- (AVVideoComposition)videoComposition
{
  return self->_videoCompositionOutputInternal->videoComposition;
}

- (void)_setVideoComposition:(id)a3
{
  if (a3)
  {
    v18 = 0;
    if ([a3 _isValidReturningExceptionReason:&v18])
    {
      [a3 renderScale];
      if (v11 == 1.0) {
        goto LABEL_4;
      }
      v13 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v14 = *MEMORY[0x1E4F1C3C8];
      v15 = @"AVAssetReaderVideoCompositionOutput can't use a video composition with a renderScale other than 1.0";
    }
    else
    {
      v13 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v14 = *MEMORY[0x1E4F1C3C8];
      v15 = v18;
    }
    uint64_t v16 = objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v15, v6, v7, v8, v9, v10, v17), 0);
    objc_exception_throw(v16);
  }
LABEL_4:
  uint64_t v12 = (AVVideoComposition *)[a3 copy];

  self->_videoCompositionOutputInternal->videoComposition = v12;
  self->_videoCompositionOutputInternal->sampleDataTrackIDs = [(AVVideoComposition *)v12 sourceSampleDataTrackIDs];
}

- (void)_setVideoComposition:(id)a3 customVideoCompositorSession:(id)a4
{
  if ([(AVAssetReaderOutput *)self _status] >= 1)
  {
    uint64_t v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot be called after reading has started", v8, v9, v10, v11, v12, v17), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  videoCompositionOutputInternal = self->_videoCompositionOutputInternal;
  if (videoCompositionOutputInternal->videoComposition != a3
    || videoCompositionOutputInternal->customVideoCompositorSession != a4)
  {
    [(AVAssetReaderVideoCompositionOutput *)self _setVideoComposition:a3];
    id v14 = a4;

    self->_videoCompositionOutputInternal->customVideoCompositorSession = (AVCustomVideoCompositorSession *)a4;
    figVideoCompositor = self->_videoCompositionOutputInternal->figVideoCompositor;
    if (figVideoCompositor) {
      CFRelease(figVideoCompositor);
    }
    self->_videoCompositionOutputInternal->figVideoCompositor = (void *)[a4 _copyFigVideoCompositor];
  }
}

- (void)setVideoComposition:(AVVideoComposition *)videoComposition
{
  if ([(AVAssetReaderOutput *)self _status] >= 1)
  {
    id v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"cannot be called after reading has started", v6, v7, v8, v9, v10, (uint64_t)v15), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  if (self->_videoCompositionOutputInternal->videoComposition != videoComposition)
  {
    [(AVAssetReaderVideoCompositionOutput *)self _setVideoComposition:videoComposition];
    v15 = 0;
    uint64_t v16 = 0;
    [(AVVideoComposition *)self->_videoCompositionOutputInternal->videoComposition _copyFigVideoCompositor:&v16 andSession:&v15 recyclingSession:self->_videoCompositionOutputInternal->customVideoCompositorSession forFigRemaker:1 error:0];
    videoCompositionOutputInternal = self->_videoCompositionOutputInternal;
    figVideoCompositor = videoCompositionOutputInternal->figVideoCompositor;
    if (figVideoCompositor)
    {
      CFRelease(figVideoCompositor);
      videoCompositionOutputInternal = self->_videoCompositionOutputInternal;
    }
    videoCompositionOutputInternal->figVideoCompositor = v16;
    v13 = self->_videoCompositionOutputInternal->customVideoCompositorSession;
    self->_videoCompositionOutputInternal->customVideoCompositorSession = v15;
  }
}

- (id)customVideoCompositor
{
  return [(AVCustomVideoCompositorSession *)self->_videoCompositionOutputInternal->customVideoCompositorSession customVideoCompositor];
}

- (id)mediaType
{
  id v2 = [(NSArray *)self->_videoCompositionOutputInternal->videoTracks objectAtIndex:0];
  return (id)[v2 mediaType];
}

- (id)_asset
{
  id v2 = [(NSArray *)[(AVAssetReaderVideoCompositionOutput *)self videoTracks] objectAtIndex:0];
  return (id)[v2 asset];
}

- (id)_errorForOSStatus:(int)a3
{
  if (a3 == -16180
    && (customVideoCompositorSession = self->_videoCompositionOutputInternal->customVideoCompositorSession) != 0)
  {
    return [(AVCustomVideoCompositorSession *)customVideoCompositorSession getAndClearClientError];
  }
  else
  {
    return +[AVAssetReader _errorForOSStatus:](AVAssetReader, "_errorForOSStatus:");
  }
}

- (BOOL)_prepareForReadingReturningError:(id *)a3
{
  objc_super v5 = [(AVAssetReaderVideoCompositionOutput *)self videoComposition];
  if (!v5) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"*** AVAssetReaderVideoCompositionOutput.videoComposition needs to be set" userInfo:0]);
  }
  uint64_t v6 = v5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v14 = 0u;
  id v7 = [(AVWeakReference *)[(AVAssetReaderOutput *)self _weakReferenceToAssetReader] referencedObject];
  if (v7)
  {
    [v7 timeRange];
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
  }
  id v8 = [(AVAssetReaderVideoCompositionOutput *)self _asset];
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  if ([(AVVideoComposition *)v6 isValidForAsset:v8 timeRange:v13 validationDelegate:0])
  {
    v12.receiver = self;
    v12.super_class = (Class)AVAssetReaderVideoCompositionOutput;
    return [(AVAssetReaderOutput *)&v12 _prepareForReadingReturningError:a3];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AVFoundationErrorDomain" code:-11841 userInfo:0];
    if (a3)
    {
      uint64_t v11 = (void *)v10;
      BOOL result = 0;
      *a3 = v11;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)_formatDescriptions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(AVAssetReaderVideoCompositionOutput *)self videoTracks];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "formatDescriptions"));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)_videoCompositionProcessorColorProperties
{
  int v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  id v7 = 0;
  uint64_t v8 = 0;
  [(AVVideoComposition *)self->_videoCompositionOutputInternal->videoComposition videoCompositionOutputColorPropertiesWithCustomCompositor:self->_videoCompositionOutputInternal->customVideoCompositorSession formatDescriptions:[(AVAssetReaderVideoCompositionOutput *)self _formatDescriptions] colorPrimaries:&v10 transferFunction:&v9 yCbCrMatrix:&v8 perFrameHDRDisplayMetadataPolicy:&v7];
  if (v10) {
    [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F34B20]];
  }
  if (v9) {
    [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F34B28]];
  }
  if (v8) {
    [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F34B30]];
  }
  int v4 = [v7 isEqual:@"PerFrameHDRDisplayMetadataPolicy_Generate"];
  uint64_t v5 = (void *)MEMORY[0x1E4F34B18];
  if (v4) {
    uint64_t v5 = (void *)MEMORY[0x1E4F34B10];
  }
  [v3 setObject:*v5 forKeyedSubscript:*MEMORY[0x1E4F34B38]];
  return v3;
}

- (BOOL)_enableTrackExtractionReturningError:(id *)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  uint64_t v67 = 0;
  unsigned int v66 = -1;
  uint64_t v5 = [(AVAssetReaderVideoCompositionOutput *)self videoTracks];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v5, "count"));
  v59 = [(AVAssetReaderOutput *)self _figAssetReaderExtractionOptions];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v63;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v63 != v9) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", (int)objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * v10++), "trackID")));
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v5 countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v8);
  }
  videoOutputSettings = self->_videoCompositionOutputInternal->videoOutputSettings;
  id v12 = +[AVAssetReaderOutput _figAssetReaderVideoScalingPropertiesFromVideoSettings:videoOutputSettings withFormatDescription:[(AVAssetReaderVideoCompositionOutput *)self _formatDescriptions]];
  if ([(AVOutputSettings *)videoOutputSettings willYieldCompressedSamples])
  {
    LODWORD(v13) = [(AVVideoOutputSettings *)videoOutputSettings videoCodecType];
    uint64_t v14 = [(AVVideoOutputSettings *)videoOutputSettings videoEncoderSpecification];
    uint64_t v15 = [(AVVideoOutputSettings *)videoOutputSettings pixelTransferProperties];
    long long v16 = (void *)[(AVVideoOutputSettings *)videoOutputSettings videoCompressionProperties];
    if (v15)
    {
      long long v16 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v16];
      [v16 setObject:v15 forKey:*MEMORY[0x1E4F44A68]];
    }
    int v17 = [(AVVideoOutputSettings *)videoOutputSettings width];
    int v57 = [(AVVideoOutputSettings *)videoOutputSettings height];
    id v56 = 0;
    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = [(AVVideoOutputSettings *)videoOutputSettings pixelBufferAttributes];
    [(AVVideoComposition *)self->_videoCompositionOutputInternal->videoComposition renderSize];
    int v17 = (int)v19;
    [(AVVideoComposition *)self->_videoCompositionOutputInternal->videoComposition renderSize];
    int v21 = (int)v20;
    id v22 = [(AVAssetReaderVideoCompositionOutput *)self _videoCompositionProcessorColorProperties];
    customVideoCompositorSession = self->_videoCompositionOutputInternal->customVideoCompositorSession;
    if (customVideoCompositorSession)
    {
      uint64_t v13 = 0;
      if (![(AVCustomVideoCompositorSession *)customVideoCompositorSession commitCustomVideoCompositorPropertiesAndReturnError:&v67])goto LABEL_38; {
      id v56 = v22;
      }
      int v57 = v21;
      long long v16 = 0;
      uint64_t v14 = 0;
    }
    else
    {
      id v56 = v22;
      int v57 = v21;
      long long v16 = 0;
      uint64_t v14 = 0;
      LODWORD(v13) = 0;
    }
  }
  if (!self->_videoCompositionOutputInternal->figVideoCompositor)
  {
    uint64_t v13 = 0;
    uint64_t v67 = AVLocalizedError(@"AVFoundationErrorDomain", -11841, 0);
    goto LABEL_38;
  }
  v58 = a3;
  uint64_t v24 = [(AVAssetReaderOutput *)self _figAssetReader];
  id v53 = [(AVAssetReaderVideoCompositionOutput *)self sampleDataTrackIDs];
  long long v52 = AVVideoCompositionSerializeSourceTrackWindows([(AVVideoComposition *)self->_videoCompositionOutputInternal->videoComposition sourceVideoTrackWindowsForTrackIDs]);
  uint64_t v25 = AVVideoCompositionSerializeSourceTrackWindows([(AVVideoComposition *)self->_videoCompositionOutputInternal->videoComposition sourceSampleDataTrackWindowsForTrackIDs]);
  videoCompositionOutputInternal = self->_videoCompositionOutputInternal;
  figVideoCompositor = videoCompositionOutputInternal->figVideoCompositor;
  long long v51 = v25;
  uint64_t v49 = [(AVVideoComposition *)videoCompositionOutputInternal->videoComposition _serializableInstructions];
  BOOL v27 = [(AVVideoComposition *)self->_videoCompositionOutputInternal->videoComposition _hasLayerAsAuxiliaryTrack];
  videoComposition = self->_videoCompositionOutputInternal->videoComposition;
  int v55 = v17;
  if (v27)
  {
    id v29 = [(AVVideoComposition *)videoComposition _auxiliaryTrackLayer];
  }
  else
  {
    if (![(AVVideoComposition *)videoComposition _hasPostProcessingLayers])
    {
      id v48 = 0;
      goto LABEL_24;
    }
    id v29 = [(AVVideoComposition *)self->_videoCompositionOutputInternal->videoComposition _postProcessingRootLayer];
  }
  id v48 = v29;
LABEL_24:
  id v54 = v12;
  if ([(AVVideoComposition *)self->_videoCompositionOutputInternal->videoComposition _hasLayerAsAuxiliaryTrack])
  {
    int v47 = [(AVVideoComposition *)self->_videoCompositionOutputInternal->videoComposition _auxiliaryTrackID];
  }
  else
  {
    int v47 = 0;
  }
  uint64_t v30 = v14;
  if ([(AVVideoComposition *)self->_videoCompositionOutputInternal->videoComposition _hasPostProcessingLayers])
  {
    id v31 = [(AVVideoComposition *)self->_videoCompositionOutputInternal->videoComposition _postProcessingVideoLayers];
  }
  else
  {
    id v31 = 0;
  }
  v32 = self->_videoCompositionOutputInternal->videoComposition;
  uint64_t v33 = v18;
  if (v32)
  {
    [(AVVideoComposition *)v32 frameDuration];
    v32 = self->_videoCompositionOutputInternal->videoComposition;
  }
  else
  {
    long long v60 = 0uLL;
    uint64_t v61 = 0;
  }
  CMPersistentTrackID v34 = [(AVVideoComposition *)v32 sourceTrackIDForFrameTiming];
  [(AVVideoComposition *)self->_videoCompositionOutputInternal->videoComposition renderSize];
  double v36 = v35;
  [(AVVideoComposition *)self->_videoCompositionOutputInternal->videoComposition renderSize];
  double v38 = v37;
  uint64_t v39 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v39) {
    uint64_t v40 = v39;
  }
  else {
    uint64_t v40 = 0;
  }
  v41 = *(uint64_t (**)(OpaqueFigAssetReader *, void *, id, void *, void *, void *, uint64_t, id, int, id, void, void, long long *, uint64_t, uint64_t, int, uint64_t, id, _DWORD, uint64_t, void *, void, id, NSDictionary *, unsigned int *))(v40 + 160);
  if (!v41)
  {
    id v42 = (id)v67;
    BOOL v43 = v67 != 0;
    uint64_t v13 = 4294954514;
    a3 = v58;
    goto LABEL_42;
  }
  long long v68 = v60;
  uint64_t v69 = v61;
  HIDWORD(v46) = v55;
  HIDWORD(v45) = (int)v36;
  LODWORD(v46) = (int)v38;
  LODWORD(v45) = v34;
  uint64_t v13 = v41(v24, v6, v53, v52, v51, figVideoCompositor, v49, v48, v47, v31, 0, 0, &v68, v45, v46, v57, v33, v54, v13,
          v30,
          v16,
          0,
          v56,
          v59,
          &v66);
  a3 = v58;
LABEL_38:
  id v42 = (id)v67;
  BOOL v43 = v67 != 0;
  if (!v13 && !v67)
  {
    [(AVAssetReaderOutput *)self _setExtractionID:v66];
    return 1;
  }
LABEL_42:
  if (!a3) {
    return 0;
  }
  if (!v43) {
    id v42 = +[AVAssetReader _errorForOSStatus:v13];
  }
  BOOL result = 0;
  *a3 = v42;
  return result;
}

@end