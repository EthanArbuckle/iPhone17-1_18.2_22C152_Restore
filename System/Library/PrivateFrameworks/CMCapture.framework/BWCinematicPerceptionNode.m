@interface BWCinematicPerceptionNode
+ (void)initialize;
- (BOOL)_attachISPDetectionsFromSampleBuffer:(void *)a3 toTrackingInput:(uint64_t)a4 withFrameTimestamp:;
- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3;
- (BWCinematicPerceptionNode)initWithConvEngineSupportWithCaptureDevice:(id)a3 scheduler:(id)a4 priority:(unsigned int)a5 depthInferenceEnabled:(BOOL)a6;
- (BWVideoDepthInferenceConfiguration)videoDepthConfiguration;
- (id)inputVideoFormatForAttachedMediaKey:(id)a3;
- (id)nodeSubType;
- (id)nodeType;
- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)willEmitSampleBufferAlways:(opaqueCMSampleBuffer *)a3;
@end

@implementation BWCinematicPerceptionNode

+ (void)initialize
{
}

- (BWCinematicPerceptionNode)initWithConvEngineSupportWithCaptureDevice:(id)a3 scheduler:(id)a4 priority:(unsigned int)a5 depthInferenceEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  v38[1] = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)BWCinematicPerceptionNode;
  v8 = [(BWInferenceNode *)&v33 initWithConvEngineSupportWithCaptureDevice:a3 scheduler:a4 priority:*(void *)&a5];
  v9 = v8;
  if (v8)
  {
    v8->_framesSinceLastDDR = 5;
    v10 = [[BWInferenceConfiguration alloc] initWithInferenceType:150];
    [(BWInferenceConfiguration *)v10 setPriority:6];
    if (![(BWInferenceNode *)v9 addInferenceOfType:150 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:v10]&& ![(BWInferenceNode *)v9 addInferenceOfType:151 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:[[BWInferenceConfiguration alloc] initWithInferenceType:151]])
    {
      v9->_humanPosePreventionSet = (NSSet *)(id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EFB019D0, 0);
      v11 = dispatch_semaphore_create(0);
      dispatch_semaphore_signal(v11);
      dispatch_semaphore_signal(v11);
      v9->_backpressureSemaphore = (OS_dispatch_semaphore *)v11;
      v9->_backpressureEvent = (MTLEvent *)[(BWInferenceEngine *)[(BWInferenceNode *)v9 inferenceEngine] newMetalEvent];
      v9->_backpressureEventNumber = 0;
      v9->_videoDepthConfiguration = [[BWVideoDepthInferenceConfiguration alloc] initWithConcurrencyWidth:2 videoDepthLayout:0 captureDevice:a3 backpressureEvent:v9->_backpressureEvent];
      v9->_depthInferenceEnabled = v6;
      if (v6)
      {
        uint64_t v12 = 2
            * [(BWVideoDepthInferenceConfiguration *)v9->_videoDepthConfiguration concurrencyWidth];
        v13 = objc_alloc_init(BWNodeInputMediaConfiguration);
        [(BWNodeInputMediaConfiguration *)v13 setRetainedBufferCount:2];
        [(BWNodeInputMediaConfiguration *)v13 setPassthroughMode:0];
        [(BWNodeInput *)v9->super.super._input setMediaConfiguration:v13 forAttachedMediaKey:@"SynchronizedSlaveFrame"];
        v14 = objc_alloc_init(BWVideoFormatRequirements);
        v38[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BWVideoDepthInferenceConfiguration outputPixelFormat](v9->_videoDepthConfiguration, "outputPixelFormat"));
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v14, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1]);
        [(BWVideoFormatRequirements *)v14 setWidth:(int)[(BWVideoDepthInferenceConfiguration *)v9->_videoDepthConfiguration outputDimensions]];
        [(BWVideoFormatRequirements *)v14 setHeight:[(BWVideoDepthInferenceConfiguration *)v9->_videoDepthConfiguration outputDimensions] >> 32];
        v15 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        [(BWNodeOutputMediaConfiguration *)v15 setPassthroughMode:0];
        [(BWNodeOutputMediaConfiguration *)v15 setProvidesPixelBufferPool:1];
        [(BWNodeOutputMediaConfiguration *)v15 setOwningNodeRetainedBufferCount:v12];
        [(BWNodeOutputMediaConfiguration *)v15 setFormatRequirements:v14];
        [(BWNodeOutput *)v9->super.super._output setMediaConfiguration:v15 forAttachedMediaKey:@"Depth"];
        uint64_t v16 = [(BWVideoDepthInferenceConfiguration *)v9->_videoDepthConfiguration featuresDimensions];
        v17 = objc_alloc_init(BWVideoFormatRequirements);
        uint64_t v37 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BWVideoDepthInferenceConfiguration featuresPixelFormat](v9->_videoDepthConfiguration, "featuresPixelFormat"));
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v17, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1]);
        [(BWVideoFormatRequirements *)v17 setWidth:(int)v16];
        [(BWVideoFormatRequirements *)v17 setHeight:v16 >> 32];
        v36 = v17;
        v9->_disparityFeaturesVideoFormat = (BWVideoFormat *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1]);
        uint64_t v18 = (int)v12;
        v9->_disparityFeaturesPool = [[BWPixelBufferPool alloc] initWithVideoFormat:v9->_disparityFeaturesVideoFormat capacity:(int)v12 name:@"FusionTrackerNodeDisparityFeaturesPool" memoryPool:[(BWNodeOutput *)v9->super.super._output memoryPool]];
        [(BWVideoDepthInferenceConfiguration *)v9->_videoDepthConfiguration featuresPixelFormat];
        v9->_initialDisparityFeaturesPixelBuffer = (__CVBuffer *)CreatePixelBuffer();
        v9->_previousDisparityFeaturesSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
        v19 = [(BWVideoDepthInferenceConfiguration *)v9->_videoDepthConfiguration stereoV2inferenceDescriptor];
        objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor colorFeaturesOutput](v19, "colorFeaturesOutput"), "imageDescriptor"), "sizeForLayout:", 255);
        double v21 = v20;
        double v23 = v22;
        uint64_t v24 = objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor colorFeaturesOutput](v19, "colorFeaturesOutput"), "imageDescriptor"), "pixelFormat");
        v25 = objc_alloc_init(BWVideoFormatRequirements);
        uint64_t v35 = [NSNumber numberWithUnsignedInt:v24];
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v25, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1]);
        [(BWVideoFormatRequirements *)v25 setWidth:(unint64_t)v21];
        [(BWVideoFormatRequirements *)v25 setHeight:(unint64_t)v23];
        v34 = v25;
        v9->_colorFeaturesVideoFormat = (BWVideoFormat *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1]);
        v9->_colorFeaturesPool = [[BWPixelBufferPool alloc] initWithVideoFormat:v9->_colorFeaturesVideoFormat capacity:v18 name:@"FusionTrackerNodeColorFeaturesPool" memoryPool:[(BWNodeOutput *)v9->super.super._output memoryPool]];
        v9->_initialColorFeaturesPixelBuffer = (__CVBuffer *)CreatePixelBuffer();
        v9->_previousColorFeaturesSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
        objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor temporalSmoothingCurrentFeaturesRatioMinInput](v19, "temporalSmoothingCurrentFeaturesRatioMinInput"), "imageDescriptor"), "pixelFormat");
        objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor temporalSmoothingCurrentFeaturesRatioMinInput](v19, "temporalSmoothingCurrentFeaturesRatioMinInput"), "imageDescriptor"), "sizeForLayout:", 255);
        objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor temporalSmoothingPreviousFeaturesRatioMinInput](v19, "temporalSmoothingPreviousFeaturesRatioMinInput"), "imageDescriptor"), "pixelFormat");
        objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor temporalSmoothingPreviousFeaturesRatioMinInput](v19, "temporalSmoothingPreviousFeaturesRatioMinInput"), "imageDescriptor"), "sizeForLayout:", 255);
        v9->_currentFeaturesMinPixelBuffer = (__CVBuffer *)CreatePixelBuffer();
        v9->_previousFeaturesMinPixelBuffer = (__CVBuffer *)CreatePixelBuffer();
        v9->_currentFeaturesMinSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
        v9->_previousFeaturesMinSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
        CVPixelBufferLockBaseAddress(v9->_currentFeaturesMinPixelBuffer, 0);
        *(_WORD *)CVPixelBufferGetBaseAddress(v9->_currentFeaturesMinPixelBuffer) = 13517;
        CVPixelBufferUnlockBaseAddress(v9->_currentFeaturesMinPixelBuffer, 0);
        CVPixelBufferLockBaseAddress(v9->_previousFeaturesMinPixelBuffer, 0);
        *(_WORD *)CVPixelBufferGetBaseAddress(v9->_previousFeaturesMinPixelBuffer) = 0;
        CVPixelBufferUnlockBaseAddress(v9->_previousFeaturesMinPixelBuffer, 0);
        uint64_t Major = BWInferenceVersionMakeMajor(1);
        videoDepthConfiguration = v9->_videoDepthConfiguration;
        uint64_t v28 = Major & 0xFFFFFFFFFFFFLL;
        v29 = v9;
        uint64_t v30 = 111;
      }
      else
      {
        v31 = [(BWInferenceConfiguration *)[BWOpticalFlowInferenceConfiguration alloc] initWithInferenceType:117];
        [(BWOpticalFlowInferenceConfiguration *)v31 setInputDimensions:[(BWVideoDepthInferenceConfiguration *)v9->_videoDepthConfiguration inputDimensions]];
        [(BWOpticalFlowInferenceConfiguration *)v31 setOutputDimensions:[(BWVideoDepthInferenceConfiguration *)v9->_videoDepthConfiguration outputDimensions]];
        [(BWOpticalFlowInferenceConfiguration *)v31 setConcurrencyWidth:2];
        [(BWOpticalFlowInferenceConfiguration *)v31 setAttachedMediaKeyForPropagatedColorInput:0x1EFA6A600];
        [(BWOpticalFlowInferenceConfiguration *)v31 setPortType:[(BWVideoDepthInferenceConfiguration *)v9->_videoDepthConfiguration portType]];
        [(BWOpticalFlowInferenceConfiguration *)v31 setForceIntermediateDimensions:0x17000000290];
        uint64_t v28 = BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL;
        v29 = v9;
        uint64_t v30 = 117;
        videoDepthConfiguration = v31;
      }
      [(BWInferenceNode *)v29 addInferenceOfType:v30 version:v28 configuration:videoDepthConfiguration];
    }
  }
  return v9;
}

- (void)dealloc
{
  depthFormatDescription = self->_depthFormatDescription;
  if (depthFormatDescription) {
    CFRelease(depthFormatDescription);
  }
  initialColorFeaturesPixelBuffer = self->_initialColorFeaturesPixelBuffer;
  if (initialColorFeaturesPixelBuffer) {
    CFRelease(initialColorFeaturesPixelBuffer);
  }
  initialDisparityFeaturesPixelBuffer = self->_initialDisparityFeaturesPixelBuffer;
  if (initialDisparityFeaturesPixelBuffer) {
    CFRelease(initialDisparityFeaturesPixelBuffer);
  }
  previousColorFeaturesSampleBuffer = self->_previousColorFeaturesSampleBuffer;
  if (previousColorFeaturesSampleBuffer) {
    CFRelease(previousColorFeaturesSampleBuffer);
  }
  previousDisparityFeaturesSampleBuffer = self->_previousDisparityFeaturesSampleBuffer;
  if (previousDisparityFeaturesSampleBuffer) {
    CFRelease(previousDisparityFeaturesSampleBuffer);
  }
  currentFeaturesMinPixelBuffer = self->_currentFeaturesMinPixelBuffer;
  if (currentFeaturesMinPixelBuffer) {
    CFRelease(currentFeaturesMinPixelBuffer);
  }
  previousFeaturesMinPixelBuffer = self->_previousFeaturesMinPixelBuffer;
  if (previousFeaturesMinPixelBuffer) {
    CFRelease(previousFeaturesMinPixelBuffer);
  }
  currentFeaturesMinSampleBuffer = self->_currentFeaturesMinSampleBuffer;
  if (currentFeaturesMinSampleBuffer) {
    CFRelease(currentFeaturesMinSampleBuffer);
  }
  previousFeaturesMinSampleBuffer = self->_previousFeaturesMinSampleBuffer;
  if (previousFeaturesMinSampleBuffer) {
    CFRelease(previousFeaturesMinSampleBuffer);
  }
  v12.receiver = self;
  v12.super_class = (Class)BWCinematicPerceptionNode;
  [(BWInferenceNode *)&v12 dealloc];
}

- (id)nodeType
{
  return @"Inference";
}

- (id)nodeSubType
{
  return @"FusionTracker";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v4.receiver = self;
  v4.super_class = (Class)BWCinematicPerceptionNode;
  [(BWInferenceNode *)&v4 prepareForCurrentConfigurationToBecomeLive];
  v3 = (void *)[objc_alloc((Class)getFTCinematicConfigClass()) init];
  self->_cinematicTracker = (FTCinematicTracker *)[objc_alloc((Class)getFTCinematicTrackerClass()) initWithConfig:v3];
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if ([a5 isEqualToString:@"SynchronizedSlaveFrame"])
  {
    v9 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWInferenceVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", [a3 pixelBufferAttributes]);
    v13[0] = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v9, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1]);
    [(BWInferenceVideoFormatRequirements *)v9 setIncludesInvalidContent:0];
    objc_super v12 = v9;
    v11.receiver = self;
    v11.super_class = (Class)BWCinematicPerceptionNode;
    -[BWInferenceEngine prepareForInputInferenceVideoFormat:attachedMediaKey:](-[BWInferenceNode inferenceEngine](&v11, sel_inferenceEngine), "prepareForInputInferenceVideoFormat:attachedMediaKey:", +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1]), @"SynchronizedSlaveFrame");
  }
  v10.receiver = self;
  v10.super_class = (Class)BWCinematicPerceptionNode;
  [(BWInferenceNode *)&v10 didSelectFormat:a3 forInput:a4 forAttachedMediaKey:a5];
}

- (BOOL)_attachISPDetectionsFromSampleBuffer:(void *)a3 toTrackingInput:(uint64_t)a4 withFrameTimestamp:
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v7 = a1;
  id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8 = objc_msgSend((id)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53DC8]);
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v8;
  uint64_t v47 = [v8 countByEnumeratingWithState:&v63 objects:v68 count:16];
  if (!v47) {
    goto LABEL_44;
  }
  uint64_t v34 = v7;
  uint64_t v35 = a3;
  int v9 = 0;
  uint64_t v45 = *MEMORY[0x1E4F538F8];
  uint64_t v46 = *(void *)v64;
  uint64_t v43 = *MEMORY[0x1E4F538E0];
  uint64_t v44 = *MEMORY[0x1E4F538C8];
  uint64_t v41 = *MEMORY[0x1E4F538D0];
  uint64_t v42 = *MEMORY[0x1E4F538C0];
  uint64_t v39 = *MEMORY[0x1E4F538A8];
  uint64_t v40 = *MEMORY[0x1E4F538A0];
  uint64_t v37 = *MEMORY[0x1E4F538B8];
  uint64_t v38 = *MEMORY[0x1E4F538B0];
  uint64_t v36 = *MEMORY[0x1E4F538F0];
  uint64_t v10 = *MEMORY[0x1E4F54180];
  uint64_t v54 = *MEMORY[0x1E4F53888];
  uint64_t v55 = *MEMORY[0x1E4F53D80];
  uint64_t v50 = *MEMORY[0x1E4F53E70];
  uint64_t v52 = *MEMORY[0x1E4F53890];
  uint64_t v11 = MEMORY[0x1E4F1DB20];
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v64 != v46) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v63 + 1) + 8 * v12);
      id v51 = (id)objc_msgSend((id)objc_msgSend(obj, "objectForKeyedSubscript:", v13, v34), "objectForKeyedSubscript:", v45);
      uint64_t v49 = v12;
      if ([v13 isEqualToString:v44])
      {
        uint64_t v14 = 1002;
      }
      else if ([v13 isEqualToString:v43])
      {
        uint64_t v14 = 1001;
      }
      else if ([v13 isEqualToString:v42])
      {
        uint64_t v14 = 1000;
      }
      else if ([v13 isEqualToString:v41])
      {
        uint64_t v14 = 1003;
      }
      else if ([v13 isEqualToString:v40])
      {
        uint64_t v14 = 2000;
      }
      else if ([v13 isEqualToString:v39])
      {
        uint64_t v14 = 2001;
      }
      else if ([v13 isEqualToString:v38])
      {
        uint64_t v14 = 3000;
      }
      else if ([v13 isEqualToString:v37])
      {
        uint64_t v14 = 3001;
      }
      else
      {
        if (([v13 isEqualToString:v36] & 1) == 0)
        {
          [v51 count];
          goto LABEL_38;
        }
        uint64_t v14 = 42001;
      }
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      uint64_t v15 = [v51 countByEnumeratingWithState:&v59 objects:v67 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v60 != v17) {
              objc_enumerationMutation(v51);
            }
            v19 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            CFDictionaryRef v20 = (const __CFDictionary *)[v19 objectForKeyedSubscript:v10];
            CGSize v21 = *(CGSize *)(v11 + 16);
            rect.origin = *(CGPoint *)v11;
            rect.size = v21;
            if (v20)
            {
              CGRectMakeWithDictionaryRepresentation(v20, &rect);
              objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", v55), "floatValue");
              float v23 = v22;
              uint64_t v24 = (void *)[v19 objectForKeyedSubscript:v54];
              if (v24 || (uint64_t v24 = (void *)[v19 objectForKeyedSubscript:v50]) != 0)
              {
                float v25 = v23 / 1000.0;
                uint64_t v26 = [v24 unsignedIntegerValue];
                int v27 = objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", v52), "intValue");
                if (v27 > v9) {
                  int v9 = v27;
                }
                uint64_t v28 = [BWFusionTrackerObservable alloc];
                long long v56 = *(_OWORD *)a4;
                uint64_t v57 = *(void *)(a4 + 16);
                v29 = -[BWFusionTrackerObservable initWithKind:box:confidence:timestamp:identifier:metadata:](v28, v14, &v56, v26, v19, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v25);
                [v53 addObject:v29];
              }
            }
          }
          uint64_t v16 = [v51 countByEnumeratingWithState:&v59 objects:v67 count:16];
        }
        while (v16);
      }
LABEL_38:
      uint64_t v12 = v49 + 1;
    }
    while (v49 + 1 != v47);
    uint64_t v30 = [obj countByEnumeratingWithState:&v63 objects:v68 count:16];
    uint64_t v47 = v30;
  }
  while (v30);
  uint64_t v7 = v34;
  a3 = v35;
  if (v9 >= 1)
  {
    [v35 setDetectorDidRun:1];
    unint64_t v31 = 0;
    *(void *)(v34 + 176) = 0;
    goto LABEL_46;
  }
LABEL_44:
  unint64_t v31 = *(void *)(v7 + 176);
  if (v31 >= 5)
  {
    [a3 setDetectorDidRun:1];
    unint64_t v31 = *(void *)(v7 + 176) % 5uLL;
    *(void *)(v7 + 176) = v31;
  }
LABEL_46:
  BOOL v32 = v31 == 4;
  [a3 setObservations:v53];

  return v32;
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  ++self->_framesSinceLastDDR;
  v4.receiver = self;
  v4.super_class = (Class)BWCinematicPerceptionNode;
  [(BWNode *)&v4 handleDroppedSample:a3 forInput:a4];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v7 = (void *)[objc_alloc((Class)getFTCinematicInputClass()) init];
  CMTime v27 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CFDictionaryRef v8 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F530C0], 0);
  if (v8) {
    CMTimeMakeFromDictionary(&v27, v8);
  }
  else {
    CMSampleBufferGetPresentationTimeStamp(&v27, a3);
  }
  int v9 = (void *)CMGetAttachment(a3, @"CinematicVideoFocusRequest", 0);
  if (v9)
  {
    uint64_t v10 = v9;
    if ((BWIsFocusRequestForFixedPlaneFocus(v9) & 1) == 0)
    {
      uint64_t v11 = BWCreateFTCinematicTapRequestFromFocusRequest(v10);
      [v7 setTapRequest:v11];
    }
  }
  CMTime v26 = v27;
  [v7 setSourceFrameTimestamp:&v26];
  CMTime v25 = v27;
  BOOL v12 = -[BWCinematicPerceptionNode _attachISPDetectionsFromSampleBuffer:toTrackingInput:withFrameTimestamp:]((uint64_t)self, a3, v7, (uint64_t)&v25);
  CMSetAttachment(a3, @"FusionTrackerInput", (CFTypeRef)[(FTCinematicTracker *)self->_cinematicTracker computeTrackingStateForInput:v7], 1u);
  CMSetAttachment(a3, @"FTDetectorWillRun", (CFTypeRef)[NSNumber numberWithBool:v12], 1u);

  if (v12)
  {
    v24.receiver = self;
    v24.super_class = (Class)BWCinematicPerceptionNode;
    -[BWInferenceNode setInferencesToSkip:](&v24, sel_setInferencesToSkip_, [MEMORY[0x1E4F1CAD0] set]);
  }
  else
  {
    humanPosePreventionSet = self->_humanPosePreventionSet;
    v23.receiver = self;
    v23.super_class = (Class)BWCinematicPerceptionNode;
    [(BWInferenceNode *)&v23 setInferencesToSkip:humanPosePreventionSet];
  }
  dispatch_time_t v14 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_backpressureSemaphore, v14);
  id v15 = [(BWInferenceEngine *)[(BWInferenceNode *)self inferenceEngine] metalCommandBuffer];
  uint64_t v16 = v15;
  if (self->_depthInferenceEnabled)
  {
    if (!self->_previousColorFeaturesSampleBuffer) {
      self->_previousColorFeaturesSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
    }
    previousDisparityFeaturesSampleBuffer = self->_previousDisparityFeaturesSampleBuffer;
    if (!previousDisparityFeaturesSampleBuffer)
    {
      previousDisparityFeaturesSampleBuffer = (opaqueCMSampleBuffer *)CreateSampleBuffer();
      self->_previousDisparityFeaturesSampleBuffer = previousDisparityFeaturesSampleBuffer;
    }
    BWSampleBufferSetAttachedMedia(a3, @"depthFeaturesIn", (uint64_t)previousDisparityFeaturesSampleBuffer);
    BWSampleBufferSetAttachedMedia(a3, @"colorFeaturesIn", (uint64_t)self->_previousColorFeaturesSampleBuffer);
    BWSampleBufferSetAttachedMedia(a3, @"currentFeaturesMin", (uint64_t)self->_currentFeaturesMinSampleBuffer);
    BWSampleBufferSetAttachedMedia(a3, @"previousFeaturesMin", (uint64_t)self->_previousFeaturesMinSampleBuffer);
    previousColorFeaturesSampleBuffer = self->_previousColorFeaturesSampleBuffer;
    if (previousColorFeaturesSampleBuffer)
    {
      CFRelease(previousColorFeaturesSampleBuffer);
      self->_previousColorFeaturesSampleBuffer = 0;
    }
    v19 = self->_previousDisparityFeaturesSampleBuffer;
    if (v19)
    {
      CFRelease(v19);
      self->_previousDisparityFeaturesSampleBuffer = 0;
    }
  }
  else
  {
    [v15 encodeWaitForEvent:self->_backpressureEvent value:self->_backpressureEventNumber];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __57__BWCinematicPerceptionNode_renderSampleBuffer_forInput___block_invoke;
    v22[3] = &unk_1E5C2CA58;
    v22[4] = self;
    [v16 addCompletedHandler:v22];
    CMSetAttachment(a3, @"CinematicInferencesBackpressureEventNumber", (CFTypeRef)[NSNumber numberWithUnsignedLongLong:self->_backpressureEventNumber], 1u);
    ++self->_backpressureEventNumber;
  }
  v21.receiver = self;
  v21.super_class = (Class)BWCinematicPerceptionNode;
  [(BWInferenceNode *)&v21 renderSampleBuffer:a3 forInput:a4];
  if (self->_depthInferenceEnabled)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__BWCinematicPerceptionNode_renderSampleBuffer_forInput___block_invoke_2;
    v20[3] = &unk_1E5C2CA58;
    v20[4] = self;
    [v16 addCompletedHandler:v20];
  }
  [v16 commit];
  ++self->_framesSinceLastDDR;
}

intptr_t __57__BWCinematicPerceptionNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 200));
}

intptr_t __57__BWCinematicPerceptionNode_renderSampleBuffer_forInput___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 200));
}

- (void)willEmitSampleBufferAlways:(opaqueCMSampleBuffer *)a3
{
  CMAttachmentBearerRef target = 0;
  if (!self->_depthInferenceEnabled) {
    goto LABEL_14;
  }
  memset(&v17, 0, sizeof(v17));
  CMSampleBufferGetPresentationTimeStamp(&v17, a3);
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, @"Depth");
  if (AttachedMedia)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
    CMTime v16 = v17;
    if (BWSampleBufferCreateFromPixelBuffer(ImageBuffer, (uint64_t)&v16, (CFTypeRef *)&self->_depthFormatDescription, (CMSampleBufferRef *)&target))goto LABEL_11; {
LABEL_7:
    }
    CFStringRef v10 = (const __CFString *)*MEMORY[0x1E4F53070];
    uint64_t v11 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    BOOL v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]), *MEMORY[0x1E4F54128]);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(v11, "objectForKeyedSubscript:", @"MirroredHorizontal"), @"MirroredHorizontal");
    CMSetAttachment(target, v10, v12, 1u);

    BWSampleBufferSetAttachedMedia(a3, @"Depth", (uint64_t)target);
    v13 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, @"depthFeaturesOut");
    self->_previousDisparityFeaturesSampleBuffer = v13;
    if (v13) {
      CFRetain(v13);
    }
    dispatch_time_t v14 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, @"colorFeaturesOut");
    self->_previousColorFeaturesSampleBuffer = v14;
    if (v14) {
      CFRetain(v14);
    }
    goto LABEL_11;
  }
  uint64_t v7 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(-[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super.super._output, "mediaPropertiesForAttachedMediaKey:", @"Depth"), "livePixelBufferPool"), "newPixelBuffer");
  if (v7)
  {
    CFDictionaryRef v8 = v7;
    CMTime v16 = v17;
    int v9 = BWSampleBufferCreateFromPixelBuffer(v7, (uint64_t)&v16, (CFTypeRef *)&self->_depthFormatDescription, (CMSampleBufferRef *)&target);
    CFRelease(v8);
    if (!v9) {
      goto LABEL_7;
    }
  }
LABEL_11:
  if (self->_depthInferenceEnabled)
  {
    BWSampleBufferRemoveAttachedMedia(a3, @"espressoOutput");
    BWSampleBufferRemoveAttachedMedia(a3, @"colorFeaturesIn");
    BWSampleBufferRemoveAttachedMedia(a3, @"colorFeaturesOut");
    BWSampleBufferRemoveAttachedMedia(a3, @"depthFeaturesIn");
    BWSampleBufferRemoveAttachedMedia(a3, @"depthFeaturesOut");
    BWSampleBufferRemoveAttachedMedia(a3, @"refIntermediate");
    BWSampleBufferRemoveAttachedMedia(a3, @"auxIntermediate");
    BWSampleBufferRemoveAttachedMedia(a3, @"currentFeaturesMin");
    BWSampleBufferRemoveAttachedMedia(a3, @"previousFeaturesMin");
    BWSampleBufferRemoveAttachedMedia(a3, @"SynchronizedSlaveFrame");
    if (target) {
      CFRelease(target);
    }
  }
LABEL_14:
  id v15 = (void *)CMGetAttachment(a3, @"FusionTrackerInput", 0);
  if ((objc_msgSend((id)objc_msgSend(v15, "highPriorityTrackerState"), "completed") & 1) == 0) {
    objc_msgSend((id)objc_msgSend(v15, "highPriorityTrackerState"), "abort");
  }
  CMSetAttachment(a3, @"FTCinematicTrackingResult", (CFTypeRef)[v15 commit], 1u);
}

- (BOOL)intermediateResourceTrackingAllowedForAttachedMediaKey:(id)a3
{
  if ([a3 isEqualToString:@"PrimaryFormat"]) {
    return 1;
  }
  return [a3 isEqualToString:@"SynchronizedSlaveFrame"];
}

- (id)inputVideoFormatForAttachedMediaKey:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  if (([a3 isEqualToString:@"colorFeaturesIn"] & 1) != 0
    || [a3 isEqualToString:@"colorFeaturesOut"])
  {
    uint64_t v5 = 248;
    return *(Class *)((char *)&self->super.super.super.isa + v5);
  }
  if (([a3 isEqualToString:@"depthFeaturesIn"] & 1) != 0
    || [a3 isEqualToString:@"depthFeaturesOut"])
  {
    uint64_t v5 = 240;
    return *(Class *)((char *)&self->super.super.super.isa + v5);
  }
  if ([a3 isEqualToString:@"currentFeaturesMin"])
  {
    uint64_t v7 = [(BWVideoDepthInferenceConfiguration *)self->_videoDepthConfiguration stereoV2inferenceDescriptor];
    objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor temporalSmoothingCurrentFeaturesRatioMinInput](v7, "temporalSmoothingCurrentFeaturesRatioMinInput"), "imageDescriptor"), "sizeForLayout:", 255);
    double v9 = v8;
    double v11 = v10;
    BOOL v12 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v12 setWidth:(unint64_t)v9];
    [(BWVideoFormatRequirements *)v12 setHeight:(unint64_t)v11];
    v25[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor temporalSmoothingCurrentFeaturesRatioMinInput](v7, "temporalSmoothingCurrentFeaturesRatioMinInput"), "imageDescriptor"), "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v12, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1]);
    [(BWVideoFormatRequirements *)v12 setBytesPerRowAlignment:64];
    objc_super v24 = v12;
    v13 = (void *)MEMORY[0x1E4F1C978];
    dispatch_time_t v14 = &v24;
    return +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [v13 arrayWithObjects:v14 count:1]);
  }
  if ([a3 isEqualToString:@"previousFeaturesMin"])
  {
    id v15 = [(BWVideoDepthInferenceConfiguration *)self->_videoDepthConfiguration stereoV2inferenceDescriptor];
    objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor temporalSmoothingPreviousFeaturesRatioMinInput](v15, "temporalSmoothingPreviousFeaturesRatioMinInput"), "imageDescriptor"), "sizeForLayout:", 255);
    double v17 = v16;
    double v19 = v18;
    CFDictionaryRef v20 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v20 setWidth:(unint64_t)v17];
    [(BWVideoFormatRequirements *)v20 setHeight:(unint64_t)v19];
    uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend((id)-[ADEspressoStereoV2InferenceDescriptor temporalSmoothingPreviousFeaturesRatioMinInput](v15, "temporalSmoothingPreviousFeaturesRatioMinInput"), "imageDescriptor"), "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v20, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1]);
    [(BWVideoFormatRequirements *)v20 setBytesPerRowAlignment:64];
    float v22 = v20;
    v13 = (void *)MEMORY[0x1E4F1C978];
    dispatch_time_t v14 = &v22;
    return +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [v13 arrayWithObjects:v14 count:1]);
  }
  v21.receiver = self;
  v21.super_class = (Class)BWCinematicPerceptionNode;
  return [(BWInferenceNode *)&v21 inputVideoFormatForAttachedMediaKey:a3];
}

- (id)preparedOutputPixelBufferPoolForAttachedMediaKey:(id)a3 format:(id)a4
{
  if (!objc_msgSend(a3, "isEqualToString:", @"Depth", a4))
  {
    if ([a3 isEqualToString:@"colorFeaturesOut"])
    {
      uint64_t v8 = 264;
    }
    else
    {
      if (![a3 isEqualToString:@"depthFeaturesOut"])
      {
        output = self->super.super._output;
        uint64_t v7 = (__CFString *)a3;
        goto LABEL_9;
      }
      uint64_t v8 = 256;
    }
    return *(Class *)((char *)&self->super.super.super.isa + v8);
  }
  output = self->super.super._output;
  uint64_t v7 = @"Depth";
LABEL_9:
  id v10 = [(BWNodeOutput *)output mediaPropertiesForAttachedMediaKey:v7];
  return (id)[v10 preparedPixelBufferPool];
}

- (BWVideoDepthInferenceConfiguration)videoDepthConfiguration
{
  return self->_videoDepthConfiguration;
}

@end