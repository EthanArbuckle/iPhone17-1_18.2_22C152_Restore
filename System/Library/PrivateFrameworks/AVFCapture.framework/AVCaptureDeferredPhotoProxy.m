@interface AVCaptureDeferredPhotoProxy
- ($2825F4736939C4A6D3AD43837233062D)dimensions;
- (AVCaptureDeferredPhotoProxy)init;
- (AVCaptureDeferredPhotoProxy)initWithApplicationIdentifier:(id)a3 captureRequestIdentifier:(id)a4 photoIdentifier:(id)a5 timestamp:(id *)a6 expectedPhotoProcessingFlags:(unsigned int)a7;
- (AVCaptureDeferredPhotoProxy)initWithDeferredPhotoIdentifier:(id)a3;
- (AVCaptureDeferredPhotoProxy)initWithDeferredPhotoIdentifier:(id)a3 applicationIdentifier:(id)a4;
- (AVCaptureDeferredPhotoProxy)initWithTimestamp:(id *)a3 proxySurface:(__IOSurface *)a4 proxySurfaceSize:(unint64_t)a5 proxyFileType:(id)a6 previewPhotoSurface:(__IOSurface *)a7 metadata:(id)a8 captureRequest:(id)a9 sequenceCount:(unint64_t)a10 photoCount:(unint64_t)a11 applicationIdentifier:(id)a12 captureRequestIdentifier:(id)a13 photoIdentifier:(id)a14 expectedPhotoProcessingFlags:(unsigned int)a15 sourceDeviceType:(id)a16;
- (BOOL)isEqual:(id)a3;
- (NSString)applicationIdentifier;
- (NSString)deferredPhotoIdentifier;
- (NSString)persistentStorageUUID;
- (id)captureRequestIdentifier;
- (id)debugDescription;
- (id)description;
- (void)dealloc;
- (void)setApplicationIdentifier:(id)a3;
@end

@implementation AVCaptureDeferredPhotoProxy

- (AVCaptureDeferredPhotoProxy)init
{
  if (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementDeferredPhotoProcessor))
  {
    v5.receiver = self;
    v5.super_class = (Class)AVCaptureDeferredPhotoProxy;
    return [(AVCaptureDeferredPhotoProxy *)&v5 init];
  }
  else
  {
    v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
    return 0;
  }
}

- (AVCaptureDeferredPhotoProxy)initWithApplicationIdentifier:(id)a3 captureRequestIdentifier:(id)a4 photoIdentifier:(id)a5 timestamp:(id *)a6 expectedPhotoProcessingFlags:(unsigned int)a7
{
  if (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementDeferredPhotoProcessor))
  {
    v19.receiver = self;
    v19.super_class = (Class)AVCaptureDeferredPhotoProxy;
    long long v17 = *(_OWORD *)&a6->var0;
    int64_t var3 = a6->var3;
    unsigned int v16 = a7;
    v13 = -[AVCapturePhoto initWithTimestamp:photoSurface:photoSurfaceSize:processedFileType:previewPhotoSurface:embeddedThumbnailSourceSurface:metadata:depthDataSurface:depthMetadataDictionary:portraitEffectsMatteSurface:portraitEffectsMatteMetadataDictionary:hairSegmentationMatteSurface:hairSegmentationMatteMetadataDictionary:skinSegmentationMatteSurface:skinSegmentationMatteMetadataDictionary:teethSegmentationMatteSurface:teethSegmentationMatteMetadataDictionary:glassesSegmentationMatteSurface:glassesSegmentationMatteMetadataDictionary:constantColorConfidenceMapSurface:constantColorMetadataDictionary:captureRequest:bracketSettings:sequenceCount:photoCount:expectedPhotoProcessingFlags:sourceDeviceType:](&v19, sel_initWithTimestamp_photoSurface_photoSurfaceSize_processedFileType_previewPhotoSurface_embeddedThumbnailSourceSurface_metadata_depthDataSurface_depthMetadataDictionary_portraitEffectsMatteSurface_portraitEffectsMatteMetadataDictionary_hairSegmentationMatteSurface_hairSegmentationMatteMetadataDictionary_skinSegmentationMatteSurface_skinSegmentationMatteMetadataDictionary_teethSegmentationMatteSurface_teethSegmentationMatteMetadataDictionary_glassesSegmentationMatteSurface_glassesSegmentationMatteMetadataDictionary_constantColorConfidenceMapSurface_constantColorMetadataDictionary_captureRequest_bracketSettings_sequenceCount_photoCount_expectedPhotoProcessingFlags_sourceDeviceType_, &v17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0,
            0,
            0,
            0,
            0,
            0,
            1,
            1,
            v16,
            @"AVCaptureDeviceTypeBuiltInWideAngleCamera");
    if (v13)
    {
      v13->_applicationIdentifier = (NSString *)[a3 copy];
      v13->_captureRequestIdentifier = (NSString *)[a4 copy];
      v13->_photoIdentifier = (NSString *)[a5 copy];
    }
  }
  else
  {
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v14);
    }
    NSLog(&cfstr_SuppressingExc.isa, v14);
    return 0;
  }
  return v13;
}

- (AVCaptureDeferredPhotoProxy)initWithTimestamp:(id *)a3 proxySurface:(__IOSurface *)a4 proxySurfaceSize:(unint64_t)a5 proxyFileType:(id)a6 previewPhotoSurface:(__IOSurface *)a7 metadata:(id)a8 captureRequest:(id)a9 sequenceCount:(unint64_t)a10 photoCount:(unint64_t)a11 applicationIdentifier:(id)a12 captureRequestIdentifier:(id)a13 photoIdentifier:(id)a14 expectedPhotoProcessingFlags:(unsigned int)a15 sourceDeviceType:(id)a16
{
  v19.receiver = self;
  v19.super_class = (Class)AVCaptureDeferredPhotoProxy;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = *a3;
  unsigned int v16 = -[AVCapturePhoto initWithTimestamp:photoSurface:photoSurfaceSize:processedFileType:previewPhotoSurface:embeddedThumbnailSourceSurface:metadata:depthDataSurface:depthMetadataDictionary:portraitEffectsMatteSurface:portraitEffectsMatteMetadataDictionary:hairSegmentationMatteSurface:hairSegmentationMatteMetadataDictionary:skinSegmentationMatteSurface:skinSegmentationMatteMetadataDictionary:teethSegmentationMatteSurface:teethSegmentationMatteMetadataDictionary:glassesSegmentationMatteSurface:glassesSegmentationMatteMetadataDictionary:constantColorConfidenceMapSurface:constantColorMetadataDictionary:captureRequest:bracketSettings:sequenceCount:photoCount:expectedPhotoProcessingFlags:sourceDeviceType:](&v19, sel_initWithTimestamp_photoSurface_photoSurfaceSize_processedFileType_previewPhotoSurface_embeddedThumbnailSourceSurface_metadata_depthDataSurface_depthMetadataDictionary_portraitEffectsMatteSurface_portraitEffectsMatteMetadataDictionary_hairSegmentationMatteSurface_hairSegmentationMatteMetadataDictionary_skinSegmentationMatteSurface_skinSegmentationMatteMetadataDictionary_teethSegmentationMatteSurface_teethSegmentationMatteMetadataDictionary_glassesSegmentationMatteSurface_glassesSegmentationMatteMetadataDictionary_constantColorConfidenceMapSurface_constantColorMetadataDictionary_captureRequest_bracketSettings_sequenceCount_photoCount_expectedPhotoProcessingFlags_sourceDeviceType_, &v18, a4, a5, a6, a7, 0, a8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
          0,
          0,
          0,
          0,
          a9,
          0,
          a10,
          a11,
          a15,
          a16);
  if (v16)
  {
    v16->_applicationIdentifier = (NSString *)[a12 copy];
    v16->_captureRequestIdentifier = (NSString *)[a13 copy];
    v16->_photoIdentifier = (NSString *)[a14 copy];
  }
  return v16;
}

- (AVCaptureDeferredPhotoProxy)initWithDeferredPhotoIdentifier:(id)a3
{
  return [(AVCaptureDeferredPhotoProxy *)self initWithDeferredPhotoIdentifier:a3 applicationIdentifier:0x1EF4D53D0];
}

- (AVCaptureDeferredPhotoProxy)initWithDeferredPhotoIdentifier:(id)a3 applicationIdentifier:(id)a4
{
  if (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementDeferredPhotoProcessor))
  {
    v7 = (void *)[a3 componentsSeparatedByString:@"/"];
    if ([v7 count] == 2)
    {
      v8 = (void *)[v7 objectAtIndexedSubscript:0];
      v9 = (void *)[v7 objectAtIndexedSubscript:1];
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    if ([v8 length] && objc_msgSend(v9, "length"))
    {
      long long v13 = *MEMORY[0x1E4F1F9F8];
      uint64_t v14 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      return [(AVCaptureDeferredPhotoProxy *)self initWithApplicationIdentifier:a4 captureRequestIdentifier:v8 photoIdentifier:v9 timestamp:&v13 expectedPhotoProcessingFlags:0];
    }
    v12 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(), 0, a3);

    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v12);
    }
    NSLog(&cfstr_SuppressingExc.isa, v12);
  }
  else
  {
    v10 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v10);
    }
    NSLog(&cfstr_SuppressingExc.isa, v10);
  }
  return 0;
}

- (NSString)deferredPhotoIdentifier
{
  return (NSString *)[NSString stringWithFormat:@"%@/%@", self->_captureRequestIdentifier, self->_photoIdentifier];
}

- (id)captureRequestIdentifier
{
  v2 = self->_captureRequestIdentifier;

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeferredPhotoProxy;
  [(AVCapturePhoto *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = -[NSString isEqual:](self->_applicationIdentifier, "isEqual:", [a3 applicationIdentifier]);
      if (v5)
      {
        int v5 = -[NSString isEqual:](self->_captureRequestIdentifier, "isEqual:", [a3 captureRequestIdentifier]);
        if (v5)
        {
          photoIdentifier = self->_photoIdentifier;
          uint64_t v7 = [a3 persistentStorageUUID];
          LOBYTE(v5) = [(NSString *)photoIdentifier isEqual:v7];
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)debugDescription
{
  uint64_t v3 = [NSString stringWithFormat:@"proxy:{%dx%d deferredPhotoIdentifier:%@%@}", -[AVCaptureDeferredPhotoProxy dimensions](self, "dimensions"), (unint64_t)-[AVCaptureDeferredPhotoProxy dimensions](self, "dimensions") >> 32, -[AVCaptureDeferredPhotoProxy deferredPhotoIdentifier](self, "deferredPhotoIdentifier"), &stru_1EF4D21D0];
  v4 = NSString;
  if (self) {
    [(AVCapturePhoto *)self timestamp];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  Float64 Seconds = CMTimeGetSeconds(&time);
  NSInteger v6 = [(AVCapturePhoto *)self photoCount];
  NSUInteger v7 = [(AVCaptureResolvedPhotoSettings *)[(AVCapturePhoto *)self resolvedSettings] expectedPhotoCount];
  id v8 = [(AVCaptureResolvedPhotoSettings *)[(AVCapturePhoto *)self resolvedSettings] debugDescription];
  [(AVCapturePhoto *)self expectedPhotoProcessingFlags];
  return (id)[v4 stringWithFormat:@"pts:%f %d/%d %@ settings:%@ flags: %@", *(void *)&Seconds, v6, v7, v3, v8, AVAppleMakerNoteProcessingFlagsToShortString()];
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVCaptureDeferredPhotoProxy debugDescription](self, "debugDescription")];
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  v2 = (void *)[(AVCapturePhoto *)self internal][104];

  return ($2825F4736939C4A6D3AD43837233062D)[v2 deferredPhotoProxyDimensions];
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (NSString)persistentStorageUUID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

@end