@interface BWVideoDepthNode
+ (void)initialize;
- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3;
- (BOOL)releasesResourcesAtEndOfData;
- (BWVideoDepthNode)initWithInferenceScheduler:(id)a3 captureDevice:(id)a4 videoDepthConfiguration:(id)a5 extraDepthOutputRetainedBufferCount:(int)a6 error:(int *)a7;
- (id)inputFormatForAttachedMediaKey:(id)a3;
- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3;
- (id)inputVideoFormatForAttachedMediaKey:(id)a3;
- (id)nodeSubType;
- (id)nodeType;
- (id)outputFormatForAttachedMediaKey:(id)a3;
- (id)outputVideoFormatForAttachedMediaKey:(id)a3;
- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4;
- (os_unfair_lock_s)inferencesToSkip;
- (void)_releaseResources;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setInferencesToSkip:(id)a3;
- (void)setReleasesResourcesAtEndOfData:(BOOL)a3;
@end

@implementation BWVideoDepthNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if ([a5 isEqualToString:@"PrimaryFormat"])
  {
    [(BWNodeOutput *)self->super._output setFormat:a3];
  }
  else if (([a5 isEqualToString:0x1EFA6A600] & 1) != 0 {
         || [a5 isEqualToString:0x1EFA6A460])
  }
  {
    v9 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWInferenceVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", [a3 pixelBufferAttributes]);
    [(BWInferenceVideoFormatRequirements *)v9 setIncludesInvalidContent:0];
    v16[0] = v9;
    id v10 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1]);
    [(BWInferenceEngine *)self->_inferenceEngine prepareForInputInferenceVideoFormat:v10 attachedMediaKey:a5];
    if ([a5 isEqualToString:0x1EFA6A600]) {
      self->_primaryMediaInputFormat = (BWInferenceVideoFormat *)v10;
    }
  }
  else if ([a5 isEqualToString:@"Depth"])
  {
    [a3 width];
    [a3 height];
    self->_blankDisparityPixelBuffer = (__CVBuffer *)CreatePixelBuffer();
    v11 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v11, "setWidth:", [a3 width]);
    -[BWVideoFormatRequirements setHeight:](v11, "setHeight:", [a3 height]);
    [(BWVideoFormatRequirements *)v11 setSupportedPixelFormats:&unk_1EFB03A58];
    [(BWVideoFormatRequirements *)v11 setBytesPerRowAlignment:64];
    if (self->_sourceIsNuri) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = [(BWFigVideoCaptureDevice *)self->_captureDevice depthDataBaseRotation];
    }
    [(BWInferenceVideoFormatRequirements *)v11 setRotationDegrees:v12];
    v15 = v11;
    v13 = (BWInferenceVideoFormat *)+[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1]);
    self->_disparityInputFormat = v13;
    [(BWInferenceEngine *)self->_inferenceEngine prepareForInputInferenceVideoFormat:v13 attachedMediaKey:0x1EFA6A4A0];
  }
  v14.receiver = self;
  v14.super_class = (Class)BWVideoDepthNode;
  [(BWNode *)&v14 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
}

- (id)nodeType
{
  return @"Effect";
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return [a3 isEqualToString:0x1EFA6A600];
}

- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3
{
  if ([a3 isEqualToString:0x1EFA6A4A0])
  {
    v5 = &OBJC_IVAR___BWVideoDepthNode__disparityInputFormat;
    return *(Class *)((char *)&self->super.super.isa + *v5);
  }
  if ([a3 isEqualToString:0x1EFA6A600])
  {
    v5 = &OBJC_IVAR___BWVideoDepthNode__primaryMediaInputFormat;
    return *(Class *)((char *)&self->super.super.isa + *v5);
  }
  return 0;
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  if ([a3 isEqualToString:0x1EFA6A4E0])
  {
    uint64_t v5 = 248;
    return *(Class *)((char *)&self->super.super.isa + v5);
  }
  if (([a3 isEqualToString:0x1EFA6A560] & 1) != 0
    || [a3 isEqualToString:0x1EFA6A580])
  {
    uint64_t v5 = 240;
    return *(Class *)((char *)&self->super.super.isa + v5);
  }
  if (([a3 isEqualToString:0x1EFA6A640] & 1) != 0
    || [a3 isEqualToString:0x1EFA6A620])
  {
    uint64_t v5 = 232;
    return *(Class *)((char *)&self->super.super.isa + v5);
  }
  id v7 = [(BWNodeInput *)self->super._input mediaPropertiesForAttachedMediaKey:a3];
  return (id)[v7 resolvedVideoFormat];
}

- (BWVideoDepthNode)initWithInferenceScheduler:(id)a3 captureDevice:(id)a4 videoDepthConfiguration:(id)a5 extraDepthOutputRetainedBufferCount:(int)a6 error:(int *)a7
{
  v37[1] = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)BWVideoDepthNode;
  uint64_t v12 = [(BWNode *)&v33 init];
  if (v12)
  {
    v12->_sourceIsNuri = [a5 sourceIsNuri];
    uint64_t v13 = 2 * [a5 concurrencyWidth];
    v12->_inferenceScheduler = (BWInferenceScheduler *)a3;
    objc_super v14 = (BWFigVideoCaptureDevice *)a4;
    v12->_captureDevice = v14;
    if (![(BWFigVideoCaptureDevice *)v14 attachesUprightExifOrientationMetadataToStreamingFrames])[(BWFigVideoCaptureDevice *)v12->_captureDevice setAttachesUprightExifOrientationMetadataToStreamingFrames:1]; {
    v15 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v12];
    }
    [(BWNodeInput *)v15 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInput *)v15 setPassthroughMode:1];
    v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
    v17 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v17 setSupportedPixelFormats:&unk_1EFB039F8];
    [(BWNodeInputMediaConfiguration *)v16 setFormatRequirements:v17];
    [(BWNodeInputMediaConfiguration *)v16 setPassthroughMode:0];
    [(BWNodeInput *)v15 setMediaConfiguration:v16 forAttachedMediaKey:@"Depth"];
    v18 = objc_alloc_init(BWNodeInputMediaConfiguration);
    int v32 = v13;
    [(BWNodeInputMediaConfiguration *)v18 setRetainedBufferCount:v13];
    [(BWNodeInputMediaConfiguration *)v18 setPassthroughMode:0];
    [(BWNodeInput *)v15 setMediaConfiguration:v18 forAttachedMediaKey:0x1EFA6A600];
    [(BWNode *)v12 addInput:v15];

    v19 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v12];
    [(BWNodeOutput *)v19 setPassthroughMode:1];
    [(BWNodeOutput *)v19 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    v20 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v20 setSupportedPixelFormats:&unk_1EFB03A10];
    unsigned int v21 = [a5 inputDimensions];
    unint64_t v22 = (unint64_t)[a5 inputDimensions] >> 32;
    [a5 temporalDepthInputPixelFormat];
    v12->_initialDisparityPixelBuffer = (__CVBuffer *)CreatePixelBuffer();
    v12->_previousDisparitySampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
    v12->_depthOutputDimensions = ($470D365275581EF16070F5A11344F73E)[a5 outputDimensions];
    PixelBuffer = (const void *)CreatePixelBuffer();
    v12->_disparityPostprocessingInStateSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
    if (PixelBuffer) {
      CFRelease(PixelBuffer);
    }
    v24 = (const void *)CreatePixelBuffer();
    v12->_disparityPostprocessingOutStateSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
    if (v24) {
      CFRelease(v24);
    }
    [(BWVideoFormatRequirements *)v20 setWidth:v12->_depthOutputDimensions.width];
    [(BWVideoFormatRequirements *)v20 setHeight:v12->_depthOutputDimensions.height];
    v25 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    [(BWNodeOutputMediaConfiguration *)v25 setPassthroughMode:0];
    [(BWNodeOutputMediaConfiguration *)v25 setProvidesPixelBufferPool:1];
    [(BWNodeOutputMediaConfiguration *)v25 setOwningNodeRetainedBufferCount:(a6 + 1)];
    v12->_backpressureEvent = (MTLEvent *)(id)[a5 backpressureEvent];
    [(BWNodeOutputMediaConfiguration *)v25 setFormatRequirements:v20];
    [(BWNodeOutput *)v19 setMediaConfiguration:v25 forAttachedMediaKey:@"Depth"];
    [(BWNode *)v12 addOutput:v19];
    v12->_inferenceEngine = [[BWInferenceEngine alloc] initWithScheduler:v12->_inferenceScheduler priority:6];
    v12->_releasesResourcesAtEndOfData = 1;
    int v26 = [(BWInferenceEngine *)v12->_inferenceEngine addInferenceOfType:109 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:a5];
    if (v26)
    {
      int v31 = v26;
      fig_log_get_emitter();
      FigDebugAssert3();

      uint64_t v12 = 0;
      *a7 = v31;
    }
    else
    {
      v27 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v27 setSupportedPixelFormats:&unk_1EFB03A28];
      [(BWVideoFormatRequirements *)v27 setWidth:v21];
      [(BWVideoFormatRequirements *)v27 setHeight:v22];
      v37[0] = v27;
      v12->_internalDisparityVideoFormat = (BWVideoFormat *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1]);
      v12->_internalDisparityPool = [[BWPixelBufferPool alloc] initWithVideoFormat:v12->_internalDisparityVideoFormat capacity:v32 name:@"VideoDepthNodeDisparityPool" memoryPool:[(BWNodeOutput *)v12->super._output memoryPool]];
      v28 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v28 setSupportedPixelFormats:&unk_1EFB03A40];
      -[BWVideoFormatRequirements setWidth:](v28, "setWidth:", (int)[a5 outputDimensions]);
      -[BWVideoFormatRequirements setHeight:](v28, "setHeight:", [a5 outputDimensions] >> 32);
      v36 = v28;
      v12->_disparityStateVideoFormat = (BWVideoFormat *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1]);
      v29 = objc_alloc_init(BWVideoFormatRequirements);
      uint64_t v35 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a5, "featuresPixelFormat"));
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v29, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1]);
      -[BWVideoFormatRequirements setWidth:](v29, "setWidth:", (int)[a5 featuresDimensions]);
      -[BWVideoFormatRequirements setHeight:](v29, "setHeight:", [a5 featuresDimensions] >> 32);
      v34 = v29;
      v12->_featuresVideoFormat = (BWVideoFormat *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1]);
      v12->_featuresPool = [[BWPixelBufferPool alloc] initWithVideoFormat:v12->_featuresVideoFormat capacity:v32 name:@"VideoDepthNodeFeaturesPool" memoryPool:[(BWNodeOutput *)v12->super._output memoryPool]];
      [(BWVideoFormatRequirements *)v29 width];
      [(BWVideoFormatRequirements *)v29 height];
      [a5 featuresPixelFormat];
      v12->_initialFeaturesPixelBuffer = (__CVBuffer *)CreatePixelBuffer();
      v12->_previousFeaturesSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
    }
  }
  return v12;
}

- (void)setInferencesToSkip:(id)a3
{
  p_inferenceTypesToSkipLock = &self->_inferenceTypesToSkipLock;
  os_unfair_lock_lock(&self->_inferenceTypesToSkipLock);
  inferenceTypesToSkip = self->_inferenceTypesToSkip;
  if (inferenceTypesToSkip != a3)
  {

    self->_inferenceTypesToSkip = (NSSet *)[a3 copy];
  }
  os_unfair_lock_unlock(p_inferenceTypesToSkipLock);
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3.receiver = self;
  v3.super_class = (Class)BWVideoDepthNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  if (![(BWInferenceEngine *)self->_inferenceEngine prepareForInferenceWithFormatProvider:self pixelBufferPoolProvider:self])[(BWFigVideoCaptureDevice *)self->_captureDevice setPreviewVideoDepthNodeUnprepared:0]; {
}
  }

+ (void)initialize
{
}

- (void)dealloc
{
  -[BWVideoDepthNode _releaseResources]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)BWVideoDepthNode;
  [(BWNode *)&v3 dealloc];
}

- (void)_releaseResources
{
  if (a1)
  {

    *(void *)(a1 + 152) = 0;
    *(void *)(a1 + 96) = 0;

    *(void *)(a1 + 104) = 0;
    *(void *)(a1 + 128) = 0;

    *(void *)(a1 + 136) = 0;
    *(void *)(a1 + 256) = 0;

    *(void *)(a1 + 264) = 0;
    *(void *)(a1 + 272) = 0;

    *(void *)(a1 + 232) = 0;
    *(void *)(a1 + 240) = 0;

    *(void *)(a1 + 248) = 0;
    *(void *)(a1 + 112) = 0;
    v2 = *(const void **)(a1 + 192);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 192) = 0;
    }
    objc_super v3 = *(const void **)(a1 + 200);
    if (v3)
    {
      CFRelease(v3);
      *(void *)(a1 + 200) = 0;
    }
    v4 = *(const void **)(a1 + 144);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 144) = 0;
    }
    uint64_t v5 = *(const void **)(a1 + 160);
    if (v5)
    {
      CFRelease(v5);
      *(void *)(a1 + 160) = 0;
    }
    v6 = *(const void **)(a1 + 176);
    if (v6)
    {
      CFRelease(v6);
      *(void *)(a1 + 176) = 0;
    }
    id v7 = *(const void **)(a1 + 184);
    if (v7)
    {
      CFRelease(v7);
      *(void *)(a1 + 184) = 0;
    }
    v8 = *(const void **)(a1 + 208);
    if (v8)
    {
      CFRelease(v8);
      *(void *)(a1 + 208) = 0;
    }
    v9 = *(const void **)(a1 + 168);
    if (v9)
    {
      CFRelease(v9);
      *(void *)(a1 + 168) = 0;
    }
  }
}

- (os_unfair_lock_s)inferencesToSkip
{
  if (result)
  {
    v1 = result;
    os_unfair_lock_lock(result + 30);
    v2 = (void *)[*(id *)&v1[28]._os_unfair_lock_opaque copy];
    os_unfair_lock_unlock(v1 + 30);
    return (os_unfair_lock_s *)v2;
  }
  return result;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if (self->_releasesResourcesAtEndOfData) {
    -[BWVideoDepthNode _releaseResources]((uint64_t)self);
  }
  v5.receiver = self;
  v5.super_class = (Class)BWVideoDepthNode;
  [(BWNode *)&v5 didReachEndOfDataForInput:a3];
}

- (id)nodeSubType
{
  return @"VideoDepth";
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  CMAttachmentBearerRef target = 0;
  memset(&v36, 0, sizeof(v36));
  CMSampleBufferGetPresentationTimeStamp(&v36, a3);
  AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, @"Depth");
  CFTypeRef cf = AttachedMedia;
  if (AttachedMedia) {
    CFRetain(AttachedMedia);
  }
  BWSampleBufferRemoveAttachedMedia(a3, @"Depth");
  int v8 = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55B30], 0), "intValue");
  if (self->_structuredLightIsOccluded)
  {
    BOOL v9 = v8 == 1 || cf == 0;
    BOOL v10 = v9;
    self->_structuredLightIsOccluded = v10;
    if (!v9)
    {
      previousDisparitySampleBuffer = self->_previousDisparitySampleBuffer;
      if (previousDisparitySampleBuffer) {
        CFRelease(previousDisparitySampleBuffer);
      }
      self->_previousDisparitySampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
      previousFeaturesSampleBuffer = self->_previousFeaturesSampleBuffer;
      if (previousFeaturesSampleBuffer) {
        CFRelease(previousFeaturesSampleBuffer);
      }
      self->_previousFeaturesSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
      [(BWVideoFormat *)self->_disparityStateVideoFormat width];
      [(BWVideoFormat *)self->_disparityStateVideoFormat height];
      [(BWVideoFormat *)self->_disparityStateVideoFormat pixelFormat];
      PixelBuffer = (const void *)CreatePixelBuffer();
      disparityPostprocessingInStateSampleBuffer = self->_disparityPostprocessingInStateSampleBuffer;
      if (disparityPostprocessingInStateSampleBuffer) {
        CFRelease(disparityPostprocessingInStateSampleBuffer);
      }
      self->_disparityPostprocessingInStateSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
      if (PixelBuffer) {
        CFRelease(PixelBuffer);
      }
      [(BWFigVideoCaptureDevice *)self->_captureDevice updateSDOFBackgroundShiftSum:0 invalidShiftRatio:0 closeCanonicalDisparityAverage:0 faceCanonicalDisparityAverages:0.0 erodedForegroundRatio:0.0 foregroundRatio:0.0 occluded:0.0 faces:0.0 personSegmentationRatio:0.0];
      goto LABEL_27;
    }
  }
  else
  {
    self->_structuredLightIsOccluded = v8 == 1;
    if (v8 != 1) {
      goto LABEL_27;
    }
  }
  [(BWFigVideoCaptureDevice *)self->_captureDevice updateSDOFBackgroundShiftSum:0 invalidShiftRatio:1 closeCanonicalDisparityAverage:0 faceCanonicalDisparityAverages:0.0 erodedForegroundRatio:0.0 foregroundRatio:0.0 occluded:0.0 faces:0.0 personSegmentationRatio:0.0];
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  blankDisparityPixelBuffer = self->_blankDisparityPixelBuffer;
  CMTime v34 = v36;
  int v16 = BWSampleBufferCreateFromPixelBuffer(blankDisparityPixelBuffer, (uint64_t)&v34, (CFTypeRef *)&self->_depthFormatDescription, (CMSampleBufferRef *)&cf);
  if (v16)
  {
    int v31 = v16;
    fig_log_get_emitter();
    uint64_t v33 = v4;
    LODWORD(v32) = v31;
    FigDebugAssert3();
    goto LABEL_46;
  }
  CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55B38], MEMORY[0x1E4F1CC38], 1u);
LABEL_27:
  int v17 = objc_msgSend((id)CMGetAttachment(a3, @"DepthDisabled", 0), "BOOLValue");
  if (cf || v17)
  {
    v18 = -[BWVideoDepthNode inferencesToSkip]((os_unfair_lock_s *)self);
    v19 = v18;
    if (!self->_previousDisparitySampleBuffer
      && ([(os_unfair_lock_s *)v18 containsObject:&unk_1EFB003F8] & 1) == 0)
    {
      self->_previousDisparitySampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
    }
    if (!self->_previousFeaturesSampleBuffer
      && ([(os_unfair_lock_s *)v19 containsObject:&unk_1EFB003F8] & 1) == 0)
    {
      self->_previousFeaturesSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
    }
    BWSampleBufferSetAttachedMedia(a3, 0x1EFA6A4E0, (uint64_t)self->_previousDisparitySampleBuffer);
    BWSampleBufferSetAttachedMedia(a3, 0x1EFA6A560, (uint64_t)self->_disparityPostprocessingInStateSampleBuffer);
    BWSampleBufferSetAttachedMedia(a3, 0x1EFA6A620, (uint64_t)self->_previousFeaturesSampleBuffer);
    BWSampleBufferSetAttachedMedia(a3, 0x1EFA6A580, (uint64_t)self->_disparityPostprocessingOutStateSampleBuffer);
    v20 = self->_previousFeaturesSampleBuffer;
    if (v20)
    {
      CFRelease(v20);
      self->_previousFeaturesSampleBuffer = 0;
    }
    unsigned int v21 = self->_previousDisparitySampleBuffer;
    if (v21)
    {
      CFRelease(v21);
      self->_previousDisparitySampleBuffer = 0;
    }
    BWSampleBufferSetAttachedMedia(a3, 0x1EFA6A4A0, (uint64_t)cf);
    if (![(BWInferenceEngine *)self->_inferenceEngine performInferencesOnSampleBuffer:a3 attachingResultsToSampleBuffer:a3 skippingInferencesWithTypes:v19]&& ([(os_unfair_lock_s *)v19 containsObject:&unk_1EFB003F8] & 1) == 0)
    {
      unint64_t v22 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, @"Depth");
      ImageBuffer = CMSampleBufferGetImageBuffer(v22);
      CMTime v34 = v36;
      if (!BWSampleBufferCreateFromPixelBuffer(ImageBuffer, (uint64_t)&v34, (CFTypeRef *)&self->_depthFormatDescription, (CMSampleBufferRef *)&target))
      {
        CFStringRef v24 = (const __CFString *)*MEMORY[0x1E4F53070];
        v25 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        int v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
        objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]), *MEMORY[0x1E4F54128]);
        objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend(v25, "objectForKeyedSubscript:", @"MirroredHorizontal"), @"MirroredHorizontal");
        CMSetAttachment(target, v24, v26, 1u);

        BWSampleBufferSetAttachedMedia(a3, @"Depth", (uint64_t)target);
        v27 = self->_disparityPostprocessingInStateSampleBuffer;
        self->_disparityPostprocessingInStateSampleBuffer = self->_disparityPostprocessingOutStateSampleBuffer;
        self->_disparityPostprocessingOutStateSampleBuffer = v27;
        v28 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA6A5E0);
        self->_previousDisparitySampleBuffer = v28;
        if (v28) {
          CFRetain(v28);
        }
        v29 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA6A640);
        self->_previousFeaturesSampleBuffer = v29;
        if (v29) {
          CFRetain(v29);
        }
      }
    }
  }
LABEL_46:
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA6A4E0);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA6A4A0);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA6A4C0);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA6A520);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA6A540);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA6A5E0);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA6A460);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA6A600);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA6A580);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA6A560);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA6A620);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA6A640);
  BWSampleBufferRemoveAttachedMedia(a3, 0x1EFA6A480);
  if (cf) {
    CFRelease(cf);
  }
  if (target) {
    CFRelease(target);
  }
  if (self->_backpressureEvent)
  {
    id v30 = [(BWInferenceEngine *)self->_inferenceEngine metalCommandBuffer];
    objc_msgSend(v30, "encodeSignalEvent:value:", self->_backpressureEvent, objc_msgSend((id)CMGetAttachment(a3, @"CinematicInferencesBackpressureEventNumber", 0), "longLongValue"));
    [v30 commit];
    CMRemoveAttachment(a3, @"CinematicInferencesBackpressureEventNumber");
  }
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v32, v33);
}

- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4
{
  if (!objc_msgSend(a3, "isEqualToString:", @"Depth", a4))
  {
    if ([a3 isEqualToString:0x1EFA6A5E0])
    {
      uint64_t v8 = 256;
    }
    else
    {
      if (![a3 isEqualToString:0x1EFA6A640]) {
        return 0;
      }
      uint64_t v8 = 264;
    }
    return *(Class *)((char *)&self->super.super.isa + v8);
  }
  id v6 = [(BWNodeOutput *)self->super._output mediaPropertiesForAttachedMediaKey:@"Depth"];
  return (id)[v6 preparedPixelBufferPool];
}

- (id)inputFormatForAttachedMediaKey:(id)a3
{
  id v3 = [(BWNodeInput *)self->super._input mediaPropertiesForAttachedMediaKey:a3];
  return (id)[v3 resolvedVideoFormat];
}

- (id)outputFormatForAttachedMediaKey:(id)a3
{
  id v3 = [(BWNodeOutput *)self->super._output mediaPropertiesForAttachedMediaKey:a3];
  return (id)[v3 resolvedFormat];
}

- (id)outputVideoFormatForAttachedMediaKey:(id)a3
{
  id v3 = [(BWNodeOutput *)self->super._output mediaPropertiesForAttachedMediaKey:a3];
  return (id)[v3 resolvedVideoFormat];
}

- (BOOL)releasesResourcesAtEndOfData
{
  return self->_releasesResourcesAtEndOfData;
}

- (void)setReleasesResourcesAtEndOfData:(BOOL)a3
{
  self->_releasesResourcesAtEndOfData = a3;
}

@end