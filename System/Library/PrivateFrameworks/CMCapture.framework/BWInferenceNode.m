@interface BWInferenceNode
+ (void)initialize;
- (BOOL)applyRecommendedMasterPortType;
- (BOOL)awaitAsynchronousOutputs;
- (BOOL)backPressureDrivenPipelining;
- (BOOL)ignoreInvalidContentInformationForPrimaryMedia;
- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3;
- (BOOL)passthroughInputSampleBuffer;
- (BOOL)releasesResourcesAtEndOfData;
- (BWInferenceEngine)inferenceEngine;
- (BWInferenceNode)initWithConvEngineSupportWithCaptureDevice:(id)a3 scheduler:(id)a4 priority:(unsigned int)a5;
- (BWInferenceNode)initWithScheduler:(id)a3 priority:(unsigned int)a4;
- (CMSampleBufferRef)createOutputSampleBufferFromInput:(CMSampleBufferRef)result;
- (NSString)description;
- (id)inferenceTypesToSkipResolver;
- (id)inputFormatForAttachedMediaKey:(id)a3;
- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3;
- (id)inputVideoFormatForAttachedMediaKey:(id)a3;
- (id)nodeSubType;
- (id)nodeType;
- (id)outputFormatForAttachedMediaKey:(id)a3;
- (id)outputVideoFormatForAttachedMediaKey:(id)a3;
- (id)postprocessFilter;
- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4;
- (int)addInferenceOfType:(int)a3 version:(id)a4;
- (int)addInferenceOfType:(int)a3 version:(id)a4 configuration:(id)a5;
- (int)additionalOutputPoolRetainedBufferCount;
- (uint64_t)_commonInit;
- (void)_releaseResources;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setAdditionalOutputPoolRetainedBufferCount:(int)a3;
- (void)setApplyRecommendedMasterPortType:(BOOL)a3;
- (void)setAwaitAsynchronousOutputs:(BOOL)a3;
- (void)setBackPressureDrivenPipelining:(BOOL)a3;
- (void)setIgnoreInvalidContentInformationForPrimaryMedia:(BOOL)a3;
- (void)setInferenceTypesToSkipResolver:(id)a3;
- (void)setInferencesToSkip:(id)a3;
- (void)setPassthroughInputSampleBuffer:(BOOL)a3;
- (void)setPostprocessFilter:(id)a3;
- (void)setReleasesResourcesAtEndOfData:(BOOL)a3;
@end

@implementation BWInferenceNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v7 = [(BWNode *)self output];
  if ([a4 mediaType] == 1986618469
    && [(BWNodeOutput *)v7 mediaType] == 1986618469)
  {
    v8 = [(BWInferenceNode *)self inferenceEngine];
    [(BWInferenceEngine *)v8 prepareForInputVideoFormat:a3 attachedMediaKey:a5];
    v9 = [(BWInferenceEngine *)v8 providedVideoRequirementsByAttachedMediaKey];
    if (v9)
    {
      v10 = v9;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v11 = [(NSDictionary *)v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v26 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            if (![(BWNodeOutput *)v7 mediaConfigurationForAttachedMediaKey:v15])
            {
              id v16 = [(NSDictionary *)v10 objectForKeyedSubscript:v15];
              if (!v16) {
                goto LABEL_17;
              }
              uint64_t v17 = [v16 videoFormat];
              if (!v17) {
                goto LABEL_17;
              }
              v18 = (void *)v17;
              v19 = objc_alloc_init(BWNodeOutputMediaConfiguration);
              -[BWNodeOutputMediaConfiguration setFormatRequirements:](v19, "setFormatRequirements:", -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", [v18 pixelBufferAttributes]));
              [(BWNodeOutputMediaConfiguration *)v19 setPassthroughMode:0];
              [(BWNodeOutputMediaConfiguration *)v19 setProvidesPixelBufferPool:1];
              [(BWNodeOutputMediaConfiguration *)v19 setPixelBufferPoolProvidesBackPressure:self->_backPressureDrivenPipelining];
              [(BWNodeOutputMediaConfiguration *)v19 setPixelBufferPoolReportSlowBackPressureAllocations:self->_backPressureDrivenPipelining];
              if (self->_additionalOutputPoolRetainedBufferCount) {
                -[BWNodeOutputMediaConfiguration setOwningNodeRetainedBufferCount:](v19, "setOwningNodeRetainedBufferCount:");
              }
              [(BWNodeOutput *)v7 setMediaConfiguration:v19 forAttachedMediaKey:v15];
              objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](v7, "mediaPropertiesForAttachedMediaKey:", v15), "setResolvedFormat:", 0);
            }
          }
          uint64_t v12 = [(NSDictionary *)v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v12);
      }
    }
  }
LABEL_17:
  if ([(BWNodeOutput *)v7 _passthroughModeForAttachedMediaKey:a5])
  {
    uint64_t v20 = [(BWNodeOutput *)v7 mediaConfigurationForAttachedMediaKey:a5];
    uint64_t v21 = [(BWNodeOutput *)v7 primaryMediaConfiguration];
    if (!v20 || v20 == v21)
    {
      v22 = [(BWNodeOutput *)v7 mediaPropertiesForAttachedMediaKey:a5];
      if (!v22)
      {
        v22 = objc_alloc_init(BWNodeOutputMediaProperties);
        [(BWNodeOutput *)v7 _setMediaProperties:v22 forAttachedMediaKey:a5];
      }
      [(BWNodeOutputMediaProperties *)v22 setResolvedFormat:a3];
    }
  }
}

- (BWInferenceEngine)inferenceEngine
{
  return self->_inferenceEngine;
}

- (uint64_t)_commonInit
{
  if (result)
  {
    uint64_t v1 = result;
    *(void *)(result + 104) = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    *(_DWORD *)(v1 + 112) = 0;
    *(unsigned char *)(v1 + 116) = 1;
    v2 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v1];
    v3 = [(BWNodeInput *)v2 primaryMediaConfiguration];
    v4 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeInputMediaConfiguration *)v3 setFormatRequirements:v4];
    [(BWNodeInputMediaConfiguration *)v3 setPassthroughMode:1];
    v5 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInputMediaConfiguration *)v5 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInputMediaConfiguration *)v5 setPassthroughMode:1];
    [(BWNodeInput *)v2 setUnspecifiedAttachedMediaConfiguration:v5];
    v6 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v1];
    v7 = [(BWNodeOutput *)v6 primaryMediaConfiguration];
    [(BWNodeOutputMediaConfiguration *)v7 setFormatRequirements:v4];
    [(BWNodeOutputMediaConfiguration *)v7 setPassthroughMode:1];
    [(id)v1 addInput:v2];
    result = [(id)v1 addOutput:v6];
    *(unsigned char *)(v1 + 144) = 1;
  }
  return result;
}

- (id)nodeType
{
  return @"Inference";
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

- (BWInferenceNode)initWithScheduler:(id)a3 priority:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  v8.receiver = self;
  v8.super_class = (Class)BWInferenceNode;
  v6 = [(BWNode *)&v8 init];
  if (v6)
  {
    v6->_inferenceEngine = [[BWInferenceEngine alloc] initWithScheduler:a3 priority:v4];
    -[BWInferenceNode _commonInit]((uint64_t)v6);
  }
  return v6;
}

- (BWInferenceNode)initWithConvEngineSupportWithCaptureDevice:(id)a3 scheduler:(id)a4 priority:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  v10.receiver = self;
  v10.super_class = (Class)BWInferenceNode;
  objc_super v8 = [(BWNode *)&v10 init];
  if (v8)
  {
    v8->_captureDevice = (BWFigVideoCaptureDevice *)a3;
    v8->_inferenceEngine = [[BWInferenceEngine alloc] initWithScheduler:a4 priority:v5];
    -[BWInferenceNode _commonInit]((uint64_t)v8);
  }
  return v8;
}

- (int)addInferenceOfType:(int)a3 version:(id)a4 configuration:(id)a5
{
  int result = [(BWInferenceEngine *)self->_inferenceEngine addInferenceOfType:*(void *)&a3 version:*(void *)&a4.var0 & 0xFFFFFFFFFFFFLL configuration:a5];
  if (result) {
    return -12780;
  }
  return result;
}

- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4
{
  id v4 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", a3, a4);
  return (id)[v4 preparedPixelBufferPool];
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  if ([(BWInferenceEngine *)self->_inferenceEngine isConfiguredForInference])
  {
    [(BWInferenceEngine *)self->_inferenceEngine setBackPressureDrivenPipelining:self->_backPressureDrivenPipelining];
    if ([(BWInferenceEngine *)self->_inferenceEngine prepareForInferenceWithFormatProvider:self pixelBufferPoolProvider:self])
    {

      self->_inferenceEngine = 0;
    }
    else if (![(BWFigVideoCaptureDevice *)self->_captureDevice attachesUprightExifOrientationMetadataToStreamingFrames])
    {
      [(BWFigVideoCaptureDevice *)self->_captureDevice setAttachesUprightExifOrientationMetadataToStreamingFrames:[(BWInferenceEngine *)self->_inferenceEngine requiresDeviceOrientationMetadata]];
    }
  }
}

- (void)setPostprocessFilter:(id)a3
{
}

- (void)setPassthroughInputSampleBuffer:(BOOL)a3
{
  self->_passthroughInputSampleBuffer = a3;
}

- (void)setApplyRecommendedMasterPortType:(BOOL)a3
{
  self->_applyRecommendedMasterPortType = a3;
}

- (void)setInferenceTypesToSkipResolver:(id)a3
{
}

- (void)setBackPressureDrivenPipelining:(BOOL)a3
{
  self->_backPressureDrivenPipelining = a3;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v6 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53000], 0);
  v7 = v6;
  if (v6) {
    dispatch_group_enter(v6);
  }
  if (a3) {
    objc_super v8 = CFRetain(a3);
  }
  else {
    objc_super v8 = 0;
  }
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    CFTypeRef v9 = CMGetAttachment(a3, @"FileWriterAction", 0);
    CFTypeRef v10 = CMGetAttachment(a3, @"RecordingSettings", 0);
    if (v10)
    {
      if (v9)
      {
        uint64_t v11 = (void *)v10;
        if (CFEqual(v9, @"Start"))
        {
          if ([v11 personSegmentationRenderingEnabled]) {
            uint64_t v12 = 0;
          }
          else {
            uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EFB01A60, &unk_1EFB01A78, 0);
          }
          [(BWInferenceNode *)self setInferencesToSkip:v12];
        }
      }
    }
    goto LABEL_47;
  }
  if (self->_applyRecommendedMasterPortType)
  {
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, @"SynchronizedSlaveFrame");
    if (AttachedMedia)
    {
      v14 = AttachedMedia;
      uint64_t v15 = objc_msgSend((id)CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]);
      id v16 = (NSString *)CMGetAttachment(a3, @"RecommendedMasterPortType", 0);
      if (v16)
      {
        recommendedMasterPortType = v16;
      }
      else
      {
        v18 = (NSString *)CMGetAttachment(v14, @"RecommendedMasterPortType", 0);
        if (v18) {
          recommendedMasterPortType = v18;
        }
        else {
          recommendedMasterPortType = self->_recommendedMasterPortType;
        }
      }
      v19 = self->_recommendedMasterPortType;
      if (recommendedMasterPortType != v19)
      {

        recommendedMasterPortType = recommendedMasterPortType;
        self->_recommendedMasterPortType = recommendedMasterPortType;
      }
      if ([(NSString *)recommendedMasterPortType isEqualToString:v15]) {
        goto LABEL_26;
      }
      BWSampleBufferRemoveAllAttachedMedia(a3);
    }
  }
  v14 = a3;
LABEL_26:
  if (v8) {
    CFRelease(v8);
  }
  objc_super v8 = -[BWInferenceNode createOutputSampleBufferFromInput:]((CMSampleBufferRef)self, v14);
  inferenceEngine = self->_inferenceEngine;
  if (inferenceEngine && [(BWInferenceEngine *)inferenceEngine isConfiguredForInference])
  {
    uint64_t v21 = (void *)[MEMORY[0x1E4F1CAD0] set];
    inferenceTypesToSkipResolver = (uint64_t (**)(id, opaqueCMSampleBuffer *))self->_inferenceTypesToSkipResolver;
    if (inferenceTypesToSkipResolver) {
      uint64_t v21 = objc_msgSend(v21, "setByAddingObjectsFromSet:", inferenceTypesToSkipResolver[2](inferenceTypesToSkipResolver, v14));
    }
    os_unfair_lock_lock(&self->_inferenceTypesToSkipLock);
    v23 = (void *)[v21 setByAddingObjectsFromSet:self->_inferenceTypesToSkip];
    os_unfair_lock_unlock(&self->_inferenceTypesToSkipLock);
    [v23 count];
    if (![(BWInferenceEngine *)self->_inferenceEngine performInferencesOnSampleBuffer:v14 attachingResultsToSampleBuffer:v8 skippingInferencesWithTypes:v23])
    {
      if (self->_awaitAsynchronousOutputs)
      {
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        v24 = [(BWInferenceEngine *)self->_inferenceEngine providedVideoRequirementsByAttachedMediaKey];
        uint64_t v25 = [(NSDictionary *)v24 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v35 != v27) {
                objc_enumerationMutation(v24);
              }
              v29 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v8, *(void *)(*((void *)&v34 + 1) + 8 * i));
              ImageBuffer = CMSampleBufferGetImageBuffer(v29);
              if (ImageBuffer)
              {
                IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
                if (IOSurface)
                {
                  v32 = IOSurface;
                  IOSurfaceLock(IOSurface, 5u, 0);
                  IOSurfaceUnlock(v32, 5u, 0);
                }
              }
            }
            uint64_t v26 = [(NSDictionary *)v24 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v26);
        }
      }
      postprocessFilter = (uint64_t (**)(id, opaqueCMSampleBuffer *, const void *))self->_postprocessFilter;
      if (postprocessFilter && (postprocessFilter[2](postprocessFilter, v14, v8) & 1) == 0)
      {
        if (v8)
        {
          CFRelease(v8);
          objc_super v8 = 0;
        }
      }
      else
      {
        [(BWInferenceNode *)self willEmitSampleBuffer:v8];
      }
    }
  }
LABEL_47:
  [(BWInferenceNode *)self willEmitSampleBufferAlways:v8];
  if (v7) {
    dispatch_group_leave(v7);
  }
  if (v8)
  {
    [(BWNodeOutput *)[(BWNode *)self output] emitSampleBuffer:v8];
    CFRelease(v8);
  }
}

- (CMSampleBufferRef)createOutputSampleBufferFromInput:(CMSampleBufferRef)result
{
  if (result)
  {
    CMSampleBufferRef v3 = 0;
    if (*((unsigned char *)result + 144))
    {
      if (sbuf) {
        return (CMSampleBufferRef)CFRetain(sbuf);
      }
      else {
        return 0;
      }
    }
    else
    {
      memset(&sampleTimingArray.presentationTimeStamp, 0, 48);
      *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1F9F8];
      sampleTimingArray.duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.presentationTimeStamp, sbuf);
      sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
      CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, &v3);
      return v3;
    }
  }
  return result;
}

- (void)setIgnoreInvalidContentInformationForPrimaryMedia:(BOOL)a3
{
  self->_ignoreInvalidContentInformationForPrimaryMedia = a3;
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  return 0;
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  id v3 = [(BWNodeInput *)self->super._input mediaPropertiesForAttachedMediaKey:a3];
  return (id)[v3 resolvedVideoFormat];
}

- (id)inputInferenceVideoFormatForAttachedMediaKey:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (!self->_ignoreInvalidContentInformationForPrimaryMedia
    || ![a3 isEqualToString:@"PrimaryFormat"])
  {
    return 0;
  }
  id result = (id)objc_msgSend(-[BWNodeInput mediaPropertiesForAttachedMediaKey:](self->super._input, "mediaPropertiesForAttachedMediaKey:", a3), "resolvedVideoFormat");
  if (result)
  {
    v6 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWInferenceVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", [result pixelBufferAttributes]);
    [(BWInferenceVideoFormatRequirements *)v6 setIncludesInvalidContent:0];
    v7[0] = v6;
    return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1]);
  }
  return result;
}

+ (void)initialize
{
}

- (void)dealloc
{
  -[BWInferenceNode _releaseResources]((id *)&self->super.super.isa);

  v3.receiver = self;
  v3.super_class = (Class)BWInferenceNode;
  [(BWNode *)&v3 dealloc];
}

- (void)_releaseResources
{
  if (a1)
  {

    a1[12] = 0;
    a1[15] = 0;

    a1[17] = 0;
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if (self->_releasesResourcesAtEndOfData) {
    -[BWInferenceNode _releaseResources]((id *)&self->super.super.isa);
  }
  v5.receiver = self;
  v5.super_class = (Class)BWInferenceNode;
  [(BWNode *)&v5 didReachEndOfDataForInput:a3];
}

- (NSString)description
{
  objc_super v3 = [(BWNode *)self name];
  if (v3 && [(NSString *)v3 length]) {
    return (NSString *)[NSString stringWithFormat:@"<%@: %p>", -[BWNode name](self, "name"), self];
  }
  v5.receiver = self;
  v5.super_class = (Class)BWInferenceNode;
  return [(BWNode *)&v5 description];
}

- (id)nodeSubType
{
  return @"InferenceProducer";
}

- (int)addInferenceOfType:(int)a3 version:(id)a4
{
  uint64_t v4 = *(void *)&a4.var0;
  uint64_t v5 = *(void *)&a3;
  v7 = [[BWInferenceConfiguration alloc] initWithInferenceType:0];
  return [(BWInferenceNode *)self addInferenceOfType:v5 version:v4 & 0xFFFFFFFFFFFFLL configuration:v7];
}

- (BOOL)awaitAsynchronousOutputs
{
  return self->_awaitAsynchronousOutputs;
}

- (void)setAwaitAsynchronousOutputs:(BOOL)a3
{
  self->_awaitAsynchronousOutputs = a3;
}

- (BOOL)applyRecommendedMasterPortType
{
  return self->_applyRecommendedMasterPortType;
}

- (id)inputFormatForAttachedMediaKey:(id)a3
{
  id v3 = [(BWNodeInput *)self->super._input mediaPropertiesForAttachedMediaKey:a3];
  return (id)[v3 resolvedFormat];
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

- (BOOL)passthroughInputSampleBuffer
{
  return self->_passthroughInputSampleBuffer;
}

- (BOOL)ignoreInvalidContentInformationForPrimaryMedia
{
  return self->_ignoreInvalidContentInformationForPrimaryMedia;
}

- (int)additionalOutputPoolRetainedBufferCount
{
  return self->_additionalOutputPoolRetainedBufferCount;
}

- (void)setAdditionalOutputPoolRetainedBufferCount:(int)a3
{
  self->_additionalOutputPoolRetainedBufferCount = a3;
}

- (BOOL)backPressureDrivenPipelining
{
  return self->_backPressureDrivenPipelining;
}

- (id)inferenceTypesToSkipResolver
{
  return self->_inferenceTypesToSkipResolver;
}

- (id)postprocessFilter
{
  return self->_postprocessFilter;
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