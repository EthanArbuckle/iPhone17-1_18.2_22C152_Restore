@interface AVCapturePhoto
+ (id)AVFileTypeFromFigCaptureStillImageSettingsFileType:(int)a3 codec:(unsigned int)a4 unresolvedSettings:(id)a5;
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)dimensions;
- (AVCameraCalibrationData)cameraCalibrationData;
- (AVCaptureBracketedStillImageSettings)bracketSettings;
- (AVCaptureDeviceType)sourceDeviceType;
- (AVCaptureLensStabilizationStatus)lensStabilizationStatus;
- (AVCapturePhoto)initWithTimestamp:(id *)a3 photoSurface:(__IOSurface *)a4 photoSurfaceSize:(unint64_t)a5 processedFileType:(id)a6 previewPhotoSurface:(__IOSurface *)a7 embeddedThumbnailSourceSurface:(__IOSurface *)a8 metadata:(id)a9 depthDataSurface:(__IOSurface *)a10 depthMetadataDictionary:(id)a11 portraitEffectsMatteSurface:(__IOSurface *)a12 portraitEffectsMatteMetadataDictionary:(id)a13 hairSegmentationMatteSurface:(__IOSurface *)a14 hairSegmentationMatteMetadataDictionary:(id)a15 skinSegmentationMatteSurface:(__IOSurface *)a16 skinSegmentationMatteMetadataDictionary:(id)a17 teethSegmentationMatteSurface:(__IOSurface *)a18 teethSegmentationMatteMetadataDictionary:(id)a19 glassesSegmentationMatteSurface:(__IOSurface *)a20 glassesSegmentationMatteMetadataDictionary:(id)a21 constantColorConfidenceMapSurface:(__IOSurface *)a22 constantColorMetadataDictionary:(id)a23 captureRequest:(id)a24 bracketSettings:(id)a25 sequenceCount:(unint64_t)a26 photoCount:(unint64_t)a27 expectedPhotoProcessingFlags:(unsigned int)a28 sourceDeviceType:(id)a29;
- (AVCapturePhotoInternal)internal;
- (AVCaptureResolvedPhotoSettings)resolvedSettings;
- (AVDepthData)depthData;
- (AVPortraitEffectsMatte)portraitEffectsMatte;
- (AVSemanticSegmentationMatte)semanticSegmentationMatteForType:(AVSemanticSegmentationMatteType)semanticSegmentationMatteType;
- (BOOL)_isCompressedPhoto;
- (BOOL)_isProRAWPhoto;
- (BOOL)_isSushiRAWPhoto;
- (BOOL)_isUncompressedYUVOrRGBPhoto;
- (BOOL)isConstantColorFallbackPhoto;
- (BOOL)isRawPhoto;
- (CGImageRef)CGImageRepresentation;
- (CGImageRef)previewCGImageRepresentation;
- (CMTime)timestamp;
- (CVPixelBufferRef)pixelBuffer;
- (CVPixelBufferRef)previewPixelBuffer;
- (NSData)fileDataRepresentation;
- (NSData)fileDataRepresentationWithCustomizer:(id)customizer;
- (NSData)fileDataRepresentationWithReplacementMetadata:(NSDictionary *)replacementMetadata replacementEmbeddedThumbnailPhotoFormat:(NSDictionary *)replacementEmbeddedThumbnailPhotoFormat replacementEmbeddedThumbnailPixelBuffer:(CVPixelBufferRef)replacementEmbeddedThumbnailPixelBuffer replacementDepthData:(AVDepthData *)replacementDepthData;
- (NSDictionary)embeddedThumbnailPhotoFormat;
- (NSDictionary)metadata;
- (NSInteger)photoCount;
- (NSInteger)sequenceCount;
- (__CVBuffer)_embeddedThumbnailSourcePixelBuffer;
- (__CVBuffer)constantColorConfidenceMap;
- (float)constantColorCenterWeightedMeanConfidenceLevel;
- (float)focusPixelBlurScore;
- (id)_defaultRawCompressionSettings;
- (id)_fileDataRepresentationWithReplacementMetadata:(id)a3 replacementEmbeddedThumbnailPhotoFormat:(id)a4 replacementEmbeddedThumbnailPixelBuffer:(__CVBuffer *)a5 replacementDepthData:(id)a6 replacementPortraitEffectsMatte:(id)a7 replacementHairSegmentationMatte:(id)a8 replacementSkinSegmentationMatte:(id)a9 replacementTeethSegmentationMatte:(id)a10 replacementGlassesSegmentationMatte:(id)a11 replacementRawCompressionSettings:(id)a12 exceptionReason:(id *)a13;
- (id)debugDescription;
- (id)description;
- (id)livePhotoMovieFileURL;
- (id)portraitMetadata;
- (id)privateClientMetadata;
- (id)processedFileType;
- (int)_maximumAppleProRAWBitDepth;
- (unsigned)_orientation;
- (unsigned)actualPhotoProcessingFlags;
- (unsigned)expectedPhotoProcessingFlags;
- (unsigned)photoProcessingFlags;
- (void)dealloc;
@end

@implementation AVCapturePhoto

+ (void)initialize
{
}

- (AVCapturePhoto)initWithTimestamp:(id *)a3 photoSurface:(__IOSurface *)a4 photoSurfaceSize:(unint64_t)a5 processedFileType:(id)a6 previewPhotoSurface:(__IOSurface *)a7 embeddedThumbnailSourceSurface:(__IOSurface *)a8 metadata:(id)a9 depthDataSurface:(__IOSurface *)a10 depthMetadataDictionary:(id)a11 portraitEffectsMatteSurface:(__IOSurface *)a12 portraitEffectsMatteMetadataDictionary:(id)a13 hairSegmentationMatteSurface:(__IOSurface *)a14 hairSegmentationMatteMetadataDictionary:(id)a15 skinSegmentationMatteSurface:(__IOSurface *)a16 skinSegmentationMatteMetadataDictionary:(id)a17 teethSegmentationMatteSurface:(__IOSurface *)a18 teethSegmentationMatteMetadataDictionary:(id)a19 glassesSegmentationMatteSurface:(__IOSurface *)a20 glassesSegmentationMatteMetadataDictionary:(id)a21 constantColorConfidenceMapSurface:(__IOSurface *)a22 constantColorMetadataDictionary:(id)a23 captureRequest:(id)a24 bracketSettings:(id)a25 sequenceCount:(unint64_t)a26 photoCount:(unint64_t)a27 expectedPhotoProcessingFlags:(unsigned int)a28 sourceDeviceType:(id)a29
{
  v73.receiver = self;
  v73.super_class = (Class)AVCapturePhoto;
  v35 = [(AVCapturePhoto *)&v73 init];
  if (v35)
  {
    IOSurfaceRef v70 = a8;
    objc_msgSend(NSString, "stringWithFormat:", @" constantColorConfidence:%p", a22);
    v36 = objc_alloc_init(AVCapturePhotoInternal);
    v35->_internal = v36;
    if (v36)
    {
      long long v37 = *(_OWORD *)&a3->var0;
      v36->timestamp.epoch = a3->var3;
      *(_OWORD *)&v36->timestamp.value = v37;
      if (a4) {
        v38 = (__IOSurface *)CFRetain(a4);
      }
      else {
        v38 = 0;
      }
      surface = a4;
      IOSurfaceRef v69 = a7;
      id v39 = a25;
      v35->_internal->photoSurface = v38;
      v35->_internal->photoSurfaceSize = a5;
      if (!a6) {
        a6 = (id)objc_msgSend((id)objc_msgSend(a24, "unresolvedSettings"), "processedFileType");
      }
      unsigned int v40 = a28;
      v35->_internal->processedFileType = (NSString *)a6;
      if (a9)
      {
        v35->_internal->privateClientMetadata = [[AVCapturePhotoPrivateClientMetadata alloc] initWithMetadataDictionary:a9];
        if (v35->_internal->privateClientMetadata)
        {
          v41 = (void *)[a9 mutableCopy];
          [v41 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F51418]];
        }
        else
        {
          v41 = 0;
        }
        uint64_t v42 = [a9 objectForKeyedSubscript:0x1EF4DF9B0];
        if (v42)
        {
          v35->_internal->portraitMetadata = [[AVApplePortraitMetadata alloc] initWithPortraitMetadataDictionary:v42];
          if (!v41) {
            v41 = (void *)[a9 mutableCopy];
          }
          [v41 setObject:0 forKeyedSubscript:0x1EF4DF9B0];
        }
        id v39 = a25;
        if (v41)
        {

          v35->_internal->metadata = (NSDictionary *)[v41 copy];
        }
        else
        {
          v35->_internal->metadata = (NSDictionary *)a9;
        }
        unsigned int v40 = a28;
      }
      else
      {
        v35->_internal->metadata = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
      }
      v35->_internal->resolvedSettings = (AVCaptureResolvedPhotoSettings *)(id)[a24 resolvedSettings];
      v35->_internal->unresolvedSettings = (AVCapturePhotoSettings *)(id)[a24 unresolvedSettings];
      v35->_internal->bracketSettings = (AVCaptureBracketedStillImageSettings *)v39;
      v35->_internal->sequenceCount = a26;
      v35->_internal->photoCount = a27;
      v35->_internal->sourceDeviceType = (NSString *)a29;
      v43 = (void *)[a9 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
      v35->_internal->expectedPhotoProcessingFlags = v40;
      v35->_internal->actualPhotoProcessingFlags = objc_msgSend((id)objc_msgSend(v43, "objectForKeyedSubscript:", @"25"), "unsignedIntValue");
      BOOL v44 = [(AVCapturePhoto *)v35 _isSushiRAWPhoto];
      BOOL v45 = [(AVCapturePhoto *)v35 _isProRAWPhoto];
      v35->_internal->lensStabilizationSupported = [a24 lensStabilizationSupported];
      resolvedSettings = v35->_internal->resolvedSettings;
      v47 = (uint64_t *)MEMORY[0x1E4F47D00];
      if (v44 || v45)
      {
        unint64_t v48 = [(AVCaptureResolvedPhotoSettings *)resolvedSettings rawEmbeddedThumbnailDimensions];
        unint64_t v49 = HIDWORD(v48);
        v50 = [(AVCapturePhotoSettings *)v35->_internal->unresolvedSettings rawEmbeddedThumbnailPhotoFormat];
      }
      else
      {
        unint64_t v48 = [(AVCaptureResolvedPhotoSettings *)resolvedSettings embeddedThumbnailDimensions];
        unint64_t v49 = HIDWORD(v48);
        v50 = [(AVCapturePhotoSettings *)v35->_internal->unresolvedSettings embeddedThumbnailPhotoFormat];
      }
      uint64_t v51 = *v47;
      uint64_t v52 = [(NSDictionary *)v50 objectForKeyedSubscript:*v47];
      v53 = surface;
      if (v49)
      {
        if (v48)
        {
          uint64_t v54 = v52;
          if (v52)
          {
            id v55 = objc_alloc(MEMORY[0x1E4F1C9E8]);
            uint64_t v56 = [NSNumber numberWithInt:v48];
            uint64_t v57 = *MEMORY[0x1E4F47DB0];
            uint64_t v58 = [NSNumber numberWithInt:v49];
            v35->_internal->embeddedThumbnailPhotoFormat = (NSDictionary *)objc_msgSend(v55, "initWithObjectsAndKeys:", v54, v51, v56, v57, v58, *MEMORY[0x1E4F47D60], 0);
            v53 = surface;
          }
        }
      }
      v59 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
      if (v53 && (v44 || [(AVCapturePhoto *)v35 _isUncompressedYUVOrRGBPhoto])) {
        CVPixelBufferCreateWithIOSurface(*v59, v53, 0, &v35->_internal->photoPixelBuffer);
      }
      if (v69) {
        CVPixelBufferCreateWithIOSurface(*v59, v69, 0, &v35->_internal->previewPixelBuffer);
      }
      if (v70) {
        CVPixelBufferCreateWithIOSurface(*v59, v70, 0, &v35->_internal->embeddedThumbnailSourcePixelBuffer);
      }
      if (a10)
      {
        CVPixelBufferRef pixelBufferOut = 0;
        CVPixelBufferCreateWithIOSurface(*v59, a10, 0, &pixelBufferOut);
        v60 = [AVDepthData alloc];
        v35->_internal->depthData = [(AVDepthData *)v60 initWithPixelBuffer:pixelBufferOut depthMetadataDictionary:a11];
        if (pixelBufferOut) {
          CFRelease(pixelBufferOut);
        }
      }
      if (a12)
      {
        CVPixelBufferRef pixelBufferOut = 0;
        CVPixelBufferCreateWithIOSurface(*v59, a12, 0, &pixelBufferOut);
        v61 = [AVPortraitEffectsMatte alloc];
        v35->_internal->portraitEffectsMatte = [(AVPortraitEffectsMatte *)v61 initWithPixelBuffer:pixelBufferOut portraitEffectsMatteMetadataDictionary:a13];
        if (pixelBufferOut) {
          CFRelease(pixelBufferOut);
        }
      }
      if (a14)
      {
        CVPixelBufferRef pixelBufferOut = 0;
        CVPixelBufferCreateWithIOSurface(*v59, a14, 0, &pixelBufferOut);
        v62 = [AVSemanticSegmentationMatte alloc];
        v35->_internal->hairSegmentationMatte = [(AVSemanticSegmentationMatte *)v62 initWithType:@"AVSemanticSegmentationMatteTypeHair" pixelBuffer:pixelBufferOut semanticSegmentationMatteMetadataDictionary:a15];
        if (pixelBufferOut) {
          CFRelease(pixelBufferOut);
        }
      }
      if (a16)
      {
        CVPixelBufferRef pixelBufferOut = 0;
        CVPixelBufferCreateWithIOSurface(*v59, a16, 0, &pixelBufferOut);
        v63 = [AVSemanticSegmentationMatte alloc];
        v35->_internal->skinSegmentationMatte = [(AVSemanticSegmentationMatte *)v63 initWithType:@"AVSemanticSegmentationMatteTypeSkin" pixelBuffer:pixelBufferOut semanticSegmentationMatteMetadataDictionary:a17];
        if (pixelBufferOut) {
          CFRelease(pixelBufferOut);
        }
      }
      if (a18)
      {
        CVPixelBufferRef pixelBufferOut = 0;
        CVPixelBufferCreateWithIOSurface(*v59, a18, 0, &pixelBufferOut);
        v64 = [AVSemanticSegmentationMatte alloc];
        v35->_internal->teethSegmentationMatte = [(AVSemanticSegmentationMatte *)v64 initWithType:@"AVSemanticSegmentationMatteTypeTeeth" pixelBuffer:pixelBufferOut semanticSegmentationMatteMetadataDictionary:a19];
        if (pixelBufferOut) {
          CFRelease(pixelBufferOut);
        }
      }
      if (a20)
      {
        CVPixelBufferRef pixelBufferOut = 0;
        CVPixelBufferCreateWithIOSurface(*v59, a20, 0, &pixelBufferOut);
        v65 = [AVSemanticSegmentationMatte alloc];
        v35->_internal->glassesSegmentationMatte = [(AVSemanticSegmentationMatte *)v65 initWithType:@"AVSemanticSegmentationMatteTypeGlasses" pixelBuffer:pixelBufferOut semanticSegmentationMatteMetadataDictionary:a21];
        if (pixelBufferOut) {
          CFRelease(pixelBufferOut);
        }
      }
      if (a22)
      {
        CVPixelBufferRef pixelBufferOut = 0;
        CVPixelBufferCreateWithIOSurface(*v59, a22, 0, &pixelBufferOut);
        v35->_internal->constantColorConfidenceMap = pixelBufferOut;
        if (a23)
        {
          objc_msgSend((id)objc_msgSend(a23, "objectForKeyedSubscript:", *MEMORY[0x1E4F52580]), "floatValue");
          v35->_internal->constantColorCenterWeightedMeanConfidenceLevel = v66;
        }
      }
      BOOL v67 = [(AVCapturePhotoSettings *)v35->_internal->unresolvedSettings isCameraCalibrationDataDeliveryEnabled];
      if (a11 && v67) {
        v35->_internal->cameraCalibrationData = [[AVCameraCalibrationData alloc] initWithDepthMetadataDictionary:a11];
      }
    }
    else
    {

      return 0;
    }
  }
  return v35;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
    photoSurface = internal->photoSurface;
    if (photoSurface)
    {
      CFRelease(photoSurface);
      internal = self->_internal;
    }
    photoPixelBuffer = internal->photoPixelBuffer;
    if (photoPixelBuffer)
    {
      CFRelease(photoPixelBuffer);
      internal = self->_internal;
    }

    v6 = self->_internal;
    previewPixelBuffer = v6->previewPixelBuffer;
    if (previewPixelBuffer)
    {
      CFRelease(previewPixelBuffer);
      v6 = self->_internal;
    }
    embeddedThumbnailSourcePixelBuffer = v6->embeddedThumbnailSourcePixelBuffer;
    if (embeddedThumbnailSourcePixelBuffer)
    {
      CFRelease(embeddedThumbnailSourcePixelBuffer);
      v6 = self->_internal;
    }

    v9 = self->_internal;
    constantColorConfidenceMap = v9->constantColorConfidenceMap;
    if (constantColorConfidenceMap)
    {
      CFRelease(constantColorConfidenceMap);
      v9 = self->_internal;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)AVCapturePhoto;
  [(AVCapturePhoto *)&v11 dealloc];
}

- (id)debugDescription
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = objc_msgSend((id)-[AVCapturePhotoSettings bracketedSettings](self->_internal->unresolvedSettings, "bracketedSettings"), "count");
  }
  else {
    uint64_t v3 = 0;
  }
  BOOL v4 = [(AVCapturePhoto *)self isRawPhoto];
  internal = self->_internal;
  if (internal->bracketSettings)
  {
    v6 = (__CFString *)[NSString stringWithFormat:@" bracket:%d/%d lens:%d %@", internal->sequenceCount, v3, -[AVCapturePhoto lensStabilizationStatus](self, "lensStabilizationStatus"), -[AVCaptureBracketedStillImageSettings debugDescription](self->_internal->bracketSettings, "debugDescription")];
    internal = self->_internal;
  }
  else
  {
    v6 = &stru_1EF4D21D0;
  }
  if (v4) {
    v7 = @" (raw)";
  }
  else {
    v7 = &stru_1EF4D21D0;
  }
  long long v8 = *(_OWORD *)&internal->timestamp.value;
  time.epoch = internal->timestamp.epoch;
  *(_OWORD *)&time.value = v8;
  return (id)[NSString stringWithFormat:@"pts:%f %d/%d%@%@ settings:%@", CMTimeGetSeconds(&time), self->_internal->photoCount, -[AVCaptureResolvedPhotoSettings expectedPhotoCount](self->_internal->resolvedSettings, "expectedPhotoCount"), v7, v6, -[AVCaptureResolvedPhotoSettings debugDescription](self->_internal->resolvedSettings, "debugDescription")];
}

- (id)description
{
  uint64_t v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVCapturePhoto debugDescription](self, "debugDescription")];
}

- (CMTime)timestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(void *)&self->timescale + 8);
  return self;
}

- (BOOL)isRawPhoto
{
  if ([(AVCapturePhoto *)self _isSushiRAWPhoto]) {
    return 1;
  }

  return [(AVCapturePhoto *)self _isProRAWPhoto];
}

- (CVPixelBufferRef)pixelBuffer
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(AVCapturePhoto *)self _isProRAWPhoto])
  {
    internal = self->_internal;
    if (internal->photoSurface)
    {
      if (!internal->photoPixelBuffer)
      {
        uint64_t v5 = *MEMORY[0x1E4F56248];
        v6[0] = &unk_1EF4FA040;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
        CMPhotoDNGUnpack();
      }
    }
  }
  return self->_internal->photoPixelBuffer;
}

- (CVPixelBufferRef)previewPixelBuffer
{
  return self->_internal->previewPixelBuffer;
}

- (NSDictionary)embeddedThumbnailPhotoFormat
{
  v2 = self->_internal->embeddedThumbnailPhotoFormat;

  return v2;
}

- (AVDepthData)depthData
{
  internal = self->_internal;
  depthData = internal->depthData;
  if (depthData)
  {
    BOOL v4 = depthData;
    return v4;
  }
  else if ([(AVCapturePhotoSettings *)internal->unresolvedSettings isDepthDataDeliveryEnabled])
  {
    if (!self->_internal->didTryToDecodeDepthData
      && [(AVCapturePhoto *)self _isCompressedPhoto]
      && !avcp_copyFirstAuxiliaryImageOfType())
    {
      self->_internal->depthData = [[AVDepthData alloc] initWithPixelBuffer:0 auxiliaryMetadata:0];
    }
    self->_internal->didTryToDecodeDepthData = 1;
    return self->_internal->depthData;
  }
  else
  {
    return 0;
  }
}

- (AVPortraitEffectsMatte)portraitEffectsMatte
{
  internal = self->_internal;
  portraitEffectsMatte = internal->portraitEffectsMatte;
  if (portraitEffectsMatte)
  {
    BOOL v4 = portraitEffectsMatte;
    return v4;
  }
  else if ([(AVCapturePhotoSettings *)internal->unresolvedSettings isPortraitEffectsMatteDeliveryEnabled])
  {
    if (!self->_internal->didTryToDecodePortraitEffectsMatte
      && [(AVCapturePhoto *)self _isCompressedPhoto])
    {
      avcp_copyFirstAuxiliaryImageOfType();
    }
    self->_internal->didTryToDecodePortraitEffectsMatte = 1;
    return self->_internal->portraitEffectsMatte;
  }
  else
  {
    return 0;
  }
}

- (AVSemanticSegmentationMatte)semanticSegmentationMatteForType:(AVSemanticSegmentationMatteType)semanticSegmentationMatteType
{
  if ([(NSString *)semanticSegmentationMatteType isEqual:@"AVSemanticSegmentationMatteTypeSkin"])
  {
    internal = self->_internal;
    p_skinSegmentationMatte = (id *)&internal->skinSegmentationMatte;
    p_didTryToDecodeSkinSegmentationMatte = &internal->didTryToDecodeSkinSegmentationMatte;
  }
  else if ([(NSString *)semanticSegmentationMatteType isEqual:@"AVSemanticSegmentationMatteTypeHair"])
  {
    internal = self->_internal;
    p_skinSegmentationMatte = (id *)&internal->hairSegmentationMatte;
    p_didTryToDecodeSkinSegmentationMatte = &internal->didTryToDecodeHairSegmentationMatte;
  }
  else if ([(NSString *)semanticSegmentationMatteType isEqual:@"AVSemanticSegmentationMatteTypeTeeth"])
  {
    internal = self->_internal;
    p_skinSegmentationMatte = (id *)&internal->teethSegmentationMatte;
    p_didTryToDecodeSkinSegmentationMatte = &internal->didTryToDecodeTeethSegmentationMatte;
  }
  else
  {
    if (![(NSString *)semanticSegmentationMatteType isEqual:@"AVSemanticSegmentationMatteTypeGlasses"])return 0; {
    internal = self->_internal;
    }
    p_skinSegmentationMatte = (id *)&internal->glassesSegmentationMatte;
    p_didTryToDecodeSkinSegmentationMatte = &internal->didTryToDecodeGlassesSegmentationMatte;
  }
  if (*p_skinSegmentationMatte)
  {
    id v8 = *p_skinSegmentationMatte;
    return (AVSemanticSegmentationMatte *)v8;
  }
  if (![(NSArray *)[(AVCapturePhotoSettings *)internal->unresolvedSettings enabledSemanticSegmentationMatteTypes] containsObject:semanticSegmentationMatteType])return 0; {
  if (!*p_didTryToDecodeSkinSegmentationMatte && [(AVCapturePhoto *)self _isCompressedPhoto])
  }
    avcp_copyFirstAuxiliaryImageOfType();
  BOOL *p_didTryToDecodeSkinSegmentationMatte = 1;
  return (AVSemanticSegmentationMatte *)*p_skinSegmentationMatte;
}

- (NSDictionary)metadata
{
  v2 = self->_internal->metadata;

  return v2;
}

- (AVCameraCalibrationData)cameraCalibrationData
{
  v2 = self->_internal->cameraCalibrationData;

  return v2;
}

- (AVCaptureResolvedPhotoSettings)resolvedSettings
{
  v2 = self->_internal->resolvedSettings;

  return v2;
}

- (NSInteger)photoCount
{
  return self->_internal->photoCount;
}

- (AVCaptureDeviceType)sourceDeviceType
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)[(AVCapturePhotoSettings *)self->_internal->unresolvedSettings virtualDeviceConstituentPhotoDeliveryEnabledDevices] count])
  {
    id v3 = [(NSDictionary *)self->_internal->metadata objectForKeyedSubscript:*MEMORY[0x1E4F2F800]];
    objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E4F2F830]), "floatValue");
    float v5 = v4;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = [(AVCapturePhotoSettings *)self->_internal->unresolvedSettings virtualDeviceConstituentPhotoDeliveryEnabledDevices];
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_super v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          [v11 lensAperture];
          if (v5 == v12) {
            return (AVCaptureDeviceType)[v11 deviceType];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
  }
  return self->_internal->sourceDeviceType;
}

- (NSData)fileDataRepresentation
{
  if (!self->_internal->photoSurface) {
    return 0;
  }
  if (![(AVCapturePhoto *)self _isSushiRAWPhoto])
  {
    if ([(AVCapturePhoto *)self _isCompressedPhoto])
    {
      IOSurfaceLock(self->_internal->photoSurface, 1u, 0);
      uint64_t v7 = (NSData *)[MEMORY[0x1E4F1C9B8] dataWithBytes:IOSurfaceGetBaseAddress(self->_internal->photoSurface) length:self->_internal->photoSurfaceSize];
      IOSurfaceUnlock(self->_internal->photoSurface, 1u, 0);
      return v7;
    }
    if ([(AVCapturePhoto *)self _isUncompressedYUVOrRGBPhoto])
    {
      uint64_t v9 = [(AVCapturePhoto *)self embeddedThumbnailPhotoFormat];
      uint64_t v10 = [(NSDictionary *)v9 objectForKeyedSubscript:*MEMORY[0x1E4F47D00]];
      objc_super v11 = avcp_copyCGImageForUncompressedBuffer(self->_internal->photoPixelBuffer);
      float v5 = (NSData *)avcp_copyTIFFFileDataRepresentationForImage(v11, (const __CFDictionary *)[(AVCapturePhoto *)self metadata], v10);
      if (v11) {
        CFRelease(v11);
      }
      float v4 = v5;
      goto LABEL_4;
    }
    return 0;
  }
  id v3 = [(AVCapturePhoto *)self embeddedThumbnailPhotoFormat];
  float v4 = (NSData *)avcp_copyDNGFileDataRepresentationForSushiRawBuffer((uint64_t)[(AVCapturePhoto *)self pixelBuffer], (uint64_t)[(AVCapturePhoto *)self _embeddedThumbnailSourcePixelBuffer], (uint64_t)[(AVCapturePhoto *)self metadata], [(AVCapturePhoto *)self depthData], (uint64_t)[(NSDictionary *)v3 objectForKeyedSubscript:*MEMORY[0x1E4F47D00]], [(AVCaptureResolvedPhotoSettings *)self->_internal->resolvedSettings rawEmbeddedThumbnailDimensions]);
  float v5 = v4;
LABEL_4:
  v6 = v4;
  return v5;
}

- (NSData)fileDataRepresentationWithReplacementMetadata:(NSDictionary *)replacementMetadata replacementEmbeddedThumbnailPhotoFormat:(NSDictionary *)replacementEmbeddedThumbnailPhotoFormat replacementEmbeddedThumbnailPixelBuffer:(CVPixelBufferRef)replacementEmbeddedThumbnailPixelBuffer replacementDepthData:(AVDepthData *)replacementDepthData
{
  uint64_t v15 = 0;
  objc_super v11 = 0;
  if ([(AVCapturePhoto *)self depthData] == replacementDepthData) {
    objc_super v11 = [(AVCapturePhoto *)self portraitEffectsMatte];
  }
  float v12 = -[AVCapturePhoto _fileDataRepresentationWithReplacementMetadata:replacementEmbeddedThumbnailPhotoFormat:replacementEmbeddedThumbnailPixelBuffer:replacementDepthData:replacementPortraitEffectsMatte:replacementHairSegmentationMatte:replacementSkinSegmentationMatte:replacementTeethSegmentationMatte:replacementGlassesSegmentationMatte:replacementRawCompressionSettings:exceptionReason:](self, "_fileDataRepresentationWithReplacementMetadata:replacementEmbeddedThumbnailPhotoFormat:replacementEmbeddedThumbnailPixelBuffer:replacementDepthData:replacementPortraitEffectsMatte:replacementHairSegmentationMatte:replacementSkinSegmentationMatte:replacementTeethSegmentationMatte:replacementGlassesSegmentationMatte:replacementRawCompressionSettings:exceptionReason:", replacementMetadata, replacementEmbeddedThumbnailPhotoFormat, replacementEmbeddedThumbnailPixelBuffer, replacementDepthData, v11, -[AVCapturePhoto semanticSegmentationMatteForType:](self, "semanticSegmentationMatteForType:", @"AVSemanticSegmentationMatteTypeHair"), -[AVCapturePhoto semanticSegmentationMatteForType:](self, "semanticSegmentationMatteForType:", @"AVSemanticSegmentationMatteTypeSkin"), -[AVCapturePhoto semanticSegmentationMatteForType:](
            self,
            "semanticSegmentationMatteForType:",
            @"AVSemanticSegmentationMatteTypeTeeth"),
          [(AVCapturePhoto *)self semanticSegmentationMatteForType:@"AVSemanticSegmentationMatteTypeGlasses"], 0, &v15);
  if (v15)
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v13);
    }
    NSLog(&cfstr_SuppressingExc.isa, v13);
  }
  return v12;
}

- (NSData)fileDataRepresentationWithCustomizer:(id)customizer
{
  float v5 = [(AVCapturePhoto *)self metadata];
  v25 = [(AVCapturePhoto *)self embeddedThumbnailPhotoFormat];
  v23 = [(AVCapturePhoto *)self depthData];
  v22 = [(AVCapturePhoto *)self portraitEffectsMatte];
  v21 = [(AVCapturePhoto *)self semanticSegmentationMatteForType:@"AVSemanticSegmentationMatteTypeHair"];
  v20 = [(AVCapturePhoto *)self semanticSegmentationMatteForType:@"AVSemanticSegmentationMatteTypeSkin"];
  v6 = [(AVCapturePhoto *)self semanticSegmentationMatteForType:@"AVSemanticSegmentationMatteTypeTeeth"];
  uint64_t v7 = [(AVCapturePhoto *)self semanticSegmentationMatteForType:@"AVSemanticSegmentationMatteTypeGlasses"];
  if (customizer)
  {
    uint64_t v8 = (uint64_t)v7;
    if (objc_opt_respondsToSelector()) {
      float v5 = (NSDictionary *)[customizer replacementMetadataForPhoto:self];
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = [customizer replacementEmbeddedThumbnailPixelBufferWithPhotoFormat:&v25 forPhoto:self];
    }
    else {
      uint64_t v9 = 0;
    }
    if ([(AVCapturePhoto *)self _isProRAWPhoto])
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v12 = objc_msgSend(customizer, "replacementAppleProRAWCompressionSettingsForPhoto:defaultSettings:maximumBitDepth:", self, -[AVCapturePhoto _defaultRawCompressionSettings](self, "_defaultRawCompressionSettings"), -[AVCapturePhoto _maximumAppleProRAWBitDepth](self, "_maximumAppleProRAWBitDepth"));
LABEL_19:
        uint64_t v14 = (uint64_t)v20;
        uint64_t v15 = v5;
        long long v17 = v22;
        long long v16 = v23;
        uint64_t v13 = (uint64_t)v21;
LABEL_20:
        uint64_t v24 = 0;
        objc_super v11 = [(AVCapturePhoto *)self _fileDataRepresentationWithReplacementMetadata:v15 replacementEmbeddedThumbnailPhotoFormat:v25 replacementEmbeddedThumbnailPixelBuffer:v9 replacementDepthData:v16 replacementPortraitEffectsMatte:v17 replacementHairSegmentationMatte:v13 replacementSkinSegmentationMatte:v14 replacementTeethSegmentationMatte:v6 replacementGlassesSegmentationMatte:v8 replacementRawCompressionSettings:v12 exceptionReason:&v24];
        if (v24)
        {
          v18 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
          if (AVCaptureShouldThrowForAPIViolations()) {
            objc_exception_throw(v18);
          }
          NSLog(&cfstr_SuppressingExc.isa, v18);
        }
        return v11;
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v23 = (AVDepthData *)[customizer replacementDepthDataForPhoto:self];
      }
      if (objc_opt_respondsToSelector()) {
        v22 = (AVPortraitEffectsMatte *)[customizer replacementPortraitEffectsMatteForPhoto:self];
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v13 = [customizer replacementSemanticSegmentationMatteOfType:@"AVSemanticSegmentationMatteTypeHair" forPhoto:self];
        uint64_t v14 = [customizer replacementSemanticSegmentationMatteOfType:@"AVSemanticSegmentationMatteTypeSkin" forPhoto:self];
        v6 = (AVSemanticSegmentationMatte *)[customizer replacementSemanticSegmentationMatteOfType:@"AVSemanticSegmentationMatteTypeTeeth" forPhoto:self];
        uint64_t v8 = [customizer replacementSemanticSegmentationMatteOfType:@"AVSemanticSegmentationMatteTypeGlasses" forPhoto:self];
        uint64_t v12 = 0;
        uint64_t v15 = v5;
        long long v17 = v22;
        long long v16 = v23;
        goto LABEL_20;
      }
    }
    uint64_t v12 = 0;
    goto LABEL_19;
  }
  uint64_t v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v10);
  }
  NSLog(&cfstr_SuppressingExc.isa, v10);
  return 0;
}

- (CGImageRef)CGImageRepresentation
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(AVCapturePhoto *)self _isSushiRAWPhoto]) {
    return 0;
  }
  if ([(AVCapturePhoto *)self _isUncompressedYUVOrRGBPhoto])
  {
    ImageAtIndex = avcp_copyCGImageForUncompressedBuffer(self->_internal->photoPixelBuffer);
    if (!ImageAtIndex) {
      return ImageAtIndex;
    }
    goto LABEL_9;
  }
  if (![(AVCapturePhoto *)self _isCompressedPhoto]) {
    return 0;
  }
  float v4 = [(AVCapturePhoto *)self fileDataRepresentation];
  if (!v4) {
    return 0;
  }
  processedFileType = self->_internal->processedFileType;
  uint64_t v9 = *MEMORY[0x1E4F2FF78];
  v10[0] = processedFileType;
  v6 = CGImageSourceCreateWithData((CFDataRef)v4, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1]);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, 0);
  CFRelease(v7);
  if (ImageAtIndex) {
LABEL_9:
  }
    CFAutorelease(ImageAtIndex);
  return ImageAtIndex;
}

- (CGImageRef)previewCGImageRepresentation
{
  previewPixelBuffer = self->_internal->previewPixelBuffer;
  if (!previewPixelBuffer) {
    return 0;
  }
  id v3 = avcp_copyCGImageForUncompressedBuffer(previewPixelBuffer);
  float v4 = v3;
  if (v3) {
    CFAutorelease(v3);
  }
  return v4;
}

- (AVCaptureBracketedStillImageSettings)bracketSettings
{
  return self->_internal->bracketSettings;
}

- (NSInteger)sequenceCount
{
  return self->_internal->sequenceCount;
}

- (AVCaptureLensStabilizationStatus)lensStabilizationStatus
{
  if (!self->_internal->lensStabilizationSupported) {
    return 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unresolvedSettings = self->_internal->unresolvedSettings;
  }
  else {
    unresolvedSettings = 0;
  }
  if (![(AVCapturePhotoSettings *)unresolvedSettings isLensStabilizationEnabled])return 1; {
  uint64_t v5 = *MEMORY[0x1E4F2FC20];
  }
  id v6 = [(NSDictionary *)self->_internal->metadata objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F510C8]];
  id v8 = [(NSDictionary *)self->_internal->metadata objectForKeyedSubscript:v5];
  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F51100]];
  if (!(v7 | v9)) {
    return 4;
  }
  uint64_t v10 = (void *)v9;
  int v11 = [(id)v7 intValue];
  if (([v10 intValue] & 6) != 0) {
    return 3;
  }
  if ((v11 - 1) <= 4) {
    return qword_1A16361F0[v11 - 1];
  }
  else {
    return 4;
  }
}

- (unsigned)photoProcessingFlags
{
  return self->_internal->expectedPhotoProcessingFlags;
}

- (unsigned)expectedPhotoProcessingFlags
{
  return self->_internal->expectedPhotoProcessingFlags;
}

- (unsigned)actualPhotoProcessingFlags
{
  return self->_internal->actualPhotoProcessingFlags;
}

- (id)livePhotoMovieFileURL
{
  internal = self->_internal;
  unresolvedSettings = internal->unresolvedSettings;
  if (internal->expectedPhotoProcessingFlags) {
    return [(AVCapturePhotoSettings *)unresolvedSettings livePhotoMovieFileURLForOriginalPhoto];
  }
  else {
    return [(AVCapturePhotoSettings *)unresolvedSettings livePhotoMovieFileURL];
  }
}

- (id)privateClientMetadata
{
  return self->_internal->privateClientMetadata;
}

- (id)processedFileType
{
  return self->_internal->processedFileType;
}

- (id)portraitMetadata
{
  return self->_internal->portraitMetadata;
}

- (float)focusPixelBlurScore
{
  id v2 = [(NSDictionary *)self->_internal->metadata objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
  id v3 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F51068]];
  if (!v3) {
    return NAN;
  }

  [v3 floatValue];
  return result;
}

- (__CVBuffer)constantColorConfidenceMap
{
  return self->_internal->constantColorConfidenceMap;
}

- (float)constantColorCenterWeightedMeanConfidenceLevel
{
  return self->_internal->constantColorCenterWeightedMeanConfidenceLevel;
}

- (BOOL)isConstantColorFallbackPhoto
{
  BOOL v3 = [(AVCapturePhotoSettings *)self->_internal->unresolvedSettings isConstantColorEnabled];
  if (v3) {
    LOBYTE(v3) = self->_internal->constantColorConfidenceMap == 0;
  }
  return v3;
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)[(AVCaptureResolvedPhotoSettings *)self->_internal->resolvedSettings photoDimensions];
}

+ (id)AVFileTypeFromFigCaptureStillImageSettingsFileType:(int)a3 codec:(unsigned int)a4 unresolvedSettings:(id)a5
{
  if (a3 <= 1751476581)
  {
    if (a3 == 1684956519)
    {
      uint64_t v5 = (id *)MEMORY[0x1E4F47BE0];
    }
    else
    {
      if (a3 != 1751476579) {
        goto LABEL_13;
      }
      uint64_t v5 = (id *)MEMORY[0x1E4F47BE8];
    }
  }
  else
  {
    switch(a3)
    {
      case 1953064550:
        uint64_t v5 = (id *)MEMORY[0x1E4F47C10];
        break;
      case 1785096550:
        uint64_t v5 = (id *)MEMORY[0x1E4F47BF8];
        break;
      case 1751476582:
        uint64_t v5 = (id *)MEMORY[0x1E4F47BF0];
        break;
      default:
        goto LABEL_13;
    }
  }
  id result = *v5;
  if (*v5) {
    return result;
  }
LABEL_13:
  if ((int)a4 > 1635148592)
  {
    switch(a4)
    {
      case 0x61766331u:
        uint64_t v7 = (id *)MEMORY[0x1E4F47BC0];
        break;
      case 0x6A706567u:
        uint64_t v7 = (id *)MEMORY[0x1E4F47BF8];
        break;
      case 0x68766331u:
        uint64_t v7 = (id *)MEMORY[0x1E4F47BE8];
        break;
      default:
        return (id)[a5 processedFileType];
    }
  }
  else
  {
    if (a4 != 875704422 && a4 != 875704438 && a4 != 1111970369) {
      return (id)[a5 processedFileType];
    }
    uint64_t v7 = (id *)MEMORY[0x1E4F47C10];
  }
  id result = *v7;
  if (!*v7) {
    return (id)[a5 processedFileType];
  }
  return result;
}

- (BOOL)_isCompressedPhoto
{
  if ([(AVCapturePhoto *)self _isSushiRAWPhoto]) {
    return 0;
  }
  internal = self->_internal;
  processedFileType = internal->processedFileType;
  if (processedFileType)
  {
    if (![(NSString *)processedFileType isEqualToString:*MEMORY[0x1E4F47C10]]) {
      return 1;
    }
    internal = self->_internal;
  }
  id v6 = [(AVCapturePhotoSettings *)internal->unresolvedSettings format];
  if ([(NSDictionary *)v6 objectForKeyedSubscript:*MEMORY[0x1E4F47D00]]) {
    return 1;
  }
  uint64_t v7 = self->_internal;
  if (!v7->unresolvedSettings)
  {
    if (v7->photoSurface) {
      return 1;
    }
  }

  return [(AVCapturePhoto *)self _isProRAWPhoto];
}

- (BOOL)_isUncompressedYUVOrRGBPhoto
{
  BOOL v3 = [(AVCapturePhotoSettings *)self->_internal->unresolvedSettings format];
  uint64_t v4 = [(NSDictionary *)v3 objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
  if (v4)
  {
    if ([(AVCapturePhoto *)self _isCompressedPhoto]) {
      LOBYTE(v4) = 0;
    }
    else {
      LOBYTE(v4) = ![(AVCapturePhoto *)self _isSushiRAWPhoto];
    }
  }
  return v4;
}

- (BOOL)_isProRAWPhoto
{
  return BYTE2(self->_internal->expectedPhotoProcessingFlags) & 1;
}

- (BOOL)_isSushiRAWPhoto
{
  return LOBYTE(self->_internal->expectedPhotoProcessingFlags) >> 7;
}

- (__CVBuffer)_embeddedThumbnailSourcePixelBuffer
{
  internal = self->_internal;
  id result = internal->embeddedThumbnailSourcePixelBuffer;
  if (!result) {
    return internal->previewPixelBuffer;
  }
  return result;
}

- (unsigned)_orientation
{
  id v2 = [(AVCapturePhoto *)self metadata];
  id v3 = [(NSDictionary *)v2 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
  if (!v3) {
    return 1;
  }

  return [v3 intValue];
}

- (int)_maximumAppleProRAWBitDepth
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if ([(AVCapturePhoto *)self _isProRAWPhoto] && self->_internal->photoSurface)
  {
    uint64_t v4 = *MEMORY[0x1E4F56250];
    v5[0] = MEMORY[0x1E4F1CC38];
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
    CMPhotoDNGUnpack();
  }
  return 12;
}

- (id)_defaultRawCompressionSettings
{
  void v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F47CE8];
  v4[0] = *MEMORY[0x1E4F47D88];
  v4[1] = v2;
  v5[0] = &unk_1EF4FA928;
  v5[1] = objc_msgSend(NSNumber, "numberWithInt:", -[AVCapturePhoto _maximumAppleProRAWBitDepth](self, "_maximumAppleProRAWBitDepth"));
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
}

- (id)_fileDataRepresentationWithReplacementMetadata:(id)a3 replacementEmbeddedThumbnailPhotoFormat:(id)a4 replacementEmbeddedThumbnailPixelBuffer:(__CVBuffer *)a5 replacementDepthData:(id)a6 replacementPortraitEffectsMatte:(id)a7 replacementHairSegmentationMatte:(id)a8 replacementSkinSegmentationMatte:(id)a9 replacementTeethSegmentationMatte:(id)a10 replacementGlassesSegmentationMatte:(id)a11 replacementRawCompressionSettings:(id)a12 exceptionReason:(id *)a13
{
  v127[4] = *(id *)MEMORY[0x1E4F143B8];
  v120 = 0;
  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", +[AVCapturePhotoOutput validMetadataTopLevelCGImagePropertiesKeys](AVCapturePhotoOutput, "validMetadataTopLevelCGImagePropertiesKeys"));
  v20 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(a3, "allKeys"));
  [v20 minusSet:v19];
  if ([v20 count])
  {
    v102 = (__CFString *)[NSString stringWithFormat:@"replacementMetadata contains invalid keys: %@", v20];
    v25 = 0;
    id v26 = 0;
    CFMutableDataRef v27 = 0;
    v120 = v102;
    if (!v102) {
      goto LABEL_185;
    }
    goto LABEL_184;
  }
  v118 = (AVPortraitEffectsMatte *)a7;
  v116 = a5;
  if (!a4)
  {
    if (a5)
    {
      CFMutableDataRef v27 = 0;
      id v26 = 0;
      v25 = 0;
      v102 = @"If you specify a replacementEmbeddedThumbnailPixelBuffer, you must also specify a replacementEmbeddedThumbnailPhotoFormat";
      goto LABEL_206;
    }
LABEL_10:
    if (a6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      CFMutableDataRef v27 = 0;
      id v26 = 0;
      v25 = 0;
      v102 = @"replacementDepthData must be an instance of AVDepthData";
    }
    else
    {
      if (a7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          CFMutableDataRef v27 = 0;
          id v26 = 0;
          v25 = 0;
          v102 = @"replacementPortraitEffectsMatte must be an instance of AVPortraitEffectsMatte";
          goto LABEL_206;
        }
        if (!a6)
        {
          CFMutableDataRef v27 = 0;
          id v26 = 0;
          v25 = 0;
          v102 = @"If you wish to include a portrait effects matte in the file data representation, you must also include depth data";
          goto LABEL_206;
        }
      }
      if (a8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          CFMutableDataRef v27 = 0;
          id v26 = 0;
          v25 = 0;
          v102 = @"replacementHairSegmentationMatte must be an instance of AVSemanticSegmentationMatte";
          goto LABEL_206;
        }
        if ((objc_msgSend((id)objc_msgSend(a8, "matteType"), "isEqual:", @"AVSemanticSegmentationMatteTypeHair") & 1) == 0)
        {
          CFMutableDataRef v27 = 0;
          id v26 = 0;
          v25 = 0;
          v102 = @"replacementHairSegmentationMatte must have a matteType of AVSemanticSegmentationMatteTypeHair";
          goto LABEL_206;
        }
      }
      if (a9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          CFMutableDataRef v27 = 0;
          id v26 = 0;
          v25 = 0;
          v102 = @"replacementSkinSegmentationMatte must be an instance of AVSemanticSegmentationMatte";
          goto LABEL_206;
        }
        if ((objc_msgSend((id)objc_msgSend(a9, "matteType"), "isEqual:", @"AVSemanticSegmentationMatteTypeSkin") & 1) == 0)
        {
          CFMutableDataRef v27 = 0;
          id v26 = 0;
          v25 = 0;
          v102 = @"replacementSkinSegmentationMatte must have a matteType of AVSemanticSegmentationMatteTypeSkin";
          goto LABEL_206;
        }
      }
      if (a10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          CFMutableDataRef v27 = 0;
          id v26 = 0;
          v25 = 0;
          v102 = @"replacementTeethSegmentationMatte must be an instance of AVSemanticSegmentationMatte";
          goto LABEL_206;
        }
        if ((objc_msgSend((id)objc_msgSend(a10, "matteType"), "isEqual:", @"AVSemanticSegmentationMatteTypeTeeth") & 1) == 0)
        {
          CFMutableDataRef v27 = 0;
          id v26 = 0;
          v25 = 0;
          v102 = @"replacementTeethSegmentationMatte must have a matteType of AVSemanticSegmentationMatteTypeTeeth";
          goto LABEL_206;
        }
      }
      if (a11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          CFMutableDataRef v27 = 0;
          id v26 = 0;
          v25 = 0;
          v102 = @"replacementGlassesSegmentationMatte must be an instance of AVSemanticSegmentationMatte";
          goto LABEL_206;
        }
        if ((objc_msgSend((id)objc_msgSend(a11, "matteType"), "isEqual:", @"AVSemanticSegmentationMatteTypeGlasses") & 1) == 0)
        {
          CFMutableDataRef v27 = 0;
          id v26 = 0;
          v25 = 0;
          v102 = @"replacementGlassesSegmentationMatte must have a matteType of AVSemanticSegmentationMatteTypeGlasses";
          goto LABEL_206;
        }
      }
      if (!a12)
      {
        id v32 = [(AVCapturePhoto *)self _defaultRawCompressionSettings];
        v35 = v116;
        goto LABEL_42;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v28 = *MEMORY[0x1E4F47D88];
        uint64_t v29 = *MEMORY[0x1E4F47CE8];
        v122[0] = *MEMORY[0x1E4F47D88];
        v122[1] = v29;
        uint64_t v30 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v122, 2));
        v31 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(a12, "allKeys"));
        [v31 minusSet:v30];
        if ([v31 count])
        {
          uint64_t v104 = [NSString stringWithFormat:@"Unsupported keys specified: %@. Supported keys are %@", v31, v30];
          v25 = 0;
          id v26 = 0;
          CFMutableDataRef v27 = 0;
          v120 = (__CFString *)v104;
          goto LABEL_183;
        }
        id v32 = (id)objc_msgSend(-[AVCapturePhoto _defaultRawCompressionSettings](self, "_defaultRawCompressionSettings"), "mutableCopy");
        if ([a12 objectForKeyedSubscript:v28])
        {
          [a12 objectForKeyedSubscript:v28];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v25 = 0;
            id v26 = 0;
            CFMutableDataRef v27 = 0;
            v105 = @"replacementAppleProRAWCompressionSettings[AVVideoQualityKey] must be an instance of NSNumber";
            goto LABEL_211;
          }
          objc_msgSend((id)objc_msgSend(a12, "objectForKeyedSubscript:", v28), "doubleValue");
          if (v33 < 0.0 || v33 > 1.0)
          {
            v25 = 0;
            id v26 = 0;
            CFMutableDataRef v27 = 0;
            v105 = @"replacementAppleProRAWCompressionSettings[AVVideoQualityKey] must be a value >= 0.0 and <= 1.0";
            goto LABEL_211;
          }
          objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(a12, "objectForKeyedSubscript:", v28), v28);
        }
        if ([a12 objectForKeyedSubscript:v29])
        {
          [a12 objectForKeyedSubscript:v29];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v34 = objc_msgSend((id)objc_msgSend(a12, "objectForKeyedSubscript:", v29), "intValue");
            v35 = v116;
            if (v34 >= 8 && v34 <= [(AVCapturePhoto *)self _maximumAppleProRAWBitDepth])
            {
              objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(a12, "objectForKeyedSubscript:", v29), v29);
              goto LABEL_42;
            }
            v25 = 0;
            id v26 = 0;
            CFMutableDataRef v27 = 0;
            v105 = @"replacementAppleProRAWCompressionSettings[AVVideoAppleProRAWBitDepthKey] must be a value >= 8 and <= maximumBitDepth";
          }
          else
          {
            v25 = 0;
            id v26 = 0;
            CFMutableDataRef v27 = 0;
            v105 = @"replacementAppleProRAWCompressionSettings[AVVideoAppleProRAWBitDepthKey] must be an instance of NSNumber";
          }
LABEL_211:
          v120 = v105;
          goto LABEL_183;
        }
        v35 = v116;
LABEL_42:
        int v36 = objc_msgSend(v32, "isEqual:", -[AVCapturePhoto _defaultRawCompressionSettings](self, "_defaultRawCompressionSettings"));
        if ([(AVCapturePhoto *)self metadata] == a3) {
          unsigned int v115 = 0;
        }
        else {
          unsigned int v115 = [(NSDictionary *)[(AVCapturePhoto *)self metadata] isEqual:a3] ^ 1;
        }
        long long v37 = [(AVCapturePhoto *)self embeddedThumbnailPhotoFormat];
        if (v35) {
          BOOL v38 = 0;
        }
        else {
          BOOL v38 = v37 == a4;
        }
        int v39 = !v38;
        unsigned int v109 = v39;
        v110 = [(AVCapturePhoto *)self depthData];
        v111 = [(AVCapturePhoto *)self portraitEffectsMatte];
        v112 = [(AVCapturePhoto *)self semanticSegmentationMatteForType:@"AVSemanticSegmentationMatteTypeHair"];
        v113 = [(AVCapturePhoto *)self semanticSegmentationMatteForType:@"AVSemanticSegmentationMatteTypeSkin"];
        v114 = [(AVCapturePhoto *)self semanticSegmentationMatteForType:@"AVSemanticSegmentationMatteTypeTeeth"];
        unsigned int v40 = [(AVCapturePhoto *)self semanticSegmentationMatteForType:@"AVSemanticSegmentationMatteTypeGlasses"];
        uint64_t v41 = *MEMORY[0x1E4F2FCA0];
        if ([a3 objectForKeyedSubscript:*MEMORY[0x1E4F2FCA0]]) {
          [a3 objectForKeyedSubscript:v41];
        }
        char v42 = v115 | v109;
        if (v110 != a6) {
          char v42 = 1;
        }
        if (v111 != a7) {
          char v42 = 1;
        }
        if (v112 != a8) {
          char v42 = 1;
        }
        if (v113 != a9) {
          char v42 = 1;
        }
        if (v114 != a10) {
          char v42 = 1;
        }
        if (!(v42 & 1 | (v40 != a11) | (v36 ^ 1) & 1)) {
          return [(AVCapturePhoto *)self fileDataRepresentation];
        }
        if (!self->_internal->photoSurface) {
          goto LABEL_118;
        }
        v108 = (AVDepthData *)a6;
        v43 = (void *)[MEMORY[0x1E4F1CA48] array];
        if (!v43) {
          goto LABEL_118;
        }
        BOOL v44 = v43;
        if (v110 != v108)
        {
          [v43 addObject:*MEMORY[0x1E4F55F98]];
          [v44 addObject:*MEMORY[0x1E4F55FB0]];
        }
        if (v111 != a7) {
          [v44 addObject:*MEMORY[0x1E4F55FB8]];
        }
        if (v112 != a8) {
          [v44 addObject:*MEMORY[0x1E4F55FC8]];
        }
        if (v113 != a9) {
          [v44 addObject:*MEMORY[0x1E4F55FD0]];
        }
        if (v114 != a10) {
          [v44 addObject:*MEMORY[0x1E4F55FE0]];
        }
        v106 = v40;
        if (v40 != a11) {
          [v44 addObject:*MEMORY[0x1E4F55FC0]];
        }
        BOOL v45 = [(AVCapturePhoto *)self _isSushiRAWPhoto];
        BOOL v46 = [(AVCapturePhoto *)self _isProRAWPhoto];
        v47 = [(AVCapturePhotoSettings *)self->_internal->unresolvedSettings format];
        uint64_t v48 = *MEMORY[0x1E4F47D00];
        id v49 = [(NSDictionary *)v47 objectForKeyedSubscript:*MEMORY[0x1E4F47D00]];
        unsigned __int8 v107 = [v49 isEqualToString:*MEMORY[0x1E4F47D38]];
        if (![(NSDictionary *)[(AVCapturePhotoSettings *)self->_internal->unresolvedSettings format] objectForKeyedSubscript:v48]|| v45)
        {
          if (!v46)
          {
            if (v45)
            {
              if ((v115 & 1) == 0) {
                a3 = [(AVCapturePhoto *)self metadata];
              }
              IOSurfaceRef v69 = v116;
              if ((v109 & 1) == 0)
              {
                IOSurfaceRef v69 = [(AVCapturePhoto *)self _embeddedThumbnailSourcePixelBuffer];
                a4 = [(AVCapturePhoto *)self embeddedThumbnailPhotoFormat];
              }
              uint64_t v70 = [a4 objectForKeyedSubscript:v48];
              unsigned int v71 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F47DB0]), "intValue");
              v72 = (__CFData *)avcp_copyDNGFileDataRepresentationForSushiRawBuffer((uint64_t)-[AVCapturePhoto pixelBuffer](self, "pixelBuffer"), (uint64_t)v69, (uint64_t)a3, 0, v70, v71 | (unint64_t)(objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F47D60]), "intValue") << 32));
              CFMutableDataRef v27 = v72;
            }
            else
            {
              objc_super v73 = [(AVCapturePhotoSettings *)self->_internal->unresolvedSettings format];
              if (![(NSDictionary *)v73 objectForKeyedSubscript:*MEMORY[0x1E4F24D70]]) {
                goto LABEL_118;
              }
              if ((v115 & 1) == 0) {
                a3 = [(AVCapturePhoto *)self metadata];
              }
              if ((v109 & 1) == 0) {
                a4 = [(AVCapturePhoto *)self embeddedThumbnailPhotoFormat];
              }
              uint64_t v74 = [a4 objectForKeyedSubscript:v48];
              v75 = avcp_copyCGImageForUncompressedBuffer(self->_internal->photoPixelBuffer);
              CFMutableDataRef v27 = avcp_copyTIFFFileDataRepresentationForImage(v75, (const __CFDictionary *)a3, v74);
              if (v75) {
                CFRelease(v75);
              }
              v72 = v27;
            }
            v76 = v72;
            v25 = 0;
LABEL_182:
            id v26 = 0;
            goto LABEL_183;
          }
        }
        else if (!v46)
        {
          unint64_t v119 = 0;
          v50 = v108;
          if (v116)
          {
            uint64_t v51 = *MEMORY[0x1E4F47DB0];
            int v52 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F47DB0]), "intValue");
            uint64_t v53 = *MEMORY[0x1E4F47D60];
            int v54 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F47D60]), "intValue");
            if (v52 <= v54) {
              int v55 = v54;
            }
            else {
              int v55 = v52;
            }
            uint64_t v56 = v55;
            unint64_t v119 = v55;
            if (!v55)
            {
              int v57 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[AVCapturePhotoSettings embeddedThumbnailPhotoFormat](self->_internal->unresolvedSettings, "embeddedThumbnailPhotoFormat"), "objectForKeyedSubscript:", v51), "intValue");
              int v58 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[AVCapturePhotoSettings embeddedThumbnailPhotoFormat](self->_internal->unresolvedSettings, "embeddedThumbnailPhotoFormat"), "objectForKeyedSubscript:", v53), "intValue");
              if (v57 <= v58) {
                LODWORD(v56) = v58;
              }
              else {
                LODWORD(v56) = v57;
              }
              uint64_t v56 = (int)v56;
              unint64_t v119 = (int)v56;
            }
            if (!v56)
            {
              if ([(NSString *)self->_internal->processedFileType isEqual:*MEMORY[0x1E4F47BF8]])
              {
                uint64_t v59 = 160;
LABEL_138:
                unint64_t v119 = v59;
                goto LABEL_139;
              }
              [(AVCapturePhoto *)self dimensions];
              [(AVCapturePhoto *)self dimensions];
              if (CMPhotoDetermineMIAFCompliantThumbnailMaxPixelSize())
              {
                uint64_t v59 = 320;
                goto LABEL_138;
              }
            }
          }
LABEL_139:
          [a4 objectForKeyedSubscript:v48];
          uint64_t v79 = AVOSTypeForString();
          unint64_t photoSurfaceSize = self->_internal->photoSurfaceSize;
          v121 = 0;
          if (!CMPhotoCompressionSessionCreate())
          {
            uint64_t v81 = *MEMORY[0x1E4F56048];
            v127[0] = &unk_1EF4FA058;
            uint64_t v82 = *MEMORY[0x1E4F56040];
            v126[0] = v81;
            v126[1] = v82;
            v127[1] = (id)[NSNumber numberWithUnsignedLong:photoSurfaceSize];
            v126[2] = *MEMORY[0x1E4F56070];
            v127[2] = (id)[NSNumber numberWithBool:v115];
            v126[3] = *MEMORY[0x1E4F56078];
            v127[3] = (id)[NSNumber numberWithBool:v109];
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v127 forKeys:v126 count:4];
            if (!CMPhotoCompressionSessionOpenExistingContainerForModification()
              && (!a3 || !v115 || !CMPhotoCompressionSessionAddMetadataFromImageProperties()))
            {
              if (v116)
              {
                if ((v107 & (v119 > 0xA0)) != 0) {
                  uint64_t v83 = 160;
                }
                else {
                  uint64_t v83 = v119;
                }
                v124[0] = *MEMORY[0x1E4F560B8];
                v125[0] = [NSNumber numberWithInt:v79];
                v124[1] = *MEMORY[0x1E4F56120];
                v125[1] = [NSNumber numberWithUnsignedLong:v83];
                [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:v124 count:2];
                int v84 = CMPhotoCompressionSessionAddThumbnail();
                id v26 = 0;
                CFMutableDataRef v27 = 0;
                v25 = v121;
                if (v84) {
                  goto LABEL_183;
                }
              }
              else
              {
                v25 = v121;
              }
              if (v108 && v110 != v108)
              {
                if ([(AVDepthData *)v108 depthDataType] != 1751411059) {
                  v50 = [(AVDepthData *)v108 depthDataByConvertingToDepthDataType:1751411059];
                }
                if ([(AVDepthData *)v50 isDepthDataFiltered]) {
                  v85 = 0;
                }
                else {
                  v85 = &unk_1EF4FA070;
                }
                v86 = [(AVDepthData *)v50 copyAuxiliaryMetadata];
                uint64_t v87 = *MEMORY[0x1E4F2F3B8];
                [(AVDepthData *)v50 depthDataMap];
                _addAuxiliaryImage((uint64_t)v25, 0, v87, 1, 0, (uint64_t)v86, (uint64_t)v85);
                if (v86) {
                  CFRelease(v86);
                }
              }
              if (v118)
              {
                if (v111 != v118)
                {
                  v88 = [(AVPortraitEffectsMatte *)v118 copyAuxiliaryMetadata];
                  uint64_t v89 = *MEMORY[0x1E4F2F3D0];
                  [(AVPortraitEffectsMatte *)v118 mattingImage];
                  _addAuxiliaryImage((uint64_t)v25, 0, v89, 5, 0, (uint64_t)v88, 0);
                  if (v88) {
                    CFRelease(v88);
                  }
                }
              }
              if (a8)
              {
                if (v112 != a8)
                {
                  v90 = (const void *)[a8 copyAuxiliaryMetadata];
                  uint64_t v91 = *MEMORY[0x1E4F2F3E0];
                  uint64_t v92 = *MEMORY[0x1E4F55FC8];
                  [a8 mattingImage];
                  _addAuxiliaryImage((uint64_t)v25, 0, v91, 4, v92, (uint64_t)v90, 0);
                  if (v90) {
                    CFRelease(v90);
                  }
                }
              }
              if (a9)
              {
                if (v113 != a9)
                {
                  v93 = (const void *)[a9 copyAuxiliaryMetadata];
                  uint64_t v94 = *MEMORY[0x1E4F2F3E8];
                  uint64_t v95 = *MEMORY[0x1E4F55FD0];
                  [a9 mattingImage];
                  _addAuxiliaryImage((uint64_t)v25, 0, v94, 4, v95, (uint64_t)v93, 0);
                  if (v93) {
                    CFRelease(v93);
                  }
                }
              }
              if (a10)
              {
                if (v114 != a10)
                {
                  v96 = (const void *)[a10 copyAuxiliaryMetadata];
                  uint64_t v97 = *MEMORY[0x1E4F2F3F8];
                  uint64_t v98 = *MEMORY[0x1E4F55FE0];
                  [a10 mattingImage];
                  _addAuxiliaryImage((uint64_t)v25, 0, v97, 4, v98, (uint64_t)v96, 0);
                  if (v96) {
                    CFRelease(v96);
                  }
                }
              }
              if (a11)
              {
                if (v106 != a11)
                {
                  v99 = (const void *)[a11 copyAuxiliaryMetadata];
                  uint64_t v100 = *MEMORY[0x1E4F2F3D8];
                  uint64_t v101 = *MEMORY[0x1E4F55FC0];
                  [a11 mattingImage];
                  _addAuxiliaryImage((uint64_t)v25, 0, v100, 4, v101, (uint64_t)v99, 0);
                  if (v99) {
                    CFRelease(v99);
                  }
                }
              }
              v127[0] = 0;
              if (!CMPhotoCompressionSessionCloseContainerAndCopyBacking())
              {
                CMPhotoCompressionSessionInvalidate();
                CFMutableDataRef v27 = (CFMutableDataRef)v127[0];
                goto LABEL_182;
              }
              goto LABEL_119;
            }
          }
          id v77 = (id)v121;
          if (!v121)
          {
LABEL_118:
            v25 = 0;
LABEL_119:
            id v26 = 0;
            goto LABEL_120;
          }
LABEL_117:
          CFRelease(v77);
          goto LABEL_118;
        }
        unsigned int v60 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F47DB0]), "intValue");
        unsigned int v61 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F47D60]), "intValue");
        v127[0] = 0;
        if (!CMPhotoDNGCompressorCreateFromSourceDNGWithModificationHandler())
        {
          if (v36) {
            goto LABEL_217;
          }
          v62 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v63 = objc_msgSend((id)objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E4F47CE8]), "intValue");
          uint64_t v64 = [NSNumber numberWithInt:v63];
          [v62 setObject:v64 forKeyedSubscript:*MEMORY[0x1E4F56200]];
          objc_msgSend((id)objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E4F47D88]), "doubleValue");
          double v66 = v65;
          uint64_t v67 = *MEMORY[0x1E4F56210];
          if (v65 == 1.0)
          {
            v68 = &unk_1EF4FA088;
          }
          else
          {
            [v62 setObject:&unk_1EF4FA0A0 forKeyedSubscript:v67];
            v68 = (void *)[NSNumber numberWithDouble:v66];
            uint64_t v67 = *MEMORY[0x1E4F56220];
          }
          [v62 setObject:v68 forKeyedSubscript:v67];
          if (!CMPhotoDNGCompressorReplaceMainImageOptions())
          {
LABEL_217:
            if (!v115 || !CMPhotoDNGCompressorReplaceMainImageProperties())
            {
              if (!v109) {
                goto LABEL_134;
              }
              if (v116)
              {
                if ((int)v60 <= (int)v61) {
                  uint64_t v78 = v61;
                }
                else {
                  uint64_t v78 = v60;
                }
                v125[0] = *MEMORY[0x1E4F56230];
                v126[0] = [NSNumber numberWithInt:v78];
                [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v126 forKeys:v125 count:1];
                if (+[AVCapturePhotoOutput isAppleProRAWPixelFormat:CVPixelBufferGetPixelFormatType(v116)])
                {
                  if (CMPhotoDNGCompressorSetPreviewImageFromRAW()) {
                    goto LABEL_116;
                  }
                }
                else if (CMPhotoDNGCompressorSetPreviewImage())
                {
                  goto LABEL_116;
                }
LABEL_134:
                id v26 = v127[0];
                v127[0] = 0;
                if (!CMPhotoDNGCompressorFinalizeAndCreateData())
                {
                  CFMutableDataRef v27 = (CFMutableDataRef)v127[0];
                  v25 = 0;
                  goto LABEL_183;
                }
                v25 = 0;
LABEL_120:
                CFMutableDataRef v27 = 0;
                goto LABEL_183;
              }
              if (!CMPhotoDNGCompressorSetCompressedPreviewImage()) {
                goto LABEL_134;
              }
            }
          }
        }
LABEL_116:
        id v77 = v127[0];
        if (!v127[0]) {
          goto LABEL_118;
        }
        goto LABEL_117;
      }
      CFMutableDataRef v27 = 0;
      id v26 = 0;
      v25 = 0;
      v102 = @"replacementRawCompressionSettings must be an instance of NSDictionary";
    }
LABEL_206:
    v120 = v102;
    goto LABEL_184;
  }
  uint64_t v21 = *MEMORY[0x1E4F47DB0];
  v123[0] = *MEMORY[0x1E4F47D00];
  v123[1] = v21;
  v123[2] = *MEMORY[0x1E4F47D60];
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:3];
  if (AVGestaltGetBoolAnswer(@"AVGQCapturePhotoSettingsSupportRawEmbeddedThumbnailFormat")
    && [(AVCapturePhoto *)self isRawPhoto])
  {
    v23 = [(AVCapturePhotoSettings *)self->_internal->unresolvedSettings availableRawEmbeddedThumbnailPhotoCodecTypes];
  }
  else
  {
    v23 = [(AVCapturePhotoSettings *)self->_internal->unresolvedSettings availableEmbeddedThumbnailPhotoCodecTypes];
  }
  BOOL v24 = +[AVCaptureVideoSettingsValidator validateVideoSettings:a4 allowingFeatures:25 validPixelKeys:0 validPixelFormats:0 validCodecKeys:v22 validCodecs:v23 exceptionReason:&v120];
  v25 = 0;
  id v26 = 0;
  CFMutableDataRef v27 = 0;
  if (v24) {
    goto LABEL_10;
  }
LABEL_183:
  v102 = v120;
  if (v120) {
LABEL_184:
  }
    *a13 = v102;
LABEL_185:
  if (v25) {
    CFRelease(v25);
  }
  if (v26) {
    CFRelease(v26);
  }
  return v27;
}

uint64_t __384__AVCapturePhoto__fileDataRepresentationWithReplacementMetadata_replacementEmbeddedThumbnailPhotoFormat_replacementEmbeddedThumbnailPixelBuffer_replacementDepthData_replacementPortraitEffectsMatte_replacementHairSegmentationMatte_replacementSkinSegmentationMatte_replacementTeethSegmentationMatte_replacementGlassesSegmentationMatte_replacementRawCompressionSettings_exceptionReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[a2 objectForKeyedSubscript:*MEMORY[0x1E4F56010]];
  if ((unint64_t)[v3 count] >= 2)
  {
    uint64_t v4 = (void *)[v3 objectAtIndexedSubscript:1];
    if (objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F56000]), "unsignedIntValue") != 1953325424)goto LABEL_31; {
    if (*(unsigned char *)(a1 + 48))
    }
      [v4 setObject:&unk_1EF4FA058 forKeyedSubscript:*MEMORY[0x1E4F56020]];
  }
  if ((unint64_t)[v3 count] <= 2)
  {
    uint64_t v5 = (void *)[v3 objectAtIndexedSubscript:0];
    if (!*(unsigned char *)(a1 + 49))
    {
      if ([*(id *)(a1 + 32) count])
      {
        v20 = (void *)[v5 objectForKeyedSubscript:*MEMORY[0x1E4F55FF0]];
        uint64_t v21 = [v20 count];
        if (v21 - 1 >= 0)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *MEMORY[0x1E4F55FF8];
          do
          {
            if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend((id)objc_msgSend(v20, "objectAtIndexedSubscript:", --v22), "objectForKeyedSubscript:", v23)))objc_msgSend(v20, "removeObjectAtIndex:", v22); {
          }
            }
          while (v22 > 0);
        }
      }
    }
    if (*(unsigned char *)(a1 + 48) && *(unsigned char *)(a1 + 50))
    {
      uint64_t v6 = *MEMORY[0x1E4F56020];
      [v5 setObject:*(void *)(a1 + 40) forKeyedSubscript:*MEMORY[0x1E4F56020]];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v7 = (void *)[v3 objectAtIndexedSubscript:0];
      id v8 = (void *)[v7 objectForKeyedSubscript:*MEMORY[0x1E4F56028]];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v29 != v11) {
              objc_enumerationMutation(v8);
            }
            [*(id *)(*((void *)&v28 + 1) + 8 * i) setObject:*(void *)(a1 + 40) forKeyedSubscript:v6];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v10);
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v13 = objc_msgSend(v3, "objectAtIndexedSubscript:", 0, 0);
      uint64_t v14 = (void *)[v13 objectForKeyedSubscript:*MEMORY[0x1E4F55FF0]];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v24 + 1) + 8 * j) setObject:*(void *)(a1 + 40) forKeyedSubscript:v6];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v16);
      }
    }
    return 0;
  }
LABEL_31:

  return FigSignalErrorAt();
}

- (AVCapturePhotoInternal)internal
{
  return self->_internal;
}

@end