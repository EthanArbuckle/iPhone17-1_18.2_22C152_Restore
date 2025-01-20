@interface FigCapturePhotonicEngineSinkPipeline
+ (NSString)pipelineBaseName;
+ (void)initialize;
- (BWCompressedShotBufferNode)compressedShotBufferNode;
- (BWPortraitHDRStagingNode)portraitHDRStagingNode;
- (BWStillImageCoordinatorNode)stillImageCoordinatorNode;
- (BWStillImageSampleBufferSinkNode)stillImageSinkNode;
- (FigCapturePhotonicEngineSinkPipeline)initWithConfiguration:(id)a3 captureDevice:(id)a4 sourceOutputsByPortType:(id)a5 sourceSensorRawOutputsByPortType:(id)a6 highResStillImageDimensions:(id)a7 supplementalPointCloudCaptureDevice:(id)a8 supplementalPointCloudSourceOutput:(id)a9 captureStatusDelegate:(id)a10 inferenceScheduler:(id)a11 cinematicFramingStatesProvider:(id)a12 graph:(id)a13 name:(id)a14;
- (uint64_t)_addLandmarksInferenceToNode:(uint64_t)result;
- (uint64_t)_addMattingInferenceToNode:(uint64_t)a3 mattingVersion:(uint64_t)a4 learnedMattingVersion:(uint64_t)a5 mainImageDownscalingFactor:(unsigned int)a6 targetAspectRatio:(uint64_t)a7 appliesFinalCropRect:(uint64_t)a8 enabledSemantics:(float)a9 metalCommandQueue:(float)a10 mattingSensorConfigurationsByPortType:(char)a11 clientIsCameraOrDerivative:(unsigned int)a12 requiredAdditionalInferenceOutputBuffers:;
- (uint64_t)_addScalerNodeWithName:(void *)a3 nodeConfiguration:(uint64_t)a4 bravoConstituentPhotoDeliveryEnabled:(uint64_t)a5 mainImageDownscalingFactorByAttachedMediaKey:(uint64_t)a6 depthDataDimensions:(uint64_t)a7 smartStyleLinearThumbnailDimensions:(uint64_t)a8 smartStyleStyledThumbnailDimensions:(char)a9 smartStyleReversibilityEnabled:(uint64_t)a10 constantColorConfidenceMapDimensions:(char)a11 filterRenderingEnabled:(unsigned __int8)a12 enforcesZoomingForPortraitCaptures:(unsigned __int8)a13 backPressureDrivenPipelining:(void *)a14 scalerNodeInputOut:(uint64_t *)a15 scalerNodeOutputOut:;
- (uint64_t)_buildScaleAndEncodeSubPipelineWithPipelineStage:(void *)a1 graph:(uint64_t)a2 nodeConfiguration:(void *)a3 stillImageSinkPipelineWithConfiguration:(void *)a4 sensorConfigurationsByPortType:(void *)a5 supportsScaling:(uint64_t)a6 deferredPearlDepthProcessingEnabled:(int)a7 provideMeteorHeadroom:(int)a8 provideFlexGTC:(char)a9 providePostEncodeInferences:(char)a10 semanticDevelopmentVersion:(char)a11 constituentPhotoDeliveryEnabled:(unsigned int)a12 demosaicedRawEnabled:(unsigned __int8)a13 nonPropagatedMainImageDownscalingFactorByAttachedMediaKey:(void *)a14 propagatedMainImageDownscalingFactorByAttachedMediaKey:(void *)a15 scalingMainImageDownscalingFactorByAttachedMediaKey:(uint64_t)a16 inferenceScheduler:(uint64_t)a17 subPipelineInputOut:(uint64_t *)a18 subPipelineOutputOut:(uint64_t *)a19 cameraSupportsFlash:(unsigned __int8)a20 cinematicFramingStatesProvider:(void *)a21 photoEncoderControllerOut:(void *)a22;
- (uint64_t)_buildStillImageSinkPipelineWithConfiguration:(uint64_t)a3 captureDevice:(uint64_t)a4 sourceOutputsByPortType:(uint64_t)a5 sourceSensorRawOutputsByPortType:(uint64_t)a6 highResStillImageDimensions:(uint64_t)a7 supplementalPointCloudCaptureDevice:(uint64_t)a8 supplementalPointCloudSourceOutput:(uint64_t)a9 captureStatusDelegate:(uint64_t)a10 inferenceScheduler:(void *)a11 cinematicFramingStatesProvider:(void *)a12 graph:;
- (void)dealloc;
@end

@implementation FigCapturePhotonicEngineSinkPipeline

- (uint64_t)_buildScaleAndEncodeSubPipelineWithPipelineStage:(void *)a1 graph:(uint64_t)a2 nodeConfiguration:(void *)a3 stillImageSinkPipelineWithConfiguration:(void *)a4 sensorConfigurationsByPortType:(void *)a5 supportsScaling:(uint64_t)a6 deferredPearlDepthProcessingEnabled:(int)a7 provideMeteorHeadroom:(int)a8 provideFlexGTC:(char)a9 providePostEncodeInferences:(char)a10 semanticDevelopmentVersion:(char)a11 constituentPhotoDeliveryEnabled:(unsigned int)a12 demosaicedRawEnabled:(unsigned __int8)a13 nonPropagatedMainImageDownscalingFactorByAttachedMediaKey:(void *)a14 propagatedMainImageDownscalingFactorByAttachedMediaKey:(void *)a15 scalingMainImageDownscalingFactorByAttachedMediaKey:(uint64_t)a16 inferenceScheduler:(uint64_t)a17 subPipelineInputOut:(uint64_t *)a18 subPipelineOutputOut:(uint64_t *)a19 cameraSupportsFlash:(unsigned __int8)a20 cinematicFramingStatesProvider:(void *)a21 photoEncoderControllerOut:(void *)a22
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v110 = 0;
  if (!a18 || !a19) {
    return FigSignalErrorAt();
  }
  v25 = a5;
  [a5 sinkConfiguration];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v27 = [v25 sinkConfiguration];
  }
  else {
    uint64_t v27 = 0;
  }
  v28 = &selRef_initWithWidth_height_pixelFormat_;
  v90 = v25;
  v87 = (void *)v27;
  if (![v25 cinematicFramingWarpingRequired])
  {
    uint64_t v36 = 0;
    uint64_t v35 = 0;
    if (!a7) {
      goto LABEL_22;
    }
    goto LABEL_12;
  }
  v29 = [BWCinematicFramingWarpingNode alloc];
  uint64_t v30 = [v25 cinematicFramingWarpingOutputDimensions];
  v31 = v25;
  uint64_t v32 = v30;
  [v31 maxLossyCompressionLevel];
  v33 = v29;
  v28 = &selRef_initWithWidth_height_pixelFormat_;
  v34 = -[BWCinematicFramingWarpingNode initWithFramingStatesProvider:outputDimensions:maxLossyCompressionLevel:](v33, a21, v32);
  [v34 setName:@"CinematicFramingWarper"];
  v109.receiver = a1;
  v109.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
  if (!objc_msgSendSuper2(&v109, sel_addNode_error_, v34, &v110)) {
    goto LABEL_94;
  }
  uint64_t v35 = [v34 input];
  uint64_t v36 = [v34 output];
  v25 = v90;
  if (a7)
  {
LABEL_12:
    uint64_t v86 = a6;
    uint64_t v37 = v35;
    uint64_t v107 = 0;
    uint64_t v108 = 0;
    if (([v25 continuousZoomWithDepthSupported] & 1) != 0 || (uint64_t v38 = 0, a8)) {
      uint64_t v38 = [v25 depthDataDimensions];
    }
    uint64_t v39 = -[FigCapturePhotonicEngineSinkPipeline _addScalerNodeWithName:nodeConfiguration:bravoConstituentPhotoDeliveryEnabled:mainImageDownscalingFactorByAttachedMediaKey:depthDataDimensions:smartStyleLinearThumbnailDimensions:smartStyleStyledThumbnailDimensions:smartStyleReversibilityEnabled:constantColorConfidenceMapDimensions:filterRenderingEnabled:enforcesZoomingForPortraitCaptures:backPressureDrivenPipelining:scalerNodeInputOut:scalerNodeOutputOut:]((uint64_t)a1, @"Scaler", a4, a13, a16, v38, [v25 smartStyleLinearThumbnailDimensions], objc_msgSend(v25, "smartStyleStyledThumbnailDimensions"), objc_msgSend(v25, "smartStyleReversibilityEnabled"), objc_msgSend(v25, "constantColorConfidenceMapDimensions"), 0, 0, 0, &v108, &v107);
    if (v39)
    {
      uint64_t v80 = v39;
      goto LABEL_98;
    }
    if (v36)
    {
      uint64_t v40 = [a3 safelyConnectOutput:v36 toInput:v108 pipelineStage:a2];
      if (v40)
      {
        uint64_t v80 = v40;
        goto LABEL_98;
      }
    }
    uint64_t v36 = v107;
    if (v37) {
      uint64_t v35 = v37;
    }
    else {
      uint64_t v35 = v108;
    }
    v28 = &selRef_initWithWidth_height_pixelFormat_;
    a6 = v86;
  }
LABEL_22:
  if (a9)
  {
    v41 = [[BWMeteorHeadroomNode alloc] initWithNodeConfiguration:a4 sensorConfigurationsByPortType:a6];
    [(BWNode *)v41 setName:@"Meteor Headroom"];
    [(BWMeteorHeadroomNode *)v41 setHeadroomProcessingType:[+[FigCaptureCameraParameters sharedInstance] meteorHeadroomProcessingType]];
    [v25 gainMapMainImageDownscalingFactor];
    -[BWMeteorHeadroomNode setGainMapMainImageDownscalingFactor:](v41, "setGainMapMainImageDownscalingFactor:");
    v42 = (objc_class *)v28[457];
    v106.receiver = a1;
    v106.super_class = v42;
    if ((objc_msgSendSuper2(&v106, sel_addNode_error_, v41, &v110) & 1) == 0) {
      goto LABEL_94;
    }
    if (v36)
    {
      uint64_t v43 = objc_msgSend(a3, "safelyConnectOutput:toInput:pipelineStage:", v36, -[BWNode input](v41, "input"), a2);
      if (v43)
      {
        uint64_t v80 = v43;
        goto LABEL_98;
      }
    }
    if (!v35) {
      uint64_t v35 = [(BWNode *)v41 input];
    }
    uint64_t v36 = [(BWNode *)v41 output];
  }
  v85 = a1;
  if (!a10)
  {
    uint64_t v49 = a6;
    uint64_t v83 = v36;
    uint64_t v84 = v35;
    goto LABEL_37;
  }
  id v44 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F55F60], "metalDevice"), "newCommandQueue");
  [v25 pipelineStagePriority];
  v45 = (void *)FigDispatchQueueCreateWithPriority();
  [v44 setCompletionQueue:v45];
  [v44 setSubmissionQueue:v45];

  v46 = [[BWFlexGTCNode alloc] initWithNodeConfiguration:a4 sensorConfigurationsByPortType:a6 metalCommandQueue:v44];
  [(BWNode *)v46 setName:@"FlexGTC"];
  v47 = (objc_class *)v28[457];
  v105.receiver = a1;
  v105.super_class = v47;
  if ((objc_msgSendSuper2(&v105, sel_addNode_error_, v46, &v110) & 1) == 0)
  {
LABEL_94:
    FigDebugAssert3();
    return 4294954510;
  }
  if (v36)
  {
    uint64_t v48 = objc_msgSend(a3, "safelyConnectOutput:toInput:pipelineStage:", v36, -[BWNode input](v46, "input"), a2);
    if (v48)
    {
      uint64_t v80 = v48;
      goto LABEL_98;
    }
  }
  if (!v35) {
    uint64_t v35 = [(BWNode *)v46 input];
  }
  uint64_t v49 = a6;
  uint64_t v84 = v35;
  uint64_t v83 = [(BWNode *)v46 output];
LABEL_37:
  if ([v87 previewQualityAdjustedPhotoFilterRenderingEnabled]) {
    uint64_t v50 = 2;
  }
  else {
    uint64_t v50 = 0;
  }
  v51 = [BWPhotoEncoderNode alloc];
  if (!a11) {
    a17 = 0;
  }
  LOBYTE(v82) = [v90 stillImageSinkPipelineProcessingMode] == 1;
  v53 = [(BWPhotoEncoderNode *)v51 initWithNodeConfiguration:a4 sensorConfigurationsByPortType:v49 semanticDevelopmentVersion:a12 inferenceScheduler:a17 alwaysAwaitInference:(int)a12 > 0 portraitRenderQuality:v50 deferredPhotoProcessorEnabled:v82];
  [(BWNode *)v53 setName:@"Encoder"];
  [(BWPhotoEncoderNode *)v53 setCameraSupportsFlash:a20];
  -[BWPhotoEncoderNode setUsesHighEncodingPriority:](v53, "setUsesHighEncodingPriority:", [v90 usesHighEncodingPriority]);
  v54 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  uint64_t v55 = [a14 countByEnumeratingWithState:&v101 objects:v113 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v102;
    do
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v102 != v57) {
          objc_enumerationMutation(a14);
        }
        uint64_t v59 = *(void *)(*((void *)&v101 + 1) + 8 * i);
        v60 = [BWPhotoEncoderNodeAttachedMediaConfiguration alloc];
        objc_msgSend((id)objc_msgSend(a14, "objectForKeyedSubscript:", v59), "floatValue");
        objc_msgSend(v54, "setObject:forKeyedSubscript:", -[BWPhotoEncoderNodeAttachedMediaConfiguration initWithMainImageDownscalingFactor:propagationMode:](v60, "initWithMainImageDownscalingFactor:propagationMode:", 1), v59);
      }
      uint64_t v56 = [a14 countByEnumeratingWithState:&v101 objects:v113 count:16];
    }
    while (v56);
  }
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v61 = [a15 countByEnumeratingWithState:&v97 objects:v112 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v98;
    while (2)
    {
      for (uint64_t j = 0; j != v62; ++j)
      {
        if (*(void *)v98 != v63) {
          objc_enumerationMutation(a15);
        }
        uint64_t v65 = *(void *)(*((void *)&v97 + 1) + 8 * j);
        v66 = (void *)[v54 objectForKeyedSubscript:v65];
        if (v66)
        {
          v67 = v66;
          [v66 mainImageDownscalingFactor];
          float v69 = v68;
          objc_msgSend((id)objc_msgSend(a15, "objectForKeyedSubscript:", v65), "floatValue");
          if (v69 != v70) {
            return 4294954516;
          }
          [v67 setPropagationMode:2];
        }
        else
        {
          v71 = [BWPhotoEncoderNodeAttachedMediaConfiguration alloc];
          objc_msgSend((id)objc_msgSend(a15, "objectForKeyedSubscript:", v65), "floatValue");
          objc_msgSend(v54, "setObject:forKeyedSubscript:", -[BWPhotoEncoderNodeAttachedMediaConfiguration initWithMainImageDownscalingFactor:propagationMode:](v71, "initWithMainImageDownscalingFactor:propagationMode:", 0), v65);
        }
      }
      uint64_t v62 = [a15 countByEnumeratingWithState:&v97 objects:v112 count:16];
      if (v62) {
        continue;
      }
      break;
    }
  }
  -[BWPhotoEncoderNode setSmartStyleRenderingVersion:](v53, "setSmartStyleRenderingVersion:", [v90 smartStyleRenderingVersion]);
  -[BWPhotoEncoderNode setSmartStyleReversibilityEnabled:](v53, "setSmartStyleReversibilityEnabled:", [v90 smartStyleReversibilityEnabled]);
  if ([v90 smartStyleReversibilityEnabled])
  {
    if (FigCaptureVideoDimensionsAreValid([v90 smartStyleLinearThumbnailDimensions])) {
      objc_msgSend(v54, "setObject:forKeyedSubscript:", -[BWPhotoEncoderNodeAttachedMediaConfiguration initWithDimensions:propagationMode:]([BWPhotoEncoderNodeAttachedMediaConfiguration alloc], "initWithDimensions:propagationMode:", objc_msgSend(v90, "smartStyleLinearThumbnailDimensions"), 1), 0x1EFA74740);
    }
    if (FigCaptureVideoDimensionsAreValid([v90 smartStyleStyledThumbnailDimensions])) {
      objc_msgSend(v54, "setObject:forKeyedSubscript:", -[BWPhotoEncoderNodeAttachedMediaConfiguration initWithDimensions:propagationMode:]([BWPhotoEncoderNodeAttachedMediaConfiguration alloc], "initWithDimensions:propagationMode:", objc_msgSend(v90, "smartStyleStyledThumbnailDimensions"), 1), 0x1EFA74780);
    }
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    v72 = (void *)BWSemanticSegmentationMatteAttachedMediaKeysSupportedByDemosaicedRaw();
    uint64_t v73 = [v72 countByEnumeratingWithState:&v93 objects:v111 count:16];
    if (v73)
    {
      uint64_t v74 = v73;
      uint64_t v75 = *(void *)v94;
      do
      {
        for (uint64_t k = 0; k != v74; ++k)
        {
          if (*(void *)v94 != v75) {
            objc_enumerationMutation(v72);
          }
          objc_msgSend((id)objc_msgSend(v54, "objectForKeyedSubscript:", *(void *)(*((void *)&v93 + 1) + 8 * k)), "setPropagationMode:", 2);
        }
        uint64_t v74 = [v72 countByEnumeratingWithState:&v93 objects:v111 count:16];
      }
      while (v74);
    }
  }
  if ((int)[v90 constantColorVersion] >= 1) {
    objc_msgSend(v54, "setObject:forKeyedSubscript:", -[BWPhotoEncoderNodeAttachedMediaConfiguration initWithDimensions:propagationMode:]([BWPhotoEncoderNodeAttachedMediaConfiguration alloc], "initWithDimensions:propagationMode:", objc_msgSend(v90, "constantColorConfidenceMapDimensions"), 2), 0x1EFA74920);
  }
  uint64_t v77 = v84;
  if ([v54 count]) {
    [(BWPhotoEncoderNode *)v53 setAttachedMediaConfigurationByAttachedMediaKey:v54];
  }
  [(BWPhotoEncoderNode *)v53 setPreferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer:1];
  v92.receiver = v85;
  v92.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
  if ((objc_msgSendSuper2(&v92, sel_addNode_error_, v53, &v110) & 1) == 0) {
    goto LABEL_94;
  }
  if (v83)
  {
    uint64_t v78 = objc_msgSend(a3, "safelyConnectOutput:toInput:pipelineStage:", v83, -[BWNode input](v53, "input"), a2);
    if (v78)
    {
      uint64_t v80 = v78;
LABEL_98:
      FigDebugAssert3();
      return v80;
    }
  }
  if (!v84) {
    uint64_t v77 = [(BWNode *)v53 input];
  }
  uint64_t v79 = [(BWNode *)v53 output];
  if (a22) {
    *a22 = [(BWPhotoEncoderNode *)v53 photoEncoderController];
  }
  uint64_t v80 = 4294954516;
  if (v77 && v79)
  {
    uint64_t v80 = 0;
    *a18 = v77;
    *a19 = v79;
  }
  return v80;
}

- (BWStillImageSampleBufferSinkNode)stillImageSinkNode
{
  return self->_stillImageSinkNode;
}

- (uint64_t)_addMattingInferenceToNode:(uint64_t)a3 mattingVersion:(uint64_t)a4 learnedMattingVersion:(uint64_t)a5 mainImageDownscalingFactor:(unsigned int)a6 targetAspectRatio:(uint64_t)a7 appliesFinalCropRect:(uint64_t)a8 enabledSemantics:(float)a9 metalCommandQueue:(float)a10 mattingSensorConfigurationsByPortType:(char)a11 clientIsCameraOrDerivative:(unsigned int)a12 requiredAdditionalInferenceOutputBuffers:
{
  if (!a1) {
    return 0;
  }
  if (a3 < 2)
  {
    uint64_t v14 = 4294935514;
LABEL_4:
    v15 = (void *)[a2 name];
    uint64_t v16 = [v15 length];
    v17 = @"Matting";
    if (v16) {
      v17 = (__CFString *)[v15 stringByAppendingFormat:@" + %@", @"Matting"];
    }
    [a2 setName:v17];
    if ((a11 & 1) == 0) {
      [a2 setAwaitAsynchronousOutputs:1];
    }
    if (a12) {
      [a2 setAdditionalOutputPoolRetainedBufferCount:a12];
    }
    return v14;
  }
  char v18 = a6;
  uint64_t v23 = a6 & 0x78 | (4 * ((a6 >> 1) & 1)) | (2 * a6) & (2 * (a4 == 0));
  if (!v23) {
    goto LABEL_21;
  }
  uint64_t v27 = [(BWInferenceConfiguration *)[BWMattingV2InferenceConfiguration alloc] initWithInferenceType:201];
  [(BWMattingV2InferenceConfiguration *)v27 setSensorConfigurationsByPortType:a8];
  [(BWMattingV2InferenceConfiguration *)v27 setEnabledMattes:v23];
  [(BWMattingV2InferenceConfiguration *)v27 setTuningConfiguration:2];
  [(BWInferenceConfiguration *)v27 setPriority:*(unsigned int *)(a1 + 52)];
  *(float *)&double v28 = a9;
  [(BWMattingV2InferenceConfiguration *)v27 setMainImageDownscalingFactor:v28];
  *(float *)&double v29 = a10;
  [(BWMattingV2InferenceConfiguration *)v27 setTargetAspectRatio:v29];
  [(BWMattingV2InferenceConfiguration *)v27 setAppliesFinalCropRect:a5];
  [(BWMattingV2InferenceConfiguration *)v27 setMetalCommandQueue:a7];
  uint64_t v14 = [a2 addInferenceOfType:201 version:BWInferenceVersionMakeMajor(a3) & 0xFFFFFFFFFFFFLL configuration:v27];
  if (!v14)
  {
LABEL_21:
    uint64_t v14 = 0;
    if (!a4 || (v18 & 1) == 0) {
      goto LABEL_4;
    }
    uint64_t v30 = (void *)[a2 name];
    uint64_t v31 = [v30 length];
    uint64_t v32 = @"Learned Matting";
    if (v31) {
      uint64_t v32 = (__CFString *)[v30 stringByAppendingFormat:@" + %@", @"Learned Matting"];
    }
    [a2 setName:v32];
    v33 = [(BWInferenceConfiguration *)[BWLearnedMattingInferenceConfiguration alloc] initWithInferenceType:107];
    [(BWTiledEspressoInferenceConfiguration *)v33 setMetalCommandQueue:0];
    *(float *)&double v34 = a9;
    [(BWLearnedMattingInferenceConfiguration *)v33 setMainImageDownscalingFactor:v34];
    *(float *)&double v35 = a10;
    [(BWLearnedMattingInferenceConfiguration *)v33 setTargetAspectRatio:v35];
    [(BWLearnedMattingInferenceConfiguration *)v33 setAppliesFinalCropRect:a5];
    uint64_t v14 = [a2 addInferenceOfType:107 version:BWInferenceVersionMakeMajor(a4) & 0xFFFFFFFFFFFFLL configuration:v33];
    if (!v14) {
      goto LABEL_4;
    }
  }
  return v14;
}

- (uint64_t)_addScalerNodeWithName:(void *)a3 nodeConfiguration:(uint64_t)a4 bravoConstituentPhotoDeliveryEnabled:(uint64_t)a5 mainImageDownscalingFactorByAttachedMediaKey:(uint64_t)a6 depthDataDimensions:(uint64_t)a7 smartStyleLinearThumbnailDimensions:(uint64_t)a8 smartStyleStyledThumbnailDimensions:(char)a9 smartStyleReversibilityEnabled:(uint64_t)a10 constantColorConfidenceMapDimensions:(char)a11 filterRenderingEnabled:(unsigned __int8)a12 enforcesZoomingForPortraitCaptures:(unsigned __int8)a13 backPressureDrivenPipelining:(void *)a14 scalerNodeInputOut:(uint64_t *)a15 scalerNodeOutputOut:
{
  if (result)
  {
    v21 = (void *)result;
    uint64_t v31 = 0;
    int v22 = 1;
    if ([a3 deferredPhotoProcessorEnabled])
    {
      BOOL v23 = FigCaptureVideoDimensionsAreValid(a6);
      int v22 = v23 ? 2 : 1;
      if (v23 && (a11 & 1) == 0)
      {
        if ([a3 optimizedEnhancedResolutionDepthPipelineEnabled]) {
          int v22 = 2;
        }
        else {
          int v22 = 1;
        }
      }
    }
    int v24 = 1;
    if ([a3 deferredPhotoProcessorEnabled])
    {
      if ([a3 pearlModuleType]) {
        int v24 = 2;
      }
      else {
        int v24 = 1;
      }
    }
    v25 = [[BWStillImageScalerNode alloc] initWithBasePoolCapacity:(v24 * v22) nodeConfiguration:a3];
    [(BWNode *)v25 setName:a2];
    [(BWStillImageScalerNode *)v25 setBlackFillingRequired:a4];
    [(BWStillImageScalerNode *)v25 setMainImageDownscalingFactorByAttachedMediaKey:a5];
    [(BWStillImageScalerNode *)v25 setPreferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer:1];
    v26 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    if (FigCaptureVideoDimensionsAreValid(a6))
    {
      v32.width = (double)(int)a6;
      v32.height = (double)SHIDWORD(a6);
      [v26 setObject:CGSizeCreateDictionaryRepresentation(v32) forKeyedSubscript:@"Depth"];
    }
    if (a9)
    {
      if (FigCaptureVideoDimensionsAreValid(a7))
      {
        v33.width = (double)(int)a7;
        v33.height = (double)SHIDWORD(a7);
        [v26 setObject:CGSizeCreateDictionaryRepresentation(v33) forKeyedSubscript:0x1EFA74740];
      }
      if (FigCaptureVideoDimensionsAreValid(a8))
      {
        v34.width = (double)(int)a8;
        v34.height = (double)SHIDWORD(a8);
        [v26 setObject:CGSizeCreateDictionaryRepresentation(v34) forKeyedSubscript:0x1EFA74780];
      }
      v35.width = 160.0;
      v35.height = 162.0;
      [v26 setObject:CGSizeCreateDictionaryRepresentation(v35) forKeyedSubscript:0x1EFA747C0];
      v36.width = 32.0;
      v36.height = 32.0;
      CFDictionaryRef v27 = CGSizeCreateDictionaryRepresentation(v36);
      [v26 setObject:v27 forKeyedSubscript:0x1EFA747E0];
      [v26 setObject:v27 forKeyedSubscript:0x1EFA74800];
    }
    if (FigCaptureVideoDimensionsAreValid(a10))
    {
      v37.width = (double)(int)a10;
      v37.height = (double)SHIDWORD(a10);
      [v26 setObject:CGSizeCreateDictionaryRepresentation(v37) forKeyedSubscript:0x1EFA74920];
    }
    if ([v26 count]) {
      [(BWStillImageScalerNode *)v25 setOutputSizeByAttachedMediaKey:v26];
    }
    [(BWStillImageScalerNode *)v25 setEnforcesZoomingForPortraitCaptures:a12];
    [(BWStillImageScalerNode *)v25 setBackPressureDrivenPipelining:a13];
    v30.receiver = v21;
    v30.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
    if (objc_msgSendSuper2(&v30, sel_addNode_error_, v25, &v31))
    {
      if (a14) {
        *a14 = [(BWNode *)v25 input];
      }
      if (a15)
      {
        uint64_t v28 = [(BWNode *)v25 output];
        result = 0;
        *a15 = v28;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      FigDebugAssert3();
      return 4294954510;
    }
  }
  return result;
}

- (FigCapturePhotonicEngineSinkPipeline)initWithConfiguration:(id)a3 captureDevice:(id)a4 sourceOutputsByPortType:(id)a5 sourceSensorRawOutputsByPortType:(id)a6 highResStillImageDimensions:(id)a7 supplementalPointCloudCaptureDevice:(id)a8 supplementalPointCloudSourceOutput:(id)a9 captureStatusDelegate:(id)a10 inferenceScheduler:(id)a11 cinematicFramingStatesProvider:(id)a12 graph:(id)a13 name:(id)a14
{
  v23.receiver = self;
  v23.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
  v20 = -[FigCaptureSinkPipeline initWithGraph:name:sinkID:](&v23, sel_initWithGraph_name_sinkID_, a13, a14, objc_msgSend((id)objc_msgSend(a3, "sinkConfiguration"), "sinkID"));
  v21 = v20;
  if (v20
    && -[FigCapturePhotonicEngineSinkPipeline _buildStillImageSinkPipelineWithConfiguration:captureDevice:sourceOutputsByPortType:sourceSensorRawOutputsByPortType:highResStillImageDimensions:supplementalPointCloudCaptureDevice:supplementalPointCloudSourceOutput:captureStatusDelegate:inferenceScheduler:cinematicFramingStatesProvider:graph:]((uint64_t)v20, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, (uint64_t)a9, (uint64_t)a10, (uint64_t)a11, a12, a13))
  {
    FigDebugAssert3();

    return 0;
  }
  return v21;
}

- (BWStillImageCoordinatorNode)stillImageCoordinatorNode
{
  return self->_stillImageCoordinatorNode;
}

- (BWCompressedShotBufferNode)compressedShotBufferNode
{
  return self->_compressedShotBufferNode;
}

+ (NSString)pipelineBaseName
{
  return (NSString *)@"Photonic Engine Sink Pipeline";
}

- (uint64_t)_buildStillImageSinkPipelineWithConfiguration:(uint64_t)a3 captureDevice:(uint64_t)a4 sourceOutputsByPortType:(uint64_t)a5 sourceSensorRawOutputsByPortType:(uint64_t)a6 highResStillImageDimensions:(uint64_t)a7 supplementalPointCloudCaptureDevice:(uint64_t)a8 supplementalPointCloudSourceOutput:(uint64_t)a9 captureStatusDelegate:(uint64_t)a10 inferenceScheduler:(void *)a11 cinematicFramingStatesProvider:(void *)a12 graph:
{
  uint64_t result = MEMORY[0x1F4188790](a1, a2, a3, a4);
  v528 = v17;
  v513 = v18;
  v534 = v19;
  v782[1] = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v20 = v16;
  v21 = v14;
  int v22 = v13;
  uint64_t v23 = result;
  v563 = v15;
  unsigned int v746 = 0;
  id v745 = 0;
  [v13 sinkConfiguration];
  objc_opt_class();
  int v24 = 0;
  if (objc_opt_isKindOfClass()) {
    int v24 = (void *)[v22 sinkConfiguration];
  }
  obuint64_t j = v21;
  *(_DWORD *)(v23 + 48) = [v22 pipelineStagePriority];
  *(_DWORD *)(v23 + 52) = [v22 inferencePriority];
  unsigned int v526 = [v22 deferredProcessingSupported];
  int v25 = [v22 stillImageSinkPipelineProcessingMode];
  unsigned int v530 = [v24 filterRenderingEnabled];
  unsigned int v26 = [v24 depthDataDeliveryEnabled];
  unsigned int v27 = v26;
  int v539 = v25;
  BOOL v550 = v25 == 1;
  BOOL v516 = v25 != 1;
  if (v25 == 1) {
    unsigned int v28 = v26;
  }
  else {
    unsigned int v28 = 0;
  }
  unsigned int v496 = v28;
  uint64_t v493 = v20;
  BOOL v29 = v28 == 1 && [v22 depthDataType] == 3;
  int v30 = [v22 deepFusionEnhancedResolutionDimensions];
  BOOL v31 = v25 == 1;
  if (v539 == 1) {
    unsigned int v32 = v27;
  }
  else {
    unsigned int v32 = 0;
  }
  if (v30 <= 0) {
    unsigned int v32 = 0;
  }
  unsigned int v531 = v32;
  CGSize v33 = objc_alloc_init(BWPhotonicEngineNodeConfiguration);
  [(BWStillImageNodeConfiguration *)v33 setDeferredCaptureSupportEnabled:v526];
  [(BWStillImageNodeConfiguration *)v33 setDeferredPhotoProcessorEnabled:v31];
  [(BWStillImageNodeConfiguration *)v33 setFilterRenderingEnabled:v530];
  if (v27) {
    -[BWStillImageNodeConfiguration setDepthDataOutputDimensions:](v33, "setDepthDataOutputDimensions:", [v22 depthDataDimensions]);
  }
  -[BWStillImageNodeConfiguration setStillImageProcessingMode:](v33, "setStillImageProcessingMode:", [v22 stillImageSinkPipelineProcessingMode]);
  -[BWStillImageNodeConfiguration setMetalCommandQueue:](v33, "setMetalCommandQueue:", (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F55F60], "metalDevice"), "newCommandQueueWithMaxCommandBufferCount:", 512));
  [v22 pipelineStagePriority];
  CGSize v34 = FigDispatchQueueCreateWithPriority();
  [(MTLCommandQueue *)[(BWStillImageNodeConfiguration *)v33 metalCommandQueue] setCompletionQueue:v34];
  dispatch_release(v34);
  [(BWStillImageNodeConfiguration *)v33 setFigThreadPriority:*(unsigned int *)(v23 + 48)];
  -[BWStillImageNodeConfiguration setDepthDataType:](v33, "setDepthDataType:", [v22 depthDataType]);
  -[BWStillImageNodeConfiguration setDeepFusionEnhancedResolutionDimensions:](v33, "setDeepFusionEnhancedResolutionDimensions:", [v22 deepFusionEnhancedResolutionDimensions]);
  -[BWStillImageNodeConfiguration setDowngradedDeepFusionEnhancedResolutionDimensions:](v33, "setDowngradedDeepFusionEnhancedResolutionDimensions:", [v22 downgradedDeepFusionEnhancedResolutionDimensions]);
  [(BWStillImageNodeConfiguration *)v33 setOptimizedEnhancedResolutionDepthPipelineEnabled:v531];
  -[BWStillImageNodeConfiguration setConstantColorConfidenceMapDimensions:](v33, "setConstantColorConfidenceMapDimensions:", [v22 constantColorConfidenceMapDimensions]);
  -[BWStillImageNodeConfiguration setStereoPhotoOutputDimensions:](v33, "setStereoPhotoOutputDimensions:", [v22 stereoPhotoOutputDimensions]);
  -[BWStillImageNodeConfiguration setPearlModuleType:](v33, "setPearlModuleType:", [v22 pearlModuleType]);
  [(BWStillImageNodeConfiguration *)v33 setInferenceScheduler:a10];
  v540 = v33;
  -[BWStillImageNodeConfiguration setMaxLossyCompressionLevel:](v33, "setMaxLossyCompressionLevel:", [v22 maxLossyCompressionLevel]);
  CGSize v35 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v21];
  uint64_t v36 = 0;
  int v547 = [v22 depthDataType];
  if (v547 == 7)
  {
    uint64_t v37 = *MEMORY[0x1E4F52DE0];
    uint64_t v38 = [obj objectForKeyedSubscript:*MEMORY[0x1E4F52DE0]];
    uint64_t v781 = v37;
    v782[0] = v38;
    uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v782 forKeys:&v781 count:1];
    [v35 setObject:0 forKeyedSubscript:v37];
  }
  v476 = (void *)v36;
  id v573 = v35;
  uint64_t v39 = (void *)[v35 allKeys];
  uint64_t v40 = [obj allKeys];
  uint64_t v536 = [v563 count];
  id v544 = v39;
  uint64_t v477 = v40;
  if ((unint64_t)[obj count] >= 2)
  {
    switch([v22 deviceType])
    {
      case 4u:
        uint64_t v41 = *MEMORY[0x1E4F52DD8];
        uint64_t v780 = *MEMORY[0x1E4F52DF0];
        v42 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v43 = &v780;
        goto LABEL_28;
      case 6u:
        uint64_t v41 = *MEMORY[0x1E4F52DF8];
        v560 = (char *)*MEMORY[0x1E4F52E00];
        uint64_t v779 = *MEMORY[0x1E4F52E00];
        v46 = (void *)MEMORY[0x1E4F1C978];
        v47 = &v779;
        goto LABEL_33;
      case 8u:
        uint64_t v41 = *MEMORY[0x1E4F52DE8];
        uint64_t v777 = *MEMORY[0x1E4F52DD8];
        v42 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v43 = &v777;
LABEL_28:
        uint64_t v48 = 1;
        goto LABEL_30;
      case 9u:
        uint64_t v41 = *MEMORY[0x1E4F52DE8];
        uint64_t v49 = *MEMORY[0x1E4F52DF0];
        v776[0] = *MEMORY[0x1E4F52DD8];
        v776[1] = v49;
        v42 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v43 = v776;
        uint64_t v48 = 2;
LABEL_30:
        v560 = 0;
        id v589 = (id)[v42 arrayWithObjects:v43 count:v48];
        id v543 = v589;
        goto LABEL_34;
      case 0xCu:
        uint64_t v41 = *MEMORY[0x1E4F52E10];
        v560 = (char *)*MEMORY[0x1E4F52E00];
        uint64_t v778 = *MEMORY[0x1E4F52E00];
        v46 = (void *)MEMORY[0x1E4F1C978];
        v47 = &v778;
        goto LABEL_33;
      case 0xDu:
        uint64_t v41 = *MEMORY[0x1E4F52DD8];
        v560 = (char *)*MEMORY[0x1E4F52DE0];
        uint64_t v775 = *MEMORY[0x1E4F52DE0];
        v46 = (void *)MEMORY[0x1E4F1C978];
        v47 = &v775;
LABEL_33:
        id v589 = (id)[v46 arrayWithObjects:v47 count:1];
        id v543 = 0;
LABEL_34:
        uint64_t v50 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:v40];
        v51 = (void *)[MEMORY[0x1E4F1CA80] set];
        v52 = v51;
        if (v41) {
          [v51 addObject:v41];
        }
        uint64_t v524 = v41;
        if (v543) {
          objc_msgSend(v52, "addObjectsFromArray:");
        }
        if (v560) {
          objc_msgSend(v52, "addObject:");
        }
        if ([v50 isEqualToSet:v52]) {
          goto LABEL_41;
        }
        goto LABEL_711;
      default:
        goto LABEL_711;
    }
  }
  uint64_t v44 = [v39 firstObject];
  uint64_t v524 = v44;
  if (v29)
  {
    uint64_t v774 = *MEMORY[0x1E4F52E00];
    id v589 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:&v774 count:1];
  }
  else
  {
    uint64_t v45 = v44;
    uint64_t v773 = v44;
    id v589 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:&v773 count:1];
    if (!v45) {
      goto LABEL_711;
    }
  }
  v560 = 0;
  id v543 = 0;
LABEL_41:
  uint64_t v553 = [v563 allKeys];
  if (v536)
  {
    v53 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:v553];
    v54 = (void *)[MEMORY[0x1E4F1CA80] set];
    uint64_t v55 = v54;
    if (v524) {
      objc_msgSend(v54, "addObject:");
    }
    if (v543) {
      objc_msgSend(v55, "addObjectsFromArray:");
    }
    char v56 = [v560 isEqualToString:*MEMORY[0x1E4F52E00]];
    char v57 = [v560 isEqualToString:*MEMORY[0x1E4F52DE0]];
    if (v560 && (v56 & 1) == 0 && (v57 & 1) == 0) {
      [v55 addObject:v560];
    }
    if (([v53 isEqualToSet:v55] & 1) == 0) {
      goto LABEL_711;
    }
  }
  unsigned int v541 = v27;
  int v588 = v29;
  v537 = v24;
  uint64_t v542 = v23;
  v599 = +[FigCaptureCameraParameters sharedInstance];
  id newValue = (id)[v22 sensorIDStringsByPortType];
  v598 = (void *)[v22 cameraInfoByPortType];
  v58 = (void *)[v22 moduleCalibrationByPortType];
  id v604 = (id)[MEMORY[0x1E4F1CA60] dictionary];
  BOOL v586 = FigCaptureVideoDimensionsAreValid([v22 outputStillImageDimensions]);
  BOOL v545 = FigCaptureVideoDimensionsAreValid([v22 gdcInDCProcessorOutputCropDimensions]);
  long long v741 = 0u;
  long long v742 = 0u;
  long long v743 = 0u;
  long long v744 = 0u;
  uint64_t v59 = [obj countByEnumeratingWithState:&v741 objects:v772 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    unint64_t v576 = 0;
    uint64_t v556 = 0;
    id v594 = *(id *)v742;
    uint64_t v580 = *MEMORY[0x1E4F52DF8];
    uint64_t v61 = *MEMORY[0x1E4F52E00];
    uint64_t v566 = *MEMORY[0x1E4F52DE0];
    do
    {
      for (uint64_t i = 0; i != v60; ++i)
      {
        if (*(id *)v742 != v594) {
          objc_enumerationMutation(obj);
        }
        uint64_t v63 = *(void **)(*((void *)&v741 + 1) + 8 * i);
        uint64_t v64 = [newValue objectForKeyedSubscript:v63];
        objc_msgSend(v604, "setObject:forKeyedSubscript:", -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:moduleCalibration:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:moduleCalibration:", v63, v64, -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](v599, "sensorIDDictionaryForPortType:sensorIDString:", v63, v64), objc_msgSend(v598, "objectForKeyedSubscript:", v63), objc_msgSend(v58, "objectForKeyedSubscript:", v63)), v63);
        if (v588 && [v63 isEqualToString:v580])
        {
          uint64_t v65 = [newValue objectForKeyedSubscript:v61];
          objc_msgSend(v604, "setObject:forKeyedSubscript:", -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:moduleCalibration:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:moduleCalibration:", v61, v65, -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](v599, "sensorIDDictionaryForPortType:sensorIDString:", v61, v65), objc_msgSend(v598, "objectForKeyedSubscript:", v61), objc_msgSend(v58, "objectForKeyedSubscript:", v61)), v61);
        }
        if (v586
          && ([v63 isEqualToString:v61] & 1) == 0
          && ([v63 isEqualToString:v566] & 1) == 0)
        {
          v66 = objc_msgSend((id)objc_msgSend(obj, "objectForKeyedSubscript:", v63), "formatRequirements");
          BOOL v67 = FigCaptureVideoDimensionsAreValid(v556 | (v576 << 32));
          unsigned int v68 = [v66 width];
          uint64_t v69 = v68;
          if (v67)
          {
            if (v556 != v68 || v576 != [v66 height]) {
              goto LABEL_817;
            }
          }
          else
          {
            unsigned int v70 = v68;
            unsigned int v71 = [v66 height];
            if (!FigCaptureVideoDimensionsAreValid(v70 | ((unint64_t)v71 << 32))) {
              goto LABEL_817;
            }
            unint64_t v576 = v71;
            uint64_t v556 = v69;
          }
        }
      }
      uint64_t v60 = [obj countByEnumeratingWithState:&v741 objects:v772 count:16];
    }
    while (v60);
  }
  else
  {
    LODWORD(v576) = 0;
    LODWORD(v556) = 0;
  }
  v72 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v737 = 0u;
  long long v738 = 0u;
  long long v739 = 0u;
  long long v740 = 0u;
  uint64_t v73 = [v604 countByEnumeratingWithState:&v737 objects:v771 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v738;
    do
    {
      for (uint64_t j = 0; j != v74; ++j)
      {
        if (*(void *)v738 != v75) {
          objc_enumerationMutation(v604);
        }
        uint64_t v77 = *(void *)(*((void *)&v737 + 1) + 8 * j);
        if ([v589 containsObject:v77]) {
          objc_msgSend(v72, "setObject:forKeyedSubscript:", objc_msgSend(v604, "objectForKeyedSubscript:", v77), v77);
        }
      }
      uint64_t v74 = [v604 countByEnumeratingWithState:&v737 objects:v771 count:16];
    }
    while (v74);
  }
  v527 = v72;
  unsigned int v533 = [v22 clientIsCameraOrDerivative];
  uint64_t v517 = [v573 objectForKeyedSubscript:v560];
  int v495 = [v560 isEqualToString:*MEMORY[0x1E4F52E00]];
  int v78 = [v22 pearlModuleType];
  int v79 = [v22 pearlModuleType];
  unsigned int v535 = [v537 bravoConstituentPhotoDeliveryEnabled];
  if (((v535 ^ 1) & 1) == 0 && !v543) {
    goto LABEL_711;
  }
  unsigned int v80 = [v22 depthDataType];
  if (v541)
  {
    if (v543) {
      BOOL v81 = v516;
    }
    else {
      BOOL v81 = 0;
    }
    BOOL v525 = v81;
    if (v81
      && ([v22 depthDataType] != 8
       || [(FigCaptureCameraParameters *)v599 disparityVersion] <= 4))
    {
      goto LABEL_711;
    }
    if ((v495 & v516) == 1)
    {
      if ([v22 depthDataType] != 3) {
        goto LABEL_711;
      }
      int v520 = 1;
    }
    else
    {
      int v520 = 0;
    }
    int v512 = v530;
  }
  else
  {
    int v512 = 0;
    int v520 = 0;
    BOOL v525 = 0;
  }
  BOOL v82 = v80 == 9 || (v80 & 0xFFFFFFFE) == 4;
  char v83 = v82;
  unsigned int v84 = v531;
  if (!v82) {
    unsigned int v84 = 0;
  }
  unsigned int v473 = v84;
  char v474 = v83;
  if (v543)
  {
    uint64_t v510 = *MEMORY[0x1E4F52DE8];
    if ((objc_msgSend(v589, "containsObject:") & 1) == 0)
    {
      uint64_t v510 = *MEMORY[0x1E4F52DD8];
      if ((objc_msgSend(v589, "containsObject:") & 1) == 0)
      {
        uint64_t v85 = *MEMORY[0x1E4F52DF0];
        if ([v589 containsObject:*MEMORY[0x1E4F52DF0]]) {
          uint64_t v86 = v85;
        }
        else {
          uint64_t v86 = 0;
        }
        uint64_t v510 = v86;
      }
    }
  }
  else
  {
    uint64_t v510 = [v589 firstObject];
  }
  float v87 = 0.0;
  if (v541)
  {
    if (v534)
    {
      [v534 requestedZoomFactorRelativeToPortType:v510];
      float v87 = v88;
    }
    else
    {
      float v87 = 1.0;
    }
  }
  if ([v22 highQualityPhotoCaptureForVideoFormatEnabled])
  {
    if (v541 | v535) {
      int v89 = 0;
    }
    else {
      int v89 = 2;
    }
  }
  else
  {
    int v89 = [v22 stillImageStabilizationSupported];
  }
  if ([v22 learnedNRSupported])
  {
    if (v89 == 2)
    {
      uint64_t v91 = 1;
    }
    else if (v89 == 1)
    {
      unsigned int v90 = (v87 == 2.0) & ~[v534 zeroShutterLagEnabled];
      if (v80 == 8) {
        uint64_t v91 = v90;
      }
      else {
        uint64_t v91 = 0;
      }
    }
    else
    {
      uint64_t v91 = 0;
    }
    if ([v22 ultraHighResolutionProcessingEnabled])
    {
      unsigned int v508 = [v534 learnedNRUltraHighResolutionDowngradeSupported];
      if (v508) {
        uint64_t v91 = 5;
      }
      else {
        uint64_t v91 = v91 | 4;
      }
    }
    else
    {
      unsigned int v508 = 0;
    }
    if (v526)
    {
      if (BWQSubResolutionFlavorSupported((void *)[v22 dimensionsByQSubResolutionFlavorByPortType], 2))
      {
        int v92 = [v534 learnedNRUltraHighResolutionDowngradeSupported];
        v508 |= v92;
        if (v92) {
          int v93 = 10;
        }
        else {
          int v93 = 8;
        }
        uint64_t v91 = v93 | v91;
      }
    }
    else if (v539 == 1)
    {
      if (FigCaptureVideoDimensionsAreValid([v22 stereoPhotoOutputDimensions])) {
        uint64_t v91 = v91 | 0x10;
      }
      else {
        uint64_t v91 = v91 | 1;
      }
    }
  }
  else
  {
    unsigned int v508 = 0;
    uint64_t v91 = 0;
  }
  int v94 = [v22 deepFusionSupported];
  if (v91) {
    int v95 = 1;
  }
  else {
    int v95 = v94;
  }
  if (v539 != 1) {
    int v95 = 0;
  }
  if (v89 == 1 || v89 == 2 && !v91)
  {
    int v501 = v95 ^ 1;
    int v505 = v95 ^ 1;
  }
  else
  {
    int v505 = 0;
    int v501 = v95 ^ 1;
  }
  int v506 = [v537 digitalFlashCaptureEnabled];
  unsigned int v567 = [v537 stereoPhotoCaptureEnabled];
  unsigned int v515 = [v537 portraitEffectsMatteDeliveryEnabled];
  BOOL v96 = (v515 & 1) != 0 || objc_msgSend((id)objc_msgSend(v22, "enabledSemanticSegmentationMatteURNs"), "count") != 0;
  BOOL v532 = v96;
  uint64_t v97 = [(FigCaptureCameraParameters *)v599 personSemanticsVersion];
  int v98 = v97;
  if (v97 && (int)v97 <= 4) {
    goto LABEL_711;
  }
  unsigned int v514 = v89;
  uint64_t Major = BWInferenceVersionMakeMajor(v97);
  long long v99 = objc_msgSend((id)objc_msgSend(v527, "allValues"), "firstObject");
  unsigned int v523 = v80;
  if (v541)
  {
    long long v100 = v99;
    uint64_t v101 = [v99 portType];
    uint64_t v102 = [v100 sensorIDString];
    *(float *)&double v103 = v87;
    int v104 = [(FigCaptureCameraParameters *)v599 sdofRenderingVersionForPortType:v101 sensorIDString:v102 zoomFactor:v103];
    int v105 = v104;
    if (v104 && v104 <= 4) {
      goto LABEL_711;
    }
  }
  else
  {
    int v105 = 0;
  }
  if (v532)
  {
    int v106 = [(FigCaptureCameraParameters *)v599 mattingVersion];
    if (v106 && v106 <= 1) {
      goto LABEL_711;
    }
  }
  else
  {
    int v106 = 0;
  }
  unsigned int v482 = v106;
  unsigned int v481 = [(FigCaptureCameraParameters *)v599 learnedMattingVersion];
  int v107 = v512;
  if (v547 != 7) {
    int v107 = 1;
  }
  int v485 = v107;
  int v108 = v520 | v588;
  BOOL v109 = v78 == 2 || v79 == 3;
  char v110 = v109;
  char v486 = v110;
  if (!v109) {
    int v108 = 0;
  }
  int v503 = v108;
  unsigned int v479 = v105;
  if ([v22 continuousZoomWithDepthSupported])
  {
    v111 = (void *)[v513 firstObject];
    v112 = v111;
    float v113 = 0.0;
    if ((v525 | v496 & (v588 ^ 1)) == 1)
    {
      if ([v111 dimensions] && (unint64_t)objc_msgSend(v112, "dimensions") >> 32)
      {
        float v114 = (float)(int)[v112 dimensions];
        float v113 = v114 / (float)(int)((unint64_t)[v112 dimensions] >> 32);
      }
      unsigned int v552 = 1;
    }
    else
    {
      unsigned int v552 = 0;
    }
  }
  else
  {
    v112 = (void *)[v513 firstObject];
    unsigned int v552 = 0;
    float v113 = 0.0;
  }
  int v484 = [v22 continuousZoomWithDepthSupported];
  unsigned int v504 = BWEmitUnstyledBufferForInferencesOrAdjustedImageWithConfigurations(v22, v537);
  if (v504)
  {
    v735[0] = MEMORY[0x1E4F143A8];
    v735[1] = 3221225472;
    v491 = v735;
    v735[2] = __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke;
    v735[3] = &__block_descriptor_33_e31_B16__0__opaqueCMSampleBuffer__8l;
    BOOL v736 = v550;
  }
  else
  {
    v491 = 0;
  }
  v499 = v112;
  if (v532)
  {
    v115 = [(BWInferenceConfiguration *)[BWPersonSemanticsConfiguration alloc] initWithInferenceType:104];
    [(BWInferenceConfiguration *)v115 setPriority:*(unsigned int *)(v542 + 52)];
    [(BWPersonSemanticsConfiguration *)v115 setAppliesFinalCropRect:v552];
    if (v515) {
      [(BWPersonSemanticsConfiguration *)v115 setEnabledSemantics:[(BWPersonSemanticsConfiguration *)v115 enabledSemantics] | 1];
    }
    v116 = (void *)[v22 supportedSemanticSegmentationMatteURNs];
    uint64_t v117 = *MEMORY[0x1E4F55FC8];
    if ([v116 containsObject:*MEMORY[0x1E4F55FC8]]
      && objc_msgSend((id)objc_msgSend(v22, "enabledSemanticSegmentationMatteURNs"), "containsObject:", v117))
    {
      [(BWPersonSemanticsConfiguration *)v115 setEnabledSemantics:[(BWPersonSemanticsConfiguration *)v115 enabledSemantics] | 2];
    }
    v118 = (void *)[v22 supportedSemanticSegmentationMatteURNs];
    uint64_t v119 = *MEMORY[0x1E4F55FD0];
    if ([v118 containsObject:*MEMORY[0x1E4F55FD0]]
      && objc_msgSend((id)objc_msgSend(v22, "enabledSemanticSegmentationMatteURNs"), "containsObject:", v119))
    {
      [(BWPersonSemanticsConfiguration *)v115 setEnabledSemantics:[(BWPersonSemanticsConfiguration *)v115 enabledSemantics] | 8];
    }
    v120 = (void *)[v22 supportedSemanticSegmentationMatteURNs];
    uint64_t v121 = *MEMORY[0x1E4F55FE0];
    if ([v120 containsObject:*MEMORY[0x1E4F55FE0]]
      && objc_msgSend((id)objc_msgSend(v22, "enabledSemanticSegmentationMatteURNs"), "containsObject:", v121))
    {
      [(BWPersonSemanticsConfiguration *)v115 setEnabledSemantics:[(BWPersonSemanticsConfiguration *)v115 enabledSemantics] | 0x10];
    }
    v122 = (void *)[v22 supportedSemanticSegmentationMatteURNs];
    uint64_t v123 = *MEMORY[0x1E4F55FC0];
    if ([v122 containsObject:*MEMORY[0x1E4F55FC0]]
      && objc_msgSend((id)objc_msgSend(v22, "enabledSemanticSegmentationMatteURNs"), "containsObject:", v123))
    {
      [(BWPersonSemanticsConfiguration *)v115 setEnabledSemantics:[(BWPersonSemanticsConfiguration *)v115 enabledSemantics] | 0x20];
    }
  }
  else
  {
    v115 = 0;
  }
  int v489 = v98;
  v733[0] = MEMORY[0x1E4F143A8];
  v733[1] = 3221225472;
  v733[2] = __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke_2;
  v733[3] = &__block_descriptor_33_e38___NSSet_16__0__opaqueCMSampleBuffer__8l;
  char v734 = v533;
  v732[0] = MEMORY[0x1E4F143A8];
  v732[1] = 3221225472;
  v732[2] = __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke_662;
  v732[3] = &unk_1E5C25A50;
  v732[4] = v733;
  if ([v22 allowsMultipleInflightCaptures])
  {
    uint64_t v124 = 1;
    if ([v22 responsiveShutterSupported])
    {
      if ([v22 responsiveShutterEnabled]) {
        uint64_t v124 = 2;
      }
      else {
        uint64_t v124 = 1;
      }
    }
  }
  else
  {
    uint64_t v124 = 0;
  }
  int v125 = [v22 redEyeReductionVersion];
  if (v125 && v125 <= 1) {
    goto LABEL_711;
  }
  int v519 = v125;
  int v126 = [v22 semanticRenderingVersion];
  id newValuea = (id)[MEMORY[0x1E4F1CA60] dictionary];
  int v498 = v126;
  if (v126) {
    unsigned int v511 = [v22 semanticDevelopmentVersion];
  }
  else {
    unsigned int v511 = 0;
  }
  int v521 = [v537 demosaicedRawEnabled];
  if (v521) {
    [newValuea setObject:BWSemanticSegmentationMatteAttachedMediaKeysSupportedByDemosaicedRaw() forKeyedSubscript:&unk_1EFAFE958];
  }
  int v127 = v556;
  if (v503)
  {
    v128 = (void *)[MEMORY[0x1E4F1CA48] array];
    [v128 addObject:0x1EFA6A200];
    [v128 addObjectsFromArray:BWInferenceLowResPersonInstanceMaskKeys()];
    [newValuea setObject:v128 forKeyedSubscript:&unk_1EFAFE970];
  }
  if ([v22 smartStyleReversibilityEnabled]) {
    [newValuea setObject:BWSemanticSegmentationMatteAttachedMediaKeysSupportedByDemosaicedRaw() forKeyedSubscript:&unk_1EFAFE988];
  }
  if (!objc_msgSend((id)objc_msgSend(v22, "portTypesWithGeometricDistortionCorrectionEnabled"), "count"))
  {
    int v136 = 0;
    goto LABEL_240;
  }
  uint64_t v129 = v91;
  long long v731 = 0u;
  long long v730 = 0u;
  long long v729 = 0u;
  long long v728 = 0u;
  uint64_t v130 = [v589 countByEnumeratingWithState:&v728 objects:v770 count:16];
  if (v130)
  {
    uint64_t v131 = v130;
    uint64_t v132 = *(void *)v729;
LABEL_227:
    uint64_t v133 = 0;
    while (1)
    {
      if (*(void *)v729 != v132) {
        objc_enumerationMutation(v589);
      }
      if (objc_msgSend((id)objc_msgSend(v22, "portTypesWithGeometricDistortionCorrectionEnabled"), "containsObject:", *(void *)(*((void *)&v728 + 1) + 8 * v133)))goto LABEL_234; {
      if (v131 == ++v133)
      }
      {
        uint64_t v131 = [v589 countByEnumeratingWithState:&v728 objects:v770 count:16];
        if (v131) {
          goto LABEL_227;
        }
        break;
      }
    }
  }
  if (v535)
  {
LABEL_234:
    int v134 = 1;
    goto LABEL_235;
  }
  if ([v22 deviceType] == 12) {
    int v134 = objc_msgSend((id)objc_msgSend(v22, "portTypesWithGeometricDistortionCorrectionEnabled"), "containsObject:", v524);
  }
  else {
    int v134 = 0;
  }
LABEL_235:
  if (v541) {
    int v135 = [v22 continuousZoomWithDepthSupported] | v134;
  }
  else {
    int v135 = 1;
  }
  uint64_t v91 = v129;
  int v136 = [v22 gdcInDCProcessorSupported] & v135;
  int v127 = v556;
LABEL_240:
  if (objc_msgSend((id)objc_msgSend(v22, "portTypesWithIntelligentDistortionCorrectionEnabled"), "count")) {
    int v137 = 1;
  }
  else {
    int v137 = v136;
  }
  int v490 = v136;
  int v488 = v137;
  if (v586)
  {
    if (v79 == 3) {
      int v136 = 0;
    }
  }
  else
  {
    int v136 = 0;
  }
  uint64_t v522 = v91;
  if (v127 >= (int)[v22 rawSensorDimensions]
    && ((int)v576 >= (int)((unint64_t)[v22 rawSensorDimensions] >> 32)
      ? (int v138 = v136)
      : (int v138 = 0),
        v138 == 1))
  {
    if (v545) {
      uint64_t v139 = [v22 gdcInDCProcessorOutputCropDimensions];
    }
    else {
      uint64_t v139 = [v22 outputStillImageDimensions];
    }
    uint64_t v475 = v139;
  }
  else
  {
    uint64_t v475 = 0;
  }
  int v500 = v136;
  v492 = v115;
  v140 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v22 gainMapMainImageDownscalingFactor];
  if (v141 != 0.0)
  {
    v142 = NSNumber;
    [v22 gainMapMainImageDownscalingFactor];
    objc_msgSend(v140, "setObject:forKeyedSubscript:", objc_msgSend(v142, "numberWithFloat:"), 0x1EFA4EB60);
  }
  uint64_t v538 = v124;
  if (v521)
  {
    [v140 setObject:&unk_1EFB058C8 forKeyedSubscript:0x1EFA745E0];
    long long v727 = 0u;
    long long v726 = 0u;
    long long v725 = 0u;
    long long v724 = 0u;
    id v595 = (id)[newValuea countByEnumeratingWithState:&v724 objects:v769 count:16];
    if (v595)
    {
      uint64_t v581 = *(void *)v725;
      do
      {
        for (uint64_t k = 0; k != v595; uint64_t k = (char *)k + 1)
        {
          if (*(void *)v725 != v581) {
            objc_enumerationMutation(newValuea);
          }
          uint64_t v144 = *(void *)(*((void *)&v724 + 1) + 8 * (void)k);
          long long v720 = 0u;
          long long v721 = 0u;
          long long v722 = 0u;
          long long v723 = 0u;
          v145 = (void *)[newValuea objectForKeyedSubscript:v144];
          uint64_t v146 = [v145 countByEnumeratingWithState:&v720 objects:v768 count:16];
          if (v146)
          {
            uint64_t v147 = v146;
            uint64_t v148 = *(void *)v721;
            do
            {
              for (uint64_t m = 0; m != v147; ++m)
              {
                if (*(void *)v721 != v148) {
                  objc_enumerationMutation(v145);
                }
                uint64_t v150 = *(void *)(*((void *)&v720 + 1) + 8 * m);
                v151 = NSNumber;
                [v22 ubInferenceMainImageDownscalingFactor];
                objc_msgSend(v140, "setObject:forKeyedSubscript:", objc_msgSend(v151, "numberWithFloat:"), v150);
              }
              uint64_t v147 = [v145 countByEnumeratingWithState:&v720 objects:v768 count:16];
            }
            while (v147);
          }
        }
        id v595 = (id)[newValuea countByEnumeratingWithState:&v724 objects:v769 count:16];
      }
      while (v595);
    }
  }
  if ([v22 smartStyleReversibilityEnabled])
  {
    [v140 setObject:&unk_1EFB058C8 forKeyedSubscript:0x1EFA74760];
    long long v719 = 0u;
    long long v718 = 0u;
    long long v717 = 0u;
    long long v716 = 0u;
    uint64_t v152 = [newValuea countByEnumeratingWithState:&v716 objects:v767 count:16];
    if (v152)
    {
      uint64_t v153 = v152;
      id v596 = *(id *)v717;
      do
      {
        for (uint64_t n = 0; n != v153; ++n)
        {
          if (*(id *)v717 != v596) {
            objc_enumerationMutation(newValuea);
          }
          uint64_t v155 = *(void *)(*((void *)&v716 + 1) + 8 * n);
          long long v712 = 0u;
          long long v713 = 0u;
          long long v714 = 0u;
          long long v715 = 0u;
          v156 = (void *)[newValuea objectForKeyedSubscript:v155];
          uint64_t v157 = [v156 countByEnumeratingWithState:&v712 objects:v766 count:16];
          if (v157)
          {
            uint64_t v158 = v157;
            uint64_t v159 = *(void *)v713;
            do
            {
              for (iuint64_t i = 0; ii != v158; ++ii)
              {
                if (*(void *)v713 != v159) {
                  objc_enumerationMutation(v156);
                }
                uint64_t v161 = *(void *)(*((void *)&v712 + 1) + 8 * ii);
                [v22 gainMapMainImageDownscalingFactor];
                if (v162 <= 0.0)
                {
                  [v22 portraitEffectsMatteMainImageDownscalingFactor];
                  float v164 = *(float *)&v163;
                  LODWORD(v163) = 2.0;
                  if (v164 > 0.0) {
                    objc_msgSend(v22, "portraitEffectsMatteMainImageDownscalingFactor", v163);
                  }
                }
                else
                {
                  [v22 gainMapMainImageDownscalingFactor];
                }
                objc_msgSend(v140, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v163), v161);
              }
              uint64_t v158 = [v156 countByEnumeratingWithState:&v712 objects:v766 count:16];
            }
            while (v158);
          }
        }
        uint64_t v153 = [newValuea countByEnumeratingWithState:&v716 objects:v767 count:16];
      }
      while (v153);
    }
  }
  v551 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v546 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v140];
  [v22 portraitEffectsMatteMainImageDownscalingFactor];
  if (v165 != 0.0)
  {
    if (v515)
    {
      v166 = NSNumber;
      [v22 portraitEffectsMatteMainImageDownscalingFactor];
      objc_msgSend(v551, "setObject:forKeyedSubscript:", objc_msgSend(v166, "numberWithFloat:"), 0x1EFA74420);
      if ((v552 & 1) == 0)
      {
        v167 = NSNumber;
        [v22 portraitEffectsMatteMainImageDownscalingFactor];
        objc_msgSend(v546, "setObject:forKeyedSubscript:", objc_msgSend(v167, "numberWithFloat:"), 0x1EFA74420);
      }
    }
    long long v711 = 0u;
    long long v710 = 0u;
    long long v709 = 0u;
    long long v708 = 0u;
    id v597 = (id)[v22 enabledSemanticSegmentationMatteURNs];
    uint64_t v168 = [v597 countByEnumeratingWithState:&v708 objects:v765 count:16];
    if (v168)
    {
      uint64_t v169 = v168;
      uint64_t v170 = *(void *)v709;
      uint64_t v171 = *MEMORY[0x1E4F55FC8];
      uint64_t v172 = *MEMORY[0x1E4F55FD0];
      uint64_t v582 = *MEMORY[0x1E4F55FE0];
      id v577 = (id)*MEMORY[0x1E4F55FC0];
      do
      {
        for (juint64_t j = 0; jj != v169; ++jj)
        {
          if (*(void *)v709 != v170) {
            objc_enumerationMutation(v597);
          }
          v174 = *(void **)(*((void *)&v708 + 1) + 8 * jj);
          char v175 = [v174 isEqualToString:v171];
          v176 = BWAttachedMediaKey_PersonSemanticsHair;
          if ((v175 & 1) == 0)
          {
            char v177 = [v174 isEqualToString:v172];
            v176 = BWAttachedMediaKey_PersonSemanticsSkin;
            if ((v177 & 1) == 0)
            {
              char v178 = [v174 isEqualToString:v582];
              v176 = BWAttachedMediaKey_PersonSemanticsTeeth;
              if ((v178 & 1) == 0)
              {
                int v179 = [v174 isEqualToString:v577];
                v176 = BWAttachedMediaKey_PersonSemanticsGlasses;
                if (!v179) {
                  continue;
                }
              }
            }
          }
          v180 = *v176;
          if (*v176)
          {
            v181 = NSNumber;
            [v22 portraitEffectsMatteMainImageDownscalingFactor];
            objc_msgSend(v551, "setObject:forKeyedSubscript:", objc_msgSend(v181, "numberWithFloat:"), v180);
            if ((v552 & 1) == 0)
            {
              v182 = NSNumber;
              [v22 portraitEffectsMatteMainImageDownscalingFactor];
              objc_msgSend(v546, "setObject:forKeyedSubscript:", objc_msgSend(v182, "numberWithFloat:"), v180);
            }
          }
        }
        uint64_t v169 = [v597 countByEnumeratingWithState:&v708 objects:v765 count:16];
      }
      while (v169);
    }
  }
  char v487 = [v22 allowedToModifyInputBuffers];
  if (v533)
  {
    uint64_t v183 = v542;
    int v184 = v538;
    v185 = v543;
    v186 = v534;
    int v187 = v535 ^ 1;
    if (+[BWInferenceEngine isNeuralEngineSupported])
    {
      char v478 = [v22 captureTimePhotosCurationSupported];
LABEL_319:
      unsigned int v480 = 0;
      goto LABEL_322;
    }
LABEL_318:
    char v478 = 0;
    goto LABEL_319;
  }
  uint64_t v183 = v542;
  int v184 = v538;
  v185 = v543;
  v186 = v534;
  int v187 = v535 ^ 1;
  if (!v532) {
    goto LABEL_318;
  }
  if (v535) {
    int v188 = 8 * [v573 count];
  }
  else {
    int v188 = 8;
  }
  char v478 = 0;
  unsigned int v480 = v188 - 1;
LABEL_322:
  uint64_t v189 = v506 & v501;
  int v529 = v535 | v525 | v567;
  if (v184 == 2)
  {
    unsigned int v190 = [v22 responsiveShutterSupported];
    int v191 = 0;
    if (v536) {
      int v192 = v187;
    }
    else {
      int v192 = 0;
    }
    unsigned int v507 = v190;
    if (v190 && v192)
    {
      int v191 = [v22 fastCapturePrioritizationEnabled];
      unsigned int v507 = 1;
    }
  }
  else
  {
    unsigned int v507 = 0;
    int v191 = 0;
  }
  int v494 = v191;
  [v186 setStillImageCaptureEnabled:1];
  [v186 setStereoPhotoCaptureEnabled:v567];
  objc_msgSend(v186, "setIrisFrameHarvestingEnabled:", objc_msgSend(v537, "irisFrameHarvestingEnabled"));
  objc_msgSend(v186, "setStillImageFusionScheme:", objc_msgSend(v22, "noiseReductionAndFusionScheme"));
  [v186 setUnifiedBracketingMode:v514];
  objc_msgSend(v186, "setSifrStillImageCaptureEnabledIfAvailable:", objc_msgSend(v22, "sifrStillImageCaptureEnabledIfAvailable"));
  objc_msgSend(v186, "setSoftISPEnabled:", objc_msgSend(v22, "softISPSupported"));
  [v186 setSensorRawStillImageOutputsEnabled:v536 != 0];
  objc_msgSend(v186, "setDeepFusionEnabled:", objc_msgSend(v22, "deepFusionSupported"));
  if ([v22 depthWithDeepFusionSupported])
  {
    unsigned int v193 = [v22 deepFusionSupported];
    if (v547 == 7) {
      unsigned int v194 = 0;
    }
    else {
      unsigned int v194 = v193;
    }
    unsigned int v195 = v541;
    uint64_t v196 = v541 & v194;
  }
  else
  {
    uint64_t v196 = 0;
    unsigned int v195 = v541;
  }
  [v186 setDepthWithDeepFusionEnabled:v196];
  [v186 setLearnedNRMode:v522];
  [v186 setLearnedNRUltraHighResolutionDowngradeEnabled:v508];
  objc_msgSend(v186, "setSwfrEnabled:", objc_msgSend(v22, "swfrVersion") != 0);
  objc_msgSend(v186, "setConstantColorEnabled:", objc_msgSend(v22, "constantColorVersion") != 0);
  unsigned int v497 = v189;
  [v186 setDigitalFlashEnabled:v189];
  objc_msgSend(v186, "setRedSaturationMitigationEnabled:", objc_msgSend(v537, "optimizesImagesForOfflineVideoStabilization") ^ 1);
  [v186 registerForAEMatrixMetadata];
  [v186 setRedEyeReductionEnabled:v519 != 0];
  if (v185) {
    uint64_t v197 = v195 & v187;
  }
  else {
    uint64_t v197 = 0;
  }
  [v186 setDisparityGenerationFromReferenceFramesSupported:v197];
  [v186 setSupplementalPointCloudCaptureDevice:v528];
  objc_msgSend(v186, "setExifFocalLengthsByZoomFactor:", objc_msgSend(v537, "exifFocalLengthsByZoomFactor"));
  v198 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage" priority:*(unsigned int *)(v183 + 48)];
  v548 = v198;
  v199 = v198;
  v583 = v198;
  if (v529)
  {
    v548 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.ub.default" priority:*(unsigned int *)(v183 + 48)];
    v199 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.multi" priority:*(unsigned int *)(v183 + 48)];
  }
  v568 = v198;
  if (v184 == 2)
  {
    v198 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.scale-and-encode" priority:*(unsigned int *)(v183 + 48)];
    if (v507) {
      v568 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.buffer-servicing" priority:*(unsigned int *)(v183 + 48)];
    }
    else {
      v568 = v583;
    }
  }
  v509 = v199;
  uint64_t v502 = (uint64_t)v198;
  v200 = (void *)v183;
  if (dword_1EB4C5690)
  {
    int v707 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EB4C5690)
    {
      int v707 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v202 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v202, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  v203 = &selRef_initWithWidth_height_pixelFormat_;
  if (v517)
  {
    v204 = [BWAttachedMediaSplitNode alloc];
    v761 = @"Depth";
    v205 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:](v204, "initWithAttachedMediaKeys:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v761 count:1]);
    v705.receiver = v200;
    v705.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
    v206 = v540;
    if ((objc_msgSendSuper2(&v705, sel_addNode_error_, v205, &v745) & 1) == 0) {
      goto LABEL_816;
    }
    v207 = a12;
    unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v517, -[BWNode input](v205, "input"), v568);
    if (v746) {
      goto LABEL_816;
    }
    [(BWNode *)v205 setName:@"Still Image IR-Depth Splitter"];
    [(BWAttachedMediaSplitNode *)v205 setEmitsNodeErrorsForMissingAttachedMedia:1];
    uint64_t v557 = [(NSArray *)[(BWNode *)v205 outputs] objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v557 = 0;
    v206 = v540;
    v207 = a12;
  }
  id obja = (id)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v573, "count", v465, v470));
  id v578 = (id)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v563, "count"));
  v518 = (void *)[v528 cameraInfoByPortType];
  if ([v22 stillImageSinkPipelineProcessingMode]
    && [v22 stillImageSinkPipelineProcessingMode] != 2)
  {
    id obja = (id)[v573 mutableCopy];
    id v578 = (id)[v563 mutableCopy];
    v208 = v583;
    if (v560)
    {
      uint64_t v569 = objc_msgSend(v573, "objectForKeyedSubscript:");
      int v558 = 0;
    }
    else
    {
      int v558 = 0;
      uint64_t v569 = 0;
    }
  }
  else
  {
    v208 = v583;
    if ([v22 stillImageSinkPipelineProcessingMode])
    {
      v209 = 0;
      v210 = v200;
      v211 = v573;
      v212 = &selRef__shouldEmitBuffer;
    }
    else
    {
      v209 = [[BWStillImageCoordinatorNode alloc] initWithCaptureDevice:v534 inputPortTypes:v544 sensorRawInputPortTypes:v553 highResStillImageDimensions:v513];
      v704.receiver = v200;
      v704.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
      v212 = &selRef__shouldEmitBuffer;
      v211 = v573;
      if ((objc_msgSendSuper2(&v704, sel_addNode_error_, v209, &v745) & 1) == 0) {
        goto LABEL_816;
      }
      [(BWNode *)v209 setName:@"Still Image Coordinator"];
      [(BWStillImageCoordinatorNode *)v209 setStillImageCaptureStatusDelegate:a9];
      [(BWStillImageCoordinatorNode *)v209 setResponsiveShutterEnabled:v507];
      if ([v22 responsiveShutterSupported]) {
        uint64_t v213 = [v22 responsiveShutterEnabled];
      }
      else {
        uint64_t v213 = 0;
      }
      [(BWStillImageCoordinatorNode *)v209 setResponsiveShutterEnabledViaAPI:v213];
      -[BWStillImageCoordinatorNode setFastCapturePrioritizationEnabled:](v209, "setFastCapturePrioritizationEnabled:", [v22 fastCapturePrioritizationEnabled]);
      [(BWStillImageCoordinatorNode *)v209 setStillImageCapturePipeliningMode:v538];
      -[BWStillImageCoordinatorNode setCinematicFramingWarpingRequired:](v209, "setCinematicFramingWarpingRequired:", [v22 cinematicFramingWarpingRequired]);
      if (v538 == 1) {
        [(BWStillImageCoordinatorNode *)v209 setMaxNumberOfBurstCapturesAllowedInFlight:2];
      }
      v200[7] = v209;
      v208 = v583;
      v210 = v200;
    }
    v214 = [[BWStillImageFrameCoordinatorNode alloc] initWithNodeConfiguration:v206 inputPortTypes:v544 sensorRawInputPortTypes:v553];
    v703.receiver = v210;
    v703.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
    if ((objc_msgSendSuper2(&v703, v212[164], v214, &v745) & 1) == 0) {
      goto LABEL_816;
    }
    [(BWNode *)v214 setName:@"Still Image Frame Coordinator"];
    long long v702 = 0u;
    long long v701 = 0u;
    long long v700 = 0u;
    long long v699 = 0u;
    uint64_t v215 = [v211 countByEnumeratingWithState:&v699 objects:v760 count:16];
    if (v215)
    {
      uint64_t v216 = v215;
      uint64_t v554 = *(void *)v700;
      do
      {
        for (kuint64_t k = 0; kk != v216; ++kk)
        {
          if (*(void *)v700 != v554) {
            objc_enumerationMutation(v211);
          }
          v218 = *(void **)(*((void *)&v699 + 1) + 8 * kk);
          uint64_t v219 = [v211 objectForKeyedSubscript:v218];
          if ([v218 isEqualToString:v560]) {
            uint64_t v220 = v557;
          }
          else {
            uint64_t v220 = v219;
          }
          if (v209)
          {
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v220, -[BWStillImageCoordinatorNode inputForPortType:](v209, "inputForPortType:", v218), v568);
            if (v746) {
              goto LABEL_816;
            }
            v208 = v583;
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[BWStillImageCoordinatorNode outputForPortType:](v209, "outputForPortType:", v218), -[BWStillImageFrameCoordinatorNode inputForPortType:](v214, "inputForPortType:", v218), v583);
            if (v746) {
              goto LABEL_816;
            }
          }
          else
          {
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v220, -[BWStillImageFrameCoordinatorNode inputForPortType:](v214, "inputForPortType:", v218), v208);
            if (v746) {
              goto LABEL_816;
            }
          }
          objc_msgSend(obja, "setObject:forKeyedSubscript:", -[BWStillImageFrameCoordinatorNode outputForPortType:](v214, "outputForPortType:", v218), v218);
          v211 = v573;
        }
        uint64_t v216 = [v573 countByEnumeratingWithState:&v699 objects:v760 count:16];
      }
      while (v216);
    }
    long long v698 = 0u;
    long long v697 = 0u;
    long long v696 = 0u;
    long long v695 = 0u;
    v221 = v563;
    uint64_t v222 = [v563 countByEnumeratingWithState:&v695 objects:v759 count:16];
    if (v222)
    {
      uint64_t v223 = v222;
      uint64_t v559 = *(void *)v696;
      do
      {
        for (muint64_t m = 0; mm != v223; ++mm)
        {
          if (*(void *)v696 != v559) {
            objc_enumerationMutation(v221);
          }
          uint64_t v225 = *(void *)(*((void *)&v695 + 1) + 8 * mm);
          uint64_t v226 = [v221 objectForKeyedSubscript:v225];
          if (v209)
          {
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v226, -[BWStillImageCoordinatorNode sensorRawInputForPortType:](v209, "sensorRawInputForPortType:", v225), v568);
            if (v746) {
              goto LABEL_816;
            }
            v208 = v583;
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[BWStillImageCoordinatorNode sensorRawOutputForPortType:](v209, "sensorRawOutputForPortType:", v225), -[BWStillImageFrameCoordinatorNode sensorRawInputForPortType:](v214, "sensorRawInputForPortType:", v225), v583);
            if (v746) {
              goto LABEL_816;
            }
          }
          else
          {
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v226, -[BWStillImageFrameCoordinatorNode sensorRawInputForPortType:](v214, "sensorRawInputForPortType:", v225), v208);
            if (v746) {
              goto LABEL_816;
            }
          }
          objc_msgSend(v578, "setObject:forKeyedSubscript:", -[BWStillImageFrameCoordinatorNode sensorRawOutputForPortType:](v214, "sensorRawOutputForPortType:", v225), v225);
          v221 = v563;
        }
        uint64_t v223 = [v563 countByEnumeratingWithState:&v695 objects:v759 count:16];
      }
      while (v223);
    }
    uint64_t v569 = [(BWStillImageFrameCoordinatorNode *)v214 outputForPortType:v560];
    v227 = objc_alloc_init(FigCaptureIrisPreparedSettings);
    int v228 = [v22 deepFusionSupported];
    if (v505) {
      unsigned int v229 = 2;
    }
    else {
      unsigned int v229 = 1;
    }
    if (v228) {
      uint64_t v230 = 3;
    }
    else {
      uint64_t v230 = v229;
    }
    [(FigCaptureIrisPreparedSettings *)v227 setQualityPrioritization:v230];
    [(FigCaptureIrisPreparedSettings *)v227 setDigitalFlashMode:v497];
    v762[1] = 0;
    v762[0] = 0;
    int v763 = 0;
    +[BWStillImageCoordinatorNode worstCaseMaxBracketedCaptureBufferCountForPreparedSettings:v227 stillImageCaptureSettings:0 captureDevice:v534];
    int v231 = v762[0];
    if (SLODWORD(v762[0]) <= SHIDWORD(v762[0])) {
      int v231 = HIDWORD(v762[0]);
    }
    int v558 = v231;
    v200 = (void *)v542;
    v207 = a12;
    v185 = v543;
    v203 = &selRef_initWithWidth_height_pixelFormat_;
  }
  uint64_t v232 = v524;
  if (v185) {
    char v233 = v529;
  }
  else {
    char v233 = 1;
  }
  if ((v233 & 1) == 0)
  {
    v234 = -[BWCrossoverNode initWithMediaType:numberOfInputs:]([BWCrossoverNode alloc], "initWithMediaType:numberOfInputs:", 1986618469, [v573 count]);
    v235 = (objc_class *)v203[457];
    v694.receiver = v200;
    v694.super_class = v235;
    if ((objc_msgSendSuper2(&v694, sel_addNode_error_, v234, &v745) & 1) == 0) {
      goto LABEL_816;
    }
    long long v693 = 0u;
    long long v692 = 0u;
    long long v691 = 0u;
    long long v690 = 0u;
    uint64_t v236 = [v573 countByEnumeratingWithState:&v690 objects:v758 count:16];
    if (v236)
    {
      uint64_t v237 = v236;
      int v238 = 0;
      uint64_t v239 = *(void *)v691;
LABEL_413:
      uint64_t v240 = 0;
      while (1)
      {
        if (*(void *)v691 != v239) {
          objc_enumerationMutation(v573);
        }
        unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", objc_msgSend(obja, "objectForKeyedSubscript:", *(void *)(*((void *)&v690 + 1) + 8 * v240)), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v234, "inputs"), "objectAtIndexedSubscript:", (v238 + v240)), v583);
        if (v746) {
          goto LABEL_816;
        }
        if (v237 == ++v240)
        {
          uint64_t v237 = [v573 countByEnumeratingWithState:&v690 objects:v758 count:16];
          v238 += v240;
          if (v237) {
            goto LABEL_413;
          }
          break;
        }
      }
    }
    uint64_t v241 = [(BWNode *)v234 output];
    uint64_t v232 = v524;
    [obja setObject:v241 forKeyedSubscript:v524];
    v200 = (void *)v542;
    v207 = a12;
    v208 = v583;
    v185 = v543;
    v203 = &selRef_initWithWidth_height_pixelFormat_;
    if (v536)
    {
      v242 = v563;
      v243 = -[BWCrossoverNode initWithMediaType:numberOfInputs:]([BWCrossoverNode alloc], "initWithMediaType:numberOfInputs:", 1986618469, [v563 count]);
      v689.receiver = (id)v542;
      v689.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
      if ((objc_msgSendSuper2(&v689, sel_addNode_error_, v243, &v745) & 1) == 0) {
        goto LABEL_816;
      }
      long long v688 = 0u;
      long long v687 = 0u;
      long long v686 = 0u;
      long long v685 = 0u;
      uint64_t v244 = [v563 countByEnumeratingWithState:&v685 objects:v757 count:16];
      if (v244)
      {
        uint64_t v245 = v244;
        int v246 = 0;
        uint64_t v247 = *(void *)v686;
LABEL_423:
        uint64_t v248 = 0;
        while (1)
        {
          if (*(void *)v686 != v247) {
            objc_enumerationMutation(v242);
          }
          unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", objc_msgSend(v578, "objectForKeyedSubscript:", *(void *)(*((void *)&v685 + 1) + 8 * v248)), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v243, "inputs"), "objectAtIndexedSubscript:", (v246 + v248)), v583);
          if (v746) {
            goto LABEL_816;
          }
          ++v248;
          v242 = v563;
          if (v245 == v248)
          {
            uint64_t v245 = [v563 countByEnumeratingWithState:&v685 objects:v757 count:16];
            v246 += v248;
            if (v245) {
              goto LABEL_423;
            }
            break;
          }
        }
      }
      uint64_t v249 = [(BWNode *)v243 output];
      uint64_t v232 = v524;
      [v578 setObject:v249 forKeyedSubscript:v524];
      v200 = (void *)v542;
      v208 = v583;
      v185 = v543;
      v203 = &selRef_initWithWidth_height_pixelFormat_;
    }
  }
  v574 = objc_alloc_init(BWPixelTransferNode);
  [(BWNode *)v574 setName:@"Still Image Format Converter"];
  -[BWPixelTransferNode setOutputColorSpaceProperties:](v574, "setOutputColorSpaceProperties:", [v22 outputColorSpaceProperties]);
  [(BWPixelTransferNode *)v574 setCropMode:3];
  [(BWPixelTransferNode *)v574 setMaxInputLossyCompressionLevel:3];
  -[BWPixelTransferNode setMaxOutputLossyCompressionLevel:](v574, "setMaxOutputLossyCompressionLevel:", [v22 maxLossyCompressionLevel]);
  [(BWPixelTransferNode *)v574 setConversionMethodForStillImagesDuringHDRVideos:1];
  if (v569)
  {
    unint64_t v250 = 0x1E5C1E000;
    if (v536)
    {
      id v251 = +[BWStillImageConditionalRouterDepthConfiguration depthConfiguration];
      v252 = [[BWStillImageConditionalRouterNode alloc] initWithRoutingConfiguration:v251];
      [(BWNode *)v252 setName:@"Depth Conditional Router"];
      objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v252, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v251, "yuvOutputIndex")), "setName:", @"YUV");
      objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v252, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v251, "rawOutputIndex")), "setName:", @"Raw");
      v684.receiver = v200;
      v684.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
      if ((objc_msgSendSuper2(&v684, sel_addNode_error_, v252, &v745) & 1) == 0) {
        goto LABEL_816;
      }
      unsigned int v746 = objc_msgSend(v207, "safelyConnectOutput:toInput:pipelineStage:", v569, -[BWNode input](v252, "input"), v208);
      if (v746) {
        goto LABEL_816;
      }
      uint64_t v569 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v252, "outputs"), "objectAtIndexedSubscript:", [v251 yuvOutputIndex]);
      uint64_t v253 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v252, "outputs"), "objectAtIndexedSubscript:", [v251 rawOutputIndex]);
      id v254 = -[BWDepthSynchronizerNode initForStreaming:maxQueueDepth:separateDepthComponentsEnabled:]([BWDepthSynchronizerNode alloc], "initForStreaming:maxQueueDepth:separateDepthComponentsEnabled:", 0, [v534 zeroShutterLagTimeMachineBufferCapacity]+ objc_msgSend(v22, "sifrStillImageCaptureEnabledIfAvailable"), 0);
      v683.receiver = v200;
      v683.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
      if ((objc_msgSendSuper2(&v683, sel_addNode_error_, v254, &v745) & 1) == 0) {
        goto LABEL_816;
      }
      [v254 setName:@"Still Image Raw Depth Synchronizer"];
      unsigned int v746 = objc_msgSend(v207, "safelyConnectOutput:toInput:pipelineStage:", objc_msgSend(v578, "objectForKeyedSubscript:", v524), objc_msgSend(v254, "imageInput"), v208);
      if (v746) {
        goto LABEL_816;
      }
      unsigned int v746 = objc_msgSend(v207, "safelyConnectOutput:toInput:pipelineStage:", v253, objc_msgSend(v254, "depthInput"), v208);
      if (v746) {
        goto LABEL_816;
      }
      uint64_t v255 = [v254 output];
      uint64_t v232 = v524;
      [v578 setObject:v255 forKeyedSubscript:v524];
      unint64_t v250 = 0x1E5C1E000uLL;
    }
    id v256 = (id)[objc_alloc(*(Class *)(v250 + 2200)) initForStreaming:0 separateDepthComponentsEnabled:0];
    v203 = &selRef_initWithWidth_height_pixelFormat_;
    v682.receiver = v200;
    v682.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
    if ((objc_msgSendSuper2(&v682, sel_addNode_error_, v256, &v745) & 1) == 0) {
      goto LABEL_816;
    }
    [v256 setName:@"Still Image YUV Depth Synchronizer"];
    unsigned int v746 = objc_msgSend(v207, "safelyConnectOutput:toInput:pipelineStage:", objc_msgSend(obja, "objectForKeyedSubscript:", v232), objc_msgSend(v256, "imageInput"), v208);
    if (v746) {
      goto LABEL_816;
    }
    unsigned int v746 = objc_msgSend(v207, "safelyConnectOutput:toInput:pipelineStage:", v569, objc_msgSend(v256, "depthInput"), v208);
    if (v746) {
      goto LABEL_816;
    }
    objc_msgSend(obja, "setObject:forKeyedSubscript:", objc_msgSend(v256, "output"), v232);
  }
  v257 = v200;
  uint64_t v570 = [obja objectForKeyedSubscript:v232];
  uint64_t v564 = [v578 objectForKeyedSubscript:v232];
  v258 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v258, "setObject:forKeyedSubscript:", objc_msgSend(v604, "objectForKeyedSubscript:", v232), v232);
  long long v681 = 0u;
  long long v680 = 0u;
  long long v679 = 0u;
  long long v678 = 0u;
  uint64_t v259 = [v185 countByEnumeratingWithState:&v678 objects:v756 count:16];
  if (v259)
  {
    uint64_t v260 = v259;
    uint64_t v261 = *(void *)v679;
    do
    {
      for (nuint64_t n = 0; nn != v260; ++nn)
      {
        if (*(void *)v679 != v261) {
          objc_enumerationMutation(v185);
        }
        objc_msgSend(v258, "setObject:forKeyedSubscript:", objc_msgSend(v604, "objectForKeyedSubscript:", *(void *)(*((void *)&v678 + 1) + 8 * nn)), *(void *)(*((void *)&v678 + 1) + 8 * nn));
      }
      uint64_t v260 = [v185 countByEnumeratingWithState:&v678 objects:v756 count:16];
    }
    while (v260);
  }
  v263 = v540;
  if (v560) {
    objc_msgSend(v258, "setObject:forKeyedSubscript:", objc_msgSend(v604, "objectForKeyedSubscript:", v560), v560);
  }
  v264 = v583;
  uint64_t v265 = (uint64_t)v257;
  if (v529)
  {
    v266 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", [v258 count], 1986618469);
    v267 = (objc_class *)v203[457];
    v677.receiver = (id)v265;
    v677.super_class = v267;
    if ((objc_msgSendSuper2(&v677, sel_addNode_error_, v266, &v745) & 1) == 0) {
      goto LABEL_816;
    }
    [(BWNode *)v266 setName:@"UB Funnel"];
    long long v676 = 0u;
    long long v675 = 0u;
    long long v674 = 0u;
    long long v673 = 0u;
    uint64_t v268 = [obja countByEnumeratingWithState:&v673 objects:v755 count:16];
    if (v268)
    {
      uint64_t v269 = v268;
      int v270 = 0;
      uint64_t v271 = *(void *)v674;
LABEL_455:
      uint64_t v272 = 0;
      while (1)
      {
        if (*(void *)v674 != v271) {
          objc_enumerationMutation(obja);
        }
        unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", objc_msgSend(obja, "objectForKeyedSubscript:", *(void *)(*((void *)&v673 + 1) + 8 * v272)), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v266, "inputs"), "objectAtIndexedSubscript:", (v270 + v272)), v548);
        if (v746) {
          goto LABEL_816;
        }
        if (v269 == ++v272)
        {
          uint64_t v269 = [obja countByEnumeratingWithState:&v673 objects:v755 count:16];
          v270 += v272;
          if (v269) {
            goto LABEL_455;
          }
          break;
        }
      }
    }
    uint64_t v570 = [(BWNode *)v266 output];
    if (v536)
    {
      v273 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", [v258 count], 1986618469);
      v672.receiver = (id)v542;
      v672.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
      if ((objc_msgSendSuper2(&v672, sel_addNode_error_, v273, &v745) & 1) == 0) {
        goto LABEL_816;
      }
      [(BWNode *)v273 setName:@"UB Sensor Raw Funnel"];
      long long v671 = 0u;
      long long v670 = 0u;
      long long v669 = 0u;
      long long v668 = 0u;
      uint64_t v274 = [v578 countByEnumeratingWithState:&v668 objects:v754 count:16];
      if (v274)
      {
        uint64_t v275 = v274;
        int v276 = 0;
        uint64_t v277 = *(void *)v669;
LABEL_465:
        uint64_t v278 = 0;
        while (1)
        {
          if (*(void *)v669 != v277) {
            objc_enumerationMutation(v578);
          }
          unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", objc_msgSend(v578, "objectForKeyedSubscript:", *(void *)(*((void *)&v668 + 1) + 8 * v278)), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v273, "inputs"), "objectAtIndexedSubscript:", (v276 + v278)), v548);
          if (v746) {
            goto LABEL_816;
          }
          if (v275 == ++v278)
          {
            uint64_t v275 = [v578 countByEnumeratingWithState:&v668 objects:v754 count:16];
            v276 += v278;
            if (v275) {
              goto LABEL_465;
            }
            break;
          }
        }
      }
      uint64_t v564 = [(BWNode *)v273 output];
    }
    uint64_t v265 = v542;
    v263 = v540;
    v264 = v583;
    v185 = v543;
    v203 = &selRef_initWithWidth_height_pixelFormat_;
  }
  v279 = (objc_class *)v203[457];
  v667.receiver = (id)v265;
  v667.super_class = v279;
  if (objc_msgSendSuper2(&v667, sel_addNode_error_, v574, &v745))
  {
    unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v570, -[BWNode input](v574, "input"), v264);
    if (!v746)
    {
      uint64_t v571 = [(BWNode *)v574 output];
      if (v494)
      {
        uint64_t v280 = [v22 rawSensorDimensions];
        if (!v185)
        {
          unint64_t v281 = FigCaptureDimensionsFromDictionaryRepresentation(objc_msgSend((id)objc_msgSend((id)objc_msgSend(v22, "dimensionsByQSubResolutionFlavorByPortType"), "objectForKeyedSubscript:", v524), "objectForKeyedSubscript:", &unk_1EFAFE958));
          if (FigCaptureVideoDimensionsAreValid(v281)) {
            uint64_t v280 = v281;
          }
        }
        v282 = [[BWCompressedShotBufferNode alloc] initWithNodeConfiguration:v263 compressionInputDimensions:v280];
        v283 = (objc_class *)v203[457];
        v666.receiver = (id)v265;
        v666.super_class = v283;
        if ((objc_msgSendSuper2(&v666, sel_addNode_error_, v282, &v745) & 1) == 0) {
          goto LABEL_816;
        }
        v284 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.compressed-shot-buffer" priority:*(unsigned int *)(v265 + 48)];
        v548 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.ub.default" priority:*(unsigned int *)(v265 + 48)];
        unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v571, -[BWNode input](v282, "input"), v284);
        if (v746) {
          goto LABEL_816;
        }
        uint64_t v571 = [(BWNode *)v282 output];
        unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v564, -[BWCompressedShotBufferNode sensorRawInput](v282, "sensorRawInput"), v284);
        if (v746) {
          goto LABEL_816;
        }
        uint64_t v564 = [(BWCompressedShotBufferNode *)v282 sensorRawOutput];
        [*(id *)(v265 + 56) setCompressedShotBuffer:v282];
        *(void *)(v265 + 64) = v282;
        v263 = v540;
      }
      if (v533)
      {
        if (v539 == 1) {
          int v285 = 1;
        }
        else {
          int v285 = 2;
        }
      }
      else
      {
        if (v535) {
          int v286 = [v258 count];
        }
        else {
          int v286 = 1;
        }
        int v285 = 8 * v286;
      }
      int v287 = [v22 constantColorVersion];
      if (v538 == 1) {
        int v288 = 4;
      }
      else {
        int v288 = 2;
      }
      if (v285 > v288) {
        int v288 = v285;
      }
      if (v287 > 0) {
        int v285 = v288;
      }
      if (v285 <= 2) {
        int v289 = 2;
      }
      else {
        int v289 = v285;
      }
      if (v538 == 1) {
        int v290 = v289;
      }
      else {
        int v290 = v285;
      }
      -[BWPhotonicEngineNodeConfiguration setSensorConfigurationsByPortType:](v263, (char *)v258);
      -[BWPhotonicEngineNodeConfiguration setInputIs10Bit:]((uint64_t)v263, [v22 inputIs10Bit]);
      -[BWPhotonicEngineNodeConfiguration setRetainedBufferCount:]((uint64_t)v263, v558);
      unsigned int v561 = v290;
      -[BWPhotonicEngineNodeConfiguration setOutputBufferCount:]((uint64_t)v263, v290);
      -[BWPhotonicEngineNodeConfiguration setMinimumOutputBufferCount:]((uint64_t)v263, v285);
      -[BWPhotonicEngineNodeConfiguration setMaxNumberOfBurstCapturesAllowedInFlight:]((uint64_t)v263, 2);
      -[BWPhotonicEngineNodeConfiguration setOutputPoolBackPressureEnabled:]((uint64_t)v263, v538 == 2);
      -[BWPhotonicEngineNodeConfiguration setStillImageFusionScheme:]((uint64_t)v263, [v22 noiseReductionAndFusionScheme]);
      [(BWStillImageNodeConfiguration *)v263 setFigThreadPriority:*(unsigned int *)(v265 + 48)];
      -[BWPhotonicEngineNodeConfiguration setReferenceFrameSelectionDelegate:]((uint64_t)v263, *(void *)(v265 + 56));
      -[BWPhotonicEngineNodeConfiguration setStandardFormatDimensions:]((uint64_t)v263, [v499 dimensions]);
      if (v500) {
        -[BWPhotonicEngineNodeConfiguration setOutputDimensions:]((uint64_t)v263, [v22 outputStillImageDimensions]);
      }
      -[BWPhotonicEngineNodeConfiguration setSoftISPSupportEnabled:]((uint64_t)v263, [v22 softISPSupported]);
      -[BWPhotonicEngineNodeConfiguration setQuadraProcessingSupportEnabled:]((uint64_t)v263, [v22 quadraProcessingSupportEnabled]);
      -[BWPhotonicEngineNodeConfiguration setSensorRawPixelFormat:]((uint64_t)v263, [v22 sensorRawPixelFormat]);
      -[BWPhotonicEngineNodeConfiguration setRawSensorDimensions:]((uint64_t)v263, [v22 rawSensorDimensions]);
      [v22 sensorCenterOffset];
      [(BWPhotonicEngineNodeConfiguration *)(uint64_t)v263 setSensorCenterOffset:v292];
      -[BWPhotonicEngineNodeConfiguration setDimensionsByQSubResolutionFlavorByPortType:](v263, (char *)[v22 dimensionsByQSubResolutionFlavorByPortType]);
      -[BWPhotonicEngineNodeConfiguration setUltraHighResolutionProcessingEnabled:]((uint64_t)v263, [v22 ultraHighResolutionProcessingEnabled]);
      -[BWPhotonicEngineNodeConfiguration setStillImageGDCSourceMode:]((uint64_t)v263, [v22 stillImageGDCSourceMode]);
      -[BWPhotonicEngineNodeConfiguration setSfhrMode:]((uint64_t)v263, [v22 sfhrMode]);
      -[BWPhotonicEngineNodeConfiguration setFusionSupportEnabled:]((uint64_t)v263, v505);
      -[BWPhotonicEngineNodeConfiguration setDigitalFlashSupportEnabled:]((uint64_t)v263, v497);
      -[BWPhotonicEngineNodeConfiguration setPortTypesWithRawNightModeEnabled:](v263, (char *)[v22 portTypesWithRawNightModeEnabled]);
      int v293 = [v22 deepFusionSupported];
      char v294 = 0;
      if (v293 && v539 != 1) {
        char v294 = !-[BWPhotonicEngineNodeConfiguration softISPSupportEnabled]((BOOL)v263);
      }
      -[BWPhotonicEngineNodeConfiguration setDeepFusionSyntheticsInNRSupportEnabled:]((uint64_t)v263, v294);
      int v295 = [v22 deepFusionSupported];
      if (v538 == 2) {
        char v296 = 0;
      }
      else {
        char v296 = v526;
      }
      if (v295) {
        char v297 = v296;
      }
      else {
        char v297 = 0;
      }
      -[BWPhotonicEngineNodeConfiguration setDeepFusionWaitForPreprocessingToFinish:]((uint64_t)v263, v297);
      -[BWPhotonicEngineNodeConfiguration setDeepFusionSupportEnabled:]((uint64_t)v263, [v22 deepFusionSupported]);
      if (v539 == 1) {
        char v298 = 1;
      }
      else {
        char v298 = v526;
      }
      if ((v298 & 1) != 0 || ((v514 == 2) & v522) != 0) {
        int v299 = [v22 deepZoomVersion];
      }
      else {
        int v299 = 0;
      }
      -[BWPhotonicEngineNodeConfiguration setDeepZoomVersion:]((uint64_t)v263, v299);
      -[BWPhotonicEngineNodeConfiguration setDeepZoomMode:]((uint64_t)v263, [v22 deepZoomMode]);
      -[BWPhotonicEngineNodeConfiguration setMaxDeepFusionOutputCount:]((uint64_t)v263, 1);
      -[BWPhotonicEngineNodeConfiguration setLearnedNRMode:]((uint64_t)v263, v522);
      -[BWPhotonicEngineNodeConfiguration setDepthDataDeliveryEnabled:]((uint64_t)v263, v541);
      if (v528)
      {
        v300 = [BWSensorConfiguration alloc];
        uint64_t v301 = objc_msgSend((id)objc_msgSend(v528, "captureStream"), "portType");
        uint64_t v302 = objc_msgSend((id)objc_msgSend(v528, "captureStream"), "sensorIDString");
        uint64_t v303 = v265;
        uint64_t v304 = objc_msgSend((id)objc_msgSend(v528, "captureStream"), "sensorIDDictionary");
        uint64_t v305 = objc_msgSend(v518, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v528, "captureStream"), "portType"));
        uint64_t v306 = v302;
        v263 = v540;
        uint64_t v307 = v304;
        uint64_t v265 = v303;
        -[BWPhotonicEngineNodeConfiguration setJasperSensorConfiguration:](v540, (char *)[(BWSensorConfiguration *)v300 initWithPortType:v301 sensorIDString:v306 sensorIDDictionary:v307 cameraInfo:v305]);
      }
      -[BWPhotonicEngineNodeConfiguration setCmiResourceEnabled:]((uint64_t)v263, 0);
      -[BWPhotonicEngineNodeConfiguration setAlwaysAllowModifyingInputBuffers:]((uint64_t)v263, v487);
      [v22 ubInferenceMainImageDownscalingFactor];
      -[BWPhotonicEngineNodeConfiguration setInferenceMainImageDownscalingFactor:]((uint64_t)v263, v308);
      -[BWPhotonicEngineNodeConfiguration setProvidedInferenceAttachedMediaByMode:](v263, (char *)newValuea);
      -[BWPhotonicEngineNodeConfiguration setSemanticRenderingVersion:]((uint64_t)v263, v498);
      -[BWPhotonicEngineNodeConfiguration setSemanticDevelopmentVersion:]((uint64_t)v263, v511);
      -[BWPhotonicEngineNodeConfiguration setSmartStyleRenderingVersion:]((uint64_t)v263, [v22 smartStyleRenderingVersion]);
      -[BWPhotonicEngineNodeConfiguration setSmartStyleReversibilityEnabled:]((uint64_t)v263, [v22 smartStyleReversibilityEnabled]);
      -[BWPhotonicEngineNodeConfiguration setSmartStyleLinearThumbnailDimensions:]((uint64_t)v263, [v22 smartStyleLinearThumbnailDimensions]);
      -[BWPhotonicEngineNodeConfiguration setSmartStyleStyledThumbnailDimensions:]((uint64_t)v263, [v22 smartStyleStyledThumbnailDimensions]);
      -[BWPhotonicEngineNodeConfiguration setGenerateInferencesForSemanticProcessingIfNeeded:]((uint64_t)v263, [v22 generateInferencesForSemanticProcessingIfNeeded]);
      -[BWPhotonicEngineNodeConfiguration setPersonSemanticsVersion:]((uint64_t)v263, v489);
      -[BWPhotonicEngineNodeConfiguration setSemanticStyleRenderingEnabled:]((uint64_t)v263, [v22 semanticStyleRenderingEnabled]);
      if (v525)
      {
        -[BWPhotonicEngineNodeConfiguration setPortTypesWithDepthSegmentationPortraitParameters:](v263, (char *)v589);
        -[BWPhotonicEngineNodeConfiguration setZoomingDisparityAllowed:]((uint64_t)v263, 1);
        -[BWPhotonicEngineNodeConfiguration setShouldComputeDisparityWhenCalibrationFails:]((uint64_t)v263, v512 ^ 1);
      }
      if (v541) {
        -[BWPhotonicEngineNodeConfiguration setContinuousZoomWithDepthSupported:]((uint64_t)v263, [v22 continuousZoomWithDepthSupported]);
      }
      -[BWPhotonicEngineNodeConfiguration setDemosaicedRawEnabled:]((uint64_t)v263, v521);
      if (v521) {
        -[BWPhotonicEngineNodeConfiguration setDemosaicedRawPixelFormat:]((uint64_t)v263, [v22 demosaicedRawPixelFormat]);
      }
      -[BWPhotonicEngineNodeConfiguration setRawColorCalibrationsByPortType:](v263, (char *)[v22 rawColorCalibrationsByPortType]);
      -[BWPhotonicEngineNodeConfiguration setRawLensShadingCorrectionCoefficientsByPortType:](v263, (char *)[v22 rawLensShadingCorrectionCoefficientsByPortType]);
      if (v488)
      {
        -[BWPhotonicEngineNodeConfiguration setIntelligentDistortionCorrectionVersion:]((uint64_t)v263, [v22 dcProcessorVersion]);
        if (v490) {
          v309 = (char *)[v22 portTypesWithGeometricDistortionCorrectionEnabled];
        }
        else {
          v309 = 0;
        }
        -[BWPhotonicEngineNodeConfiguration setPortTypesWithGeometricDistortionCorrectionEnabled:](v263, v309);
        -[BWPhotonicEngineNodeConfiguration setGeometricDistortionCorrectionExpandedImageDimensions:]((uint64_t)v263, v475);
        -[BWPhotonicEngineNodeConfiguration setPortTypesWithIntelligentDistortionCorrectionEnabled:](v263, (char *)[v22 portTypesWithIntelligentDistortionCorrectionEnabled]);
        -[BWPhotonicEngineNodeConfiguration setIntelligentDistortionCorrectionAppliesFinalDimensions:]((uint64_t)v263, !v586 | v500);
        -[BWPhotonicEngineNodeConfiguration setDcProcessingWithDepthSupported:]((uint64_t)v263, [v22 dcProcessingWithDepthSupported]);
      }
      -[BWPhotonicEngineNodeConfiguration setGreenGhostMitigationVersion:]((uint64_t)v263, [v22 greenGhostMitigationVersion]);
      -[BWPhotonicEngineNodeConfiguration setSwfrVersion:]((uint64_t)v263, [v22 swfrVersion]);
      -[BWPhotonicEngineNodeConfiguration setConstantColorVersion:]((uint64_t)v263, [v22 constantColorVersion]);
      -[BWPhotonicEngineNodeConfiguration setConstantColorClippingRecoveryEnabled:]((uint64_t)v263, [v22 constantColorClippingRecoveryEnabled]);
      -[BWPhotonicEngineNodeConfiguration setConstantColorSaturationBoostEnabled:]((uint64_t)v263, [v22 constantColorSaturationBoostEnabled]);
      [(BWStillImageNodeConfiguration *)v263 setStereoPhotoOutputDimensions:[(BWStillImageNodeConfiguration *)v263 stereoPhotoOutputDimensions]];
      -[BWPhotonicEngineNodeConfiguration setRedEyeReductionEnabled:]((uint64_t)v263, v519 > 1);
      [v22 gainMapMainImageDownscalingFactor];
      -[BWPhotonicEngineNodeConfiguration setGainMapMainImageDownscalingFactor:]((uint64_t)v263, v310);
      -[BWPhotonicEngineNodeConfiguration setHorizontalSensorBinningFactor:]((uint64_t)v263, [v22 horizontalSensorBinningFactor]);
      -[BWPhotonicEngineNodeConfiguration setVerticalSensorBinningFactor:]((uint64_t)v263, [v22 verticalSensorBinningFactor]);
      v311 = [[BWPhotonicEngineNode alloc] initWithNodeConfiguration:v263 captureDevice:v534];
      v312 = (objc_class *)v203[457];
      v313 = v311;
      v665.receiver = (id)v265;
      v665.super_class = v312;
      if (objc_msgSendSuper2(&v665, sel_addNode_error_, v311, &v745))
      {
        [(BWNode *)v313 setName:@"PhotonicEngine"];
        [*(id *)(v265 + 56) setStillImageProcessingSupportProvider:v313];
        unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v571, -[BWNode input](v313, "input"), v548);
        if (!v746
          && (!-[BWPhotonicEngineNodeConfiguration softISPSupportEnabled]((BOOL)v263)
           || !v536
           || (unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v564, -[BWPhotonicEngineNode sensorRawInput](v313, "sensorRawInput"), v548)) == 0))
        {
          if (v493)
          {
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v493, -[BWPhotonicEngineNode pointCloudInput](v313, "pointCloudInput"), v548);
            if (v746) {
              goto LABEL_816;
            }
          }
          else
          {
            uint64_t v314 = *MEMORY[0x1E4F52DE0];
            if ([v476 objectForKeyedSubscript:*MEMORY[0x1E4F52DE0]])
            {
              unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", objc_msgSend(v476, "objectForKeyedSubscript:", v314), -[BWPhotonicEngineNode pointCloudInput](v313, "pointCloudInput"), v548);
              if (v746) {
                goto LABEL_816;
              }
            }
          }
          v315 = [(BWNode *)v313 output];
          v579 = v313;
          if ((!v586 | v500))
          {
            v316 = v583;
          }
          else
          {
            v317 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
            [v22 gainMapMainImageDownscalingFactor];
            if (v318 != 0.0)
            {
              v319 = NSNumber;
              [v22 gainMapMainImageDownscalingFactor];
              objc_msgSend(v317, "setObject:forKeyedSubscript:", objc_msgSend(v319, "numberWithFloat:"), 0x1EFA4EB60);
            }
            v590 = v315;
            v320 = (void *)[MEMORY[0x1E4F1CA48] array];
            long long v661 = 0u;
            long long v662 = 0u;
            long long v663 = 0u;
            long long v664 = 0u;
            uint64_t v321 = [newValuea countByEnumeratingWithState:&v661 objects:v753 count:16];
            if (v321)
            {
              uint64_t v322 = v321;
              uint64_t v323 = *(void *)v662;
              do
              {
                for (uint64_t i1 = 0; i1 != v322; ++i1)
                {
                  if (*(void *)v662 != v323) {
                    objc_enumerationMutation(newValuea);
                  }
                  objc_msgSend(v320, "addObjectsFromArray:", objc_msgSend(newValuea, "objectForKeyedSubscript:", *(void *)(*((void *)&v661 + 1) + 8 * i1)));
                }
                uint64_t v322 = [newValuea countByEnumeratingWithState:&v661 objects:v753 count:16];
              }
              while (v322);
            }
            if (v521)
            {
              [v317 setObject:&unk_1EFB058C8 forKeyedSubscript:0x1EFA745E0];
              long long v660 = 0u;
              long long v659 = 0u;
              long long v658 = 0u;
              long long v657 = 0u;
              uint64_t v325 = [v320 countByEnumeratingWithState:&v657 objects:v752 count:16];
              if (v325)
              {
                uint64_t v326 = v325;
                uint64_t v327 = *(void *)v658;
                do
                {
                  for (uint64_t i2 = 0; i2 != v326; ++i2)
                  {
                    if (*(void *)v658 != v327) {
                      objc_enumerationMutation(v320);
                    }
                    uint64_t v329 = *(void *)(*((void *)&v657 + 1) + 8 * i2);
                    v330 = NSNumber;
                    [v22 ubInferenceMainImageDownscalingFactor];
                    objc_msgSend(v317, "setObject:forKeyedSubscript:", objc_msgSend(v330, "numberWithFloat:"), v329);
                  }
                  uint64_t v326 = [v320 countByEnumeratingWithState:&v657 objects:v752 count:16];
                }
                while (v326);
              }
            }
            v263 = v540;
            v331 = [[BWStillImageScalerNode alloc] initWithBasePoolCapacity:v561 nodeConfiguration:v540];
            [(BWNode *)v331 setName:@"Resizing"];
            -[BWStillImageScalerNode setResizedOutputDimensions:](v331, "setResizedOutputDimensions:", [v22 outputStillImageDimensions]);
            [(BWStillImageScalerNode *)v331 setBlackFillingRequired:0];
            [(BWStillImageScalerNode *)v331 setMainImageDownscalingFactorByAttachedMediaKey:v317];
            [(BWStillImageScalerNode *)v331 setPreferMainImageDownscalingFactorByAttachedMediaKeyFromSampleBuffer:1];
            uint64_t v265 = v542;
            v656.receiver = (id)v542;
            v656.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
            if ((objc_msgSendSuper2(&v656, sel_addNode_error_, v331, &v745) & 1) == 0)
            {
              FigDebugAssert3();
              int v409 = -12786;
              goto LABEL_712;
            }
            v316 = v583;
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v590, -[BWNode input](v331, "input"), v583);
            v185 = v543;
            v313 = v579;
            if (v746) {
              goto LABEL_816;
            }
            v315 = [(BWNode *)v331 output];
          }
          [(BWPixelTransferNode *)v574 setPreferredOutputPixelFormats:[(BWFormatRequirements *)[(BWNodeInput *)[(BWNode *)v313 input] formatRequirements] supportedPixelFormats]];
          [(BWPixelTransferNode *)v574 setConverting10BitVideoRangeTo8BitFullRangeEncouraged:1];
          if (((v552 | v504 ^ 1) & 1) == 0)
          {
            v332 = v316;
            v333 = objc_alloc_init(BWStillImageSmartStyleUnstyledBufferEmitterNode);
            [(id)v265 addNode:v333 error:0];
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v315, -[BWNode input](v333, "input"), v332);
            if (v746) {
              goto LABEL_816;
            }
            v315 = [(BWNode *)v333 output];
            v316 = v583;
          }
          if (v552)
          {
            v591 = v315;
            v762[0] = 0;
            v764 = 0;
            id newValuec = (id)[v22 depthDataDimensions];
            uint64_t v334 = [v22 smartStyleLinearThumbnailDimensions];
            uint64_t v335 = [v22 smartStyleStyledThumbnailDimensions];
            uint64_t v336 = v265;
            char v337 = [v22 smartStyleReversibilityEnabled];
            uint64_t v338 = [v22 constantColorConfidenceMapDimensions];
            char v339 = [v537 filterRenderingEnabled];
            unsigned __int8 v340 = FigCaptureVideoDimensionsAreValid([v22 depthDataDimensions]);
            v263 = v540;
            char v467 = v337;
            uint64_t v265 = v336;
            unsigned int v746 = -[FigCapturePhotonicEngineSinkPipeline _addScalerNodeWithName:nodeConfiguration:bravoConstituentPhotoDeliveryEnabled:mainImageDownscalingFactorByAttachedMediaKey:depthDataDimensions:smartStyleLinearThumbnailDimensions:smartStyleStyledThumbnailDimensions:smartStyleReversibilityEnabled:constantColorConfidenceMapDimensions:filterRenderingEnabled:enforcesZoomingForPortraitCaptures:backPressureDrivenPipelining:scalerNodeInputOut:scalerNodeOutputOut:](v336, @"Intermediate Scaler", v540, v535, (uint64_t)v546, (uint64_t)newValuec, v334, v335, v467, v338, v339, v340, v538 == 2, v762, (uint64_t *)&v764);
            if (v746) {
              goto LABEL_816;
            }
            v341 = v583;
            if (v538 == 2) {
              v341 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.intermediateScaler", *(unsigned int *)(v336 + 48), v583 priority];
            }
            unsigned int v746 = [a12 safelyConnectOutput:v591 toInput:v762[0] pipelineStage:v341];
            uint64_t v342 = a10;
            v185 = v543;
            if (v746) {
              goto LABEL_816;
            }
            v315 = v764;
            if (v504)
            {
              v343 = objc_alloc_init(BWStillImageSmartStyleUnstyledBufferEmitterNode);
              [(id)v265 addNode:v343 error:0];
              unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v315, -[BWNode input](v343, "input"), v583);
              if (v746) {
                goto LABEL_816;
              }
              v315 = [(BWNode *)v343 output];
            }
            v316 = v583;
          }
          else
          {
            uint64_t v342 = a10;
          }
          if (FigCaptureVideoDimensionsAreValid([v22 stereoPhotoOutputDimensions]))
          {
            [(BWNodeOutput *)v315 node];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              [(BWNodeOutput *)v315 node];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_711;
              }
            }
            id v344 = +[BWStillImageConditionalRouterStereoPhotoConfiguration stereoPhotoConfiguration];
            v345 = [[BWStillImageConditionalRouterNode alloc] initWithRoutingConfiguration:v344];
            [(BWNode *)v345 setName:@"Stereo Photo Conditional Router"];
            objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v345, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v344, "mainImageOutputIndex")), "setName:", @"Main");
            objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v345, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v344, "stereoPhotoOutoutIndex")), "setName:", @"StereoPhoto");
            v655.receiver = (id)v265;
            v655.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
            if ((objc_msgSendSuper2(&v655, sel_addNode_error_, v345, &v745) & 1) == 0) {
              goto LABEL_816;
            }
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v315, -[BWNode input](v345, "input"), v583);
            if (v746) {
              goto LABEL_816;
            }
            v315 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v345, "outputs"), "objectAtIndexedSubscript:", [v344 mainImageOutputIndex]);
            uint64_t v565 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v345, "outputs"), "objectAtIndexedSubscript:", [v344 stereoPhotoOutoutIndex]);
            v316 = v583;
          }
          else
          {
            uint64_t v565 = 0;
          }
          if (v531)
          {
            id v346 = +[BWStillImageConditionalRouterOptimizedEnhancedPortraitConfiguration optimizedEnhancedPortraitConfiguration];
            v347 = [[BWStillImageConditionalRouterNode alloc] initWithRoutingConfiguration:v346];
            [(BWNode *)v347 setName:@"Optimized Enhanced Portrait Router"];
            objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v347, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v346, "mainImageOutputIndex")), "setName:", @"Main");
            objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v347, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v346, "deepFusionImageOutputIndex")), "setName:", @"StandardRes");
            v654.receiver = (id)v265;
            v654.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
            if ((objc_msgSendSuper2(&v654, sel_addNode_error_, v347, &v745) & 1) == 0) {
              goto LABEL_816;
            }
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v315, -[BWNode input](v347, "input"), v583);
            if (v746) {
              goto LABEL_816;
            }
            v315 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v347, "outputs"), "objectAtIndexedSubscript:", [v346 deepFusionImageOutputIndex]);
            uint64_t v549 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v347, "outputs"), "objectAtIndexedSubscript:", [v346 mainImageOutputIndex]);
            unsigned int v348 = v523;
            v316 = v583;
          }
          else
          {
            uint64_t v549 = 0;
            unsigned int v348 = v523;
          }
          int v575 = v541 & v532 & v485 & v516;
          if (((v520 | v588) & (v486 ^ 1) & 1) != 0
            || v348 <= 9 && ((1 << v348) & 0x230) != 0)
          {
            goto LABEL_916;
          }
          int v410 = v503;
          if (v348 == 6) {
            int v410 = 1;
          }
          if (v410 == 1)
          {
LABEL_916:
            if ((v541 & 1) == 0 || v185) {
              goto LABEL_711;
            }
            v349 = [[BWInferenceNode alloc] initWithScheduler:v342 priority:*(unsigned int *)(v265 + 52)];
            v350 = v349;
            if (v348 == 6)
            {
              [(BWNode *)v349 setName:@"MonocularDepth"];
              uint64_t v351 = BWInferenceVersionMakeMajor(1);
              v352 = [[BWMonocularDepthConfiguration alloc] initWithInferenceType:106 monocularDepthType:2];
              uint64_t v353 = v351 & 0xFFFFFFFFFFFFLL;
              unsigned int v348 = v523;
              [(BWInferenceNode *)v350 addInferenceOfType:106 version:v353 configuration:v352];
              v354 = v527;
            }
            else
            {
              v354 = v527;
              if (((v520 | v588) & (v486 ^ 1) & 1) != 0
                || v348 <= 9 && ((1 << v348) & 0x230) != 0)
              {
                [(BWNode *)v349 setName:@"RGB Segmentation"];
                [(BWInferenceNode *)v350 addInferenceOfType:103 version:+[BWRGBPersonSegmentationInferenceConfiguration portraitVersion] & 0xFFFFFFFFFFFFLL];
              }
            }
            if (-[FigCapturePhotonicEngineSinkPipeline _addLandmarksInferenceToNode:](v265, v350)) {
              goto LABEL_711;
            }
            v653.receiver = (id)v265;
            v653.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
            if ((objc_msgSendSuper2(&v653, sel_addNode_error_, v350, &v745) & 1) == 0) {
              goto LABEL_816;
            }
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v315, -[BWNode input](v350, "input"), v583);
            if (v746) {
              goto LABEL_816;
            }
            uint64_t v355 = [(BWNode *)v350 output];
            v315 = (BWNodeOutput *)v355;
            if (v575)
            {
              uint64_t v356 = v355;
              v357 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.person-semantics" priority:*(unsigned int *)(v265 + 48)];
              v358 = [[BWFanOutNode alloc] initWithFanOutCount:2 mediaType:1986618469];
              [(BWNode *)v358 setName:@"Concurrent PersonSemantics / DepthProcessing Fan Out"];
              v652.receiver = (id)v265;
              v652.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
              if ((objc_msgSendSuper2(&v652, sel_addNode_error_, v358, &v745) & 1) == 0) {
                goto LABEL_816;
              }
              unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v356, -[BWNode input](v358, "input"), v509);
              if (v746) {
                goto LABEL_816;
              }
              uint64_t v359 = [(NSArray *)[(BWNode *)v358 outputs] objectAtIndexedSubscript:0];
              int v360 = v495;
              if (v523 == 6) {
                int v360 = 1;
              }
              if (v360 == 1)
              {
                v361 = [BWAttachedMediaSplitNode alloc];
                v751[0] = @"PrimaryFormat";
                v751[1] = @"Depth";
                v362 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:](v361, "initWithAttachedMediaKeys:", [MEMORY[0x1E4F1C978] arrayWithObjects:v751 count:2]);
                [(BWNode *)v362 setName:@"Unprocessed DepthData Discarder"];
                v651.receiver = (id)v265;
                v651.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
                if ((objc_msgSendSuper2(&v651, sel_addNode_error_, v362, &v745) & 1) == 0) {
                  goto LABEL_816;
                }
                unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v359, -[BWNode input](v362, "input"), v357);
                if (v746) {
                  goto LABEL_816;
                }
                uint64_t v359 = [(BWNode *)v362 output];
              }
              v363 = [[BWInferenceNode alloc] initWithScheduler:v342 priority:*(unsigned int *)(v265 + 52)];
              [(BWInferenceNode *)v363 addInferenceOfType:104 version:Major & 0xFFFFFFFFFFFFLL configuration:v492];
              [(BWNode *)v363 setName:@"Person Semantics"];
              [v22 portraitEffectsMatteMainImageDownscalingFactor];
              if (-[FigCapturePhotonicEngineSinkPipeline _addMattingInferenceToNode:mattingVersion:learnedMattingVersion:mainImageDownscalingFactor:targetAspectRatio:appliesFinalCropRect:enabledSemantics:metalCommandQueue:mattingSensorConfigurationsByPortType:clientIsCameraOrDerivative:requiredAdditionalInferenceOutputBuffers:](v265, v363, v482, v481, v552, [(BWPersonSemanticsConfiguration *)v492 enabledSemantics], (uint64_t)[(BWStillImageNodeConfiguration *)v540 metalCommandQueue], (uint64_t)v527, v364, v113, v533, v480))goto LABEL_711; {
              [(BWInferenceNode *)v363 setIgnoreInvalidContentInformationForPrimaryMedia:v520 & v484 | v588];
              }
              [(BWInferenceNode *)v363 setInferenceTypesToSkipResolver:v733];
              [(BWInferenceNode *)v363 setBackPressureDrivenPipelining:v538 == 2];
              v650.receiver = (id)v265;
              v650.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
              if ((objc_msgSendSuper2(&v650, sel_addNode_error_, v363, &v745) & 1) == 0) {
                goto LABEL_816;
              }
              unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v359, -[BWNode input](v363, "input"), v357);
              v354 = v527;
              if (v746) {
                goto LABEL_816;
              }
              uint64_t v572 = [(BWNode *)v363 output];
              int v562 = 1;
              v315 = [(NSArray *)[(BWNode *)v358 outputs] objectAtIndexedSubscript:1];
              int v555 = 1;
              v263 = v540;
              unsigned int v348 = v523;
            }
            else
            {
              uint64_t v572 = 0;
              int v555 = 0;
              int v562 = 1;
            }
            v316 = v583;
          }
          else
          {
            uint64_t v572 = 0;
            int v562 = 0;
            int v555 = 0;
            v354 = v527;
            if (!v541) {
              goto LABEL_628;
            }
          }
          if (v348 <= 9 && ((1 << v348) & 0x230) != 0)
          {
            uint64_t v365 = [v22 depthDataDimensions];
            if ([v354 count] != 1) {
              goto LABEL_711;
            }
            uint64_t v366 = objc_msgSend((id)objc_msgSend(v354, "allValues"), "firstObject");
            if (!v366) {
              goto LABEL_711;
            }
            v367 = [[BWStillImageFocusPixelDisparityNode alloc] initWithNodeConfiguration:v263 sensorConfiguration:v366 disparityMapWidth:(int)v365 disparityMapHeight:v365 >> 32 depthIsAlwaysHighQuality:v533];
            v649.receiver = (id)v265;
            v649.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
            if ((objc_msgSendSuper2(&v649, sel_addNode_error_, v367, &v745) & 1) == 0) {
              goto LABEL_816;
            }
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v315, -[BWNode input](v367, "input"), v583);
            if (v746) {
              goto LABEL_816;
            }
            v315 = [(BWNode *)v367 output];
            unsigned int v348 = v523;
            v316 = v583;
          }
LABEL_628:
          if (v525)
          {
            v368 = v315;
            id v369 = +[BWStillImageConditionalRouterInferenceConfiguration inferenceConfiguration];
            v370 = [[BWStillImageConditionalRouterNode alloc] initWithRoutingConfiguration:v369];
            [(BWNode *)v370 setName:@"Inference Conditional Router"];
            objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v370, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v369, "defaultOutputIndex")), "setName:", @"Default");
            objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v370, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v369, "inferenceOuputIndex")), "setName:", @"Inference");
            v648.receiver = (id)v265;
            v648.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
            if ((objc_msgSendSuper2(&v648, sel_addNode_error_, v370, &v745) & 1) == 0) {
              goto LABEL_816;
            }
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v368, -[BWNode input](v370, "input"), v583);
            if (v746) {
              goto LABEL_816;
            }
            uint64_t v371 = v265;
            v372 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.inference.bravo" priority:*(unsigned int *)(v265 + 48)];
            v373 = (void *)v371;
            v374 = [[BWInferenceNode alloc] initWithScheduler:v342 priority:*(unsigned int *)(v371 + 52)];
            if (((v515 | v562) & 1) == 0)
            {
              if (-[FigCapturePhotonicEngineSinkPipeline _addLandmarksInferenceToNode:](v371, v374)) {
                goto LABEL_711;
              }
              LOBYTE(v562) = 1;
            }
            if (v575)
            {
              v375 = [(BWNode *)v374 name];
              uint64_t v376 = [(NSString *)v375 length];
              v377 = @"Person Semantics";
              if (v376) {
                v377 = [(NSString *)v375 stringByAppendingFormat:@" + %@", @"Person Semantics"];
              }
              [(BWNode *)v374 setName:v377];
              [(BWInferenceNode *)v374 addInferenceOfType:104 version:Major & 0xFFFFFFFFFFFFLL configuration:v492];
              [v22 portraitEffectsMatteMainImageDownscalingFactor];
              if (-[FigCapturePhotonicEngineSinkPipeline _addMattingInferenceToNode:mattingVersion:learnedMattingVersion:mainImageDownscalingFactor:targetAspectRatio:appliesFinalCropRect:enabledSemantics:metalCommandQueue:mattingSensorConfigurationsByPortType:clientIsCameraOrDerivative:requiredAdditionalInferenceOutputBuffers:]((uint64_t)v373, v374, v482, v481, v552, [(BWPersonSemanticsConfiguration *)v492 enabledSemantics], (uint64_t)[(BWStillImageNodeConfiguration *)v540 metalCommandQueue], (uint64_t)v527, v378, v113, v533, v480))goto LABEL_711; {
              int v555 = 1;
              }
            }
            [(BWInferenceNode *)v374 setInferenceTypesToSkipResolver:v733];
            [(BWInferenceNode *)v374 setBackPressureDrivenPipelining:v538 == 2];
            v647.receiver = v373;
            v647.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
            if ((objc_msgSendSuper2(&v647, sel_addNode_error_, v374, &v745) & 1) == 0) {
              goto LABEL_816;
            }
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v370, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v369, "inferenceOuputIndex")), -[BWNode input](v374, "input"), v372);
            if (v746) {
              goto LABEL_816;
            }
            v379 = [[BWInferenceSynchronizerNode alloc] initWithIndexOfInputProvidingOutputSampleBuffer:1 indexOfInputProvidingPreferredInferences:1 errorHandlingModel:0];
            [(BWNode *)v379 setName:@"Disparity/Inference Sync"];
            [(BWInferenceSynchronizerNode *)v379 setSynchronizesTopLevelAttachments:1];
            [(BWInferenceSynchronizerNode *)v379 setSynchronizeInferencesResolver:v491];
            v646.receiver = v373;
            v646.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
            if ((objc_msgSendSuper2(&v646, sel_addNode_error_, v379, &v745) & 1) == 0) {
              goto LABEL_816;
            }
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v370, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v369, "defaultOutputIndex")), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v379, "inputs"), "objectAtIndexedSubscript:", 0), v509);
            if (v746) {
              goto LABEL_816;
            }
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[BWNode output](v374, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v379, "inputs"), "objectAtIndexedSubscript:", 1), v509);
            unsigned int v348 = v523;
            if (v746) {
              goto LABEL_816;
            }
          }
          else
          {
            if (!v535)
            {
LABEL_663:
              int v392 = v520;
              if (v348 == 6) {
                int v392 = 1;
              }
              if ((v392 | v588) == 1)
              {
                if ([v354 count] != 1) {
                  goto LABEL_711;
                }
                v393 = objc_msgSend((id)objc_msgSend(v354, "allValues"), "firstObject");
                if (!v393) {
                  goto LABEL_711;
                }
                LOBYTE(v466) = v538 == 2;
                v263 = v540;
                v394 = -[BWDepthConverterNode initWithStillImageNodeConfiguration:cameraInfoByPortType:sensorIDDictionary:rgbPersonSegmentationEnabled:depthIsAlwaysHighQuality:depthOriginatesFromNeuralNetwork:backPressureDrivenPipelining:]([BWDepthConverterNode alloc], "initWithStillImageNodeConfiguration:cameraInfoByPortType:sensorIDDictionary:rgbPersonSegmentationEnabled:depthIsAlwaysHighQuality:depthOriginatesFromNeuralNetwork:backPressureDrivenPipelining:", v540, v598, [v393 sensorIDDictionary], ((v520 | v588) & (v486 ^ 1) | v474) & 1, v533, v348 == 6, v466);
                uint64_t v265 = v542;
                v637.receiver = (id)v542;
                v637.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
                if ((objc_msgSendSuper2(&v637, sel_addNode_error_, v394, &v745) & 1) == 0) {
                  goto LABEL_816;
                }
                [(BWNode *)v394 setName:@"Still Image Depth Converter"];
                -[BWDepthConverterNode setHorizontalSensorBinningFactor:](v394, "setHorizontalSensorBinningFactor:", [v22 horizontalSensorBinningFactor]);
                -[BWDepthConverterNode setVerticalSensorBinningFactor:](v394, "setVerticalSensorBinningFactor:", [v22 verticalSensorBinningFactor]);
                [(BWDepthConverterNode *)v394 setSkipSmartStyleBuffer:v504];
                [(BWDepthConverterNode *)v394 setStillGDRFilteringSupportEnabled:1];
                [(BWDepthConverterNode *)v394 setOutputFormat:1751411059];
                -[BWDepthConverterNode setOutputDimensions:](v394, "setOutputDimensions:", [v22 depthDataDimensions]);
                [(BWDepthConverterNode *)v394 setBaseRotationDegrees:90];
                v395 = v583;
                if (v538 == 2) {
                  v395 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.depthConverter" priority:*(unsigned int *)(v542 + 48)];
                }
                unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v315, -[BWNode input](v394, "input"), v395);
                uint64_t v342 = a10;
                if (v746) {
                  goto LABEL_816;
                }
                *(void *)(v542 + 88) = v394;
                v315 = [(BWNode *)v394 output];
                unsigned int v348 = v523;
              }
              if (v572)
              {
                v396 = [[BWInferenceSynchronizerNode alloc] initWithIndexOfInputProvidingOutputSampleBuffer:0 indexOfInputProvidingPreferredInferences:1 errorHandlingModel:0];
                [(BWNode *)v396 setName:@"DepthData Processing / PersonSemantics"];
                v636[0] = MEMORY[0x1E4F143A8];
                v636[1] = 3221225472;
                v636[2] = __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke_911;
                v636[3] = &unk_1E5C25A78;
                v636[4] = v732;
                v636[5] = v491;
                [(BWInferenceSynchronizerNode *)v396 setSynchronizeInferencesResolver:v636];
                v635.receiver = (id)v265;
                v635.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
                if ((objc_msgSendSuper2(&v635, sel_addNode_error_, v396, &v745) & 1) == 0) {
                  goto LABEL_816;
                }
                unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v315, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v396, "inputs"), "objectAtIndexedSubscript:", 0), v509);
                if (v746) {
                  goto LABEL_816;
                }
                unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v572, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v396, "inputs"), "objectAtIndexedSubscript:", 1), v509);
                if (v746) {
                  goto LABEL_816;
                }
                v315 = [(BWNode *)v396 output];
                uint64_t v342 = a10;
              }
              if (!v532)
              {
                v402 = &selRef_initWithWidth_height_pixelFormat_;
                goto LABEL_729;
              }
              if (v562)
              {
LABEL_686:
                if (v575)
                {
                  if ([(FigCaptureCameraParameters *)v599 complementMatteSuppressionDecisionWithISPDetectedFaces])
                  {
                    int v400 = 4;
                  }
                  else
                  {
                    int v400 = 2;
                  }
                  v401 = [[BWMatteMediaSuppressionNode alloc] initWithBehavior:v400 | v512];
                  [(BWNode *)v401 setName:@"Matting Media Suppression Node"];
                  -[BWMatteMediaSuppressionNode setSmartStyleReversibilityEnabled:](v401, "setSmartStyleReversibilityEnabled:", [v22 smartStyleReversibilityEnabled]);
                  v402 = &selRef_initWithWidth_height_pixelFormat_;
                  v633.receiver = (id)v265;
                  v633.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
                  if ((objc_msgSendSuper2(&v633, sel_addNode_error_, v401, &v745) & 1) == 0) {
                    goto LABEL_816;
                  }
                  unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v315, -[BWNode input](v401, "input"), v583);
                  if (v746) {
                    goto LABEL_816;
                  }
                  goto LABEL_728;
                }
                v593 = v315;
                id v403 = +[BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration personSegmentationAndMattingConfiguration];
                v404 = [[BWStillImageConditionalRouterNode alloc] initWithRoutingConfiguration:v403];
                [(BWNode *)v404 setName:@"Matting Conditional Router"];
                objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v404, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v403, "defaultOutputIndex")), "setName:", @"Default");
                objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v404, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v403, "personSegmentationAndMattingOuputIndex")), "setName:", @"Segmentation&Matting");
                v632.receiver = (id)v265;
                v632.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
                if (objc_msgSendSuper2(&v632, sel_addNode_error_, v404, &v745))
                {
                  v405 = [[BWInferenceNode alloc] initWithScheduler:v342 priority:*(unsigned int *)(v265 + 52)];
                  v406 = v405;
                  if ((v555 & 1) == 0)
                  {
                    [(BWInferenceNode *)v405 addInferenceOfType:104 version:Major & 0xFFFFFFFFFFFFLL configuration:v492];
                    [(BWNode *)v406 setName:@"PersonSemantics"];
                  }
                  [v22 portraitEffectsMatteMainImageDownscalingFactor];
                  if (-[FigCapturePhotonicEngineSinkPipeline _addMattingInferenceToNode:mattingVersion:learnedMattingVersion:mainImageDownscalingFactor:targetAspectRatio:appliesFinalCropRect:enabledSemantics:metalCommandQueue:mattingSensorConfigurationsByPortType:clientIsCameraOrDerivative:requiredAdditionalInferenceOutputBuffers:](v542, v406, v482, v481, v552, [(BWPersonSemanticsConfiguration *)v492 enabledSemantics], (uint64_t)[(BWStillImageNodeConfiguration *)v263 metalCommandQueue], (uint64_t)v527, v407, v113, v533, v480))goto LABEL_711; {
                  [(BWInferenceNode *)v406 setIgnoreInvalidContentInformationForPrimaryMedia:v520 & v484 | v588];
                  }
                  [(BWInferenceNode *)v406 setInferenceTypesToSkipResolver:v733];
                  v631.receiver = (id)v542;
                  v631.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
                  if (objc_msgSendSuper2(&v631, sel_addNode_error_, v406, &v745))
                  {
                    uint64_t v408 = v531 & v530 | v473 ? 3 : 2;
                    v401 = [[BWFunnelNode alloc] initWithNumberOfInputs:v408 mediaType:1986618469];
                    [(BWNode *)v401 setName:@"Matting Funnel"];
                    v630.receiver = (id)v542;
                    v630.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
                    if (objc_msgSendSuper2(&v630, sel_addNode_error_, v401, &v745))
                    {
                      unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v593, -[BWNode input](v404, "input"), v583);
                      if (!v746)
                      {
                        unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v404, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v403, "defaultOutputIndex")), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v401, "inputs"), "objectAtIndexedSubscript:", 0), v583);
                        if (!v746)
                        {
                          unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v404, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v403, "personSegmentationAndMattingOuputIndex")), -[BWNode input](v406, "input"), v583);
                          if (!v746)
                          {
                            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[BWNode output](v406, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v401, "inputs"), "objectAtIndexedSubscript:", 1), v583);
                            v263 = v540;
                            if (!v746)
                            {
                              unsigned int v348 = v523;
                              uint64_t v265 = v542;
                              v354 = v527;
                              if (v531 & v530)
                              {
                                if (v549) {
                                  goto LABEL_709;
                                }
                              }
                              else
                              {
                                if (v549) {
                                  char v411 = v473;
                                }
                                else {
                                  char v411 = 0;
                                }
                                if (v411)
                                {
LABEL_709:
                                  unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v549, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v401, "inputs"), "objectAtIndexedSubscript:", 2), v583);
                                  v402 = &selRef_initWithWidth_height_pixelFormat_;
                                  if (v746) {
                                    goto LABEL_816;
                                  }
                                  goto LABEL_728;
                                }
                              }
                              v402 = &selRef_initWithWidth_height_pixelFormat_;
LABEL_728:
                              v315 = [(BWNode *)v401 output];
LABEL_729:
                              if (v531)
                              {
                                if (v348 <= 9 && ((1 << v348) & 0x230) != 0)
                                {
                                  v412 = [[BWStillImageStandardResolutionAttachmentTransferNode alloc] initWithNodeConfiguration:v263];
                                  v413 = (objc_class *)v402[457];
                                  v629.receiver = (id)v265;
                                  v629.super_class = v413;
                                  if ((objc_msgSendSuper2(&v629, sel_addNode_error_, v412, &v745) & 1) == 0) {
                                    goto LABEL_816;
                                  }
                                  unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v315, -[BWNode input](v412, "input"), v583);
                                  uint64_t v414 = v479;
                                  if (v746) {
                                    goto LABEL_816;
                                  }
                                  goto LABEL_738;
                                }
                                if (v530) {
                                  goto LABEL_740;
                                }
                                v462 = [[BWInferenceSynchronizerNode alloc] initWithIndexOfInputProvidingOutputSampleBuffer:0 indexOfInputProvidingPreferredInferences:1 errorHandlingModel:0];
                                [(BWNode *)v462 setName:@"24MP/12MP Inference Synchronizer"];
                                -[BWInferenceSynchronizerNode setAttachedMediaKeysToSkip:](v462, "setAttachedMediaKeysToSkip:", [MEMORY[0x1E4F1CAD0] setWithObject:0x1EFA4EB60]);
                                [(BWInferenceSynchronizerNode *)v462 setAllowOutOfOrderInputs:1];
                                v628[0] = MEMORY[0x1E4F143A8];
                                v628[1] = 3221225472;
                                v628[2] = __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke_2_946;
                                v628[3] = &unk_1E5C25A50;
                                v628[4] = v491;
                                [(BWInferenceSynchronizerNode *)v462 setSynchronizeInferencesResolver:v628];
                                v463 = (objc_class *)v402[457];
                                v627.receiver = (id)v265;
                                v627.super_class = v463;
                                uint64_t v414 = v479;
                                if ((objc_msgSendSuper2(&v627, sel_addNode_error_, v462, &v745) & 1) == 0) {
                                  goto LABEL_816;
                                }
                                unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v549, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v462, "inputs"), "objectAtIndexedSubscript:", 0), v509);
                                if (v746) {
                                  goto LABEL_816;
                                }
                                unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v315, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v462, "inputs"), "objectAtIndexedSubscript:", 1), v509);
                                if (v746) {
                                  goto LABEL_816;
                                }
                                v315 = [(BWNode *)v462 output];
                                if (!v504)
                                {
LABEL_741:
                                  if (v414)
                                  {
                                    v416 = [BWStillImagePortraitMetadataNode alloc];
                                    *(float *)&double v417 = v87;
                                    v418 = [(BWStillImagePortraitMetadataNode *)v416 initWithNodeConfiguration:v263 sdofRenderingVersion:v414 sensorConfigurationsByPortType:v354 defaultPortType:v510 defaultZoomFactor:v417];
                                    v419 = (objc_class *)v402[457];
                                    v624.receiver = (id)v265;
                                    v624.super_class = v419;
                                    if ((objc_msgSendSuper2(&v624, sel_addNode_error_, v418, &v745) & 1) == 0) {
                                      goto LABEL_816;
                                    }
                                    unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v315, -[BWNode input](v418, "input"), v583);
                                    if (v746) {
                                      goto LABEL_816;
                                    }
                                    v315 = [(BWNode *)v418 output];
                                  }
                                  if (v530)
                                  {
                                    if ([v537 previewQualityAdjustedPhotoFilterRenderingEnabled])int v420 = 2; {
                                    else
                                    }
                                      int v420 = 0;
                                    v421 = [BWStillImageFilterNode alloc];
                                    LOBYTE(v471) = v538 == 2;
                                    LODWORD(v466) = v420;
                                    *(float *)&double v422 = v113;
                                    *(float *)&double v423 = v87;
                                    v424 = [(BWStillImageFilterNode *)v421 initWithNodeConfiguration:v263 sensorConfigurationsByPortType:v354 statusDelegate:v579 depthDataDeliveryEnabled:v541 personSegmentationEnabled:v515 refinedDepthEnabled:0 portraitRenderQuality:v422 targetAspectRatio:v423 defaultPortType:v466 defaultZoomFactor:v510 backPressureDrivenPipelining:v471];
                                    -[BWStillImageFilterNode setSmartStyleRenderingVersion:](v424, "setSmartStyleRenderingVersion:", [v22 smartStyleRenderingVersion]);
                                    v425 = (objc_class *)v402[457];
                                    v623.receiver = (id)v265;
                                    v623.super_class = v425;
                                    if ((objc_msgSendSuper2(&v623, sel_addNode_error_, v424, &v745) & 1) == 0) {
                                      goto LABEL_816;
                                    }
                                    v426 = a12;
                                    unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v315, -[BWNode input](v424, "input"), v509);
                                    if (v746) {
                                      goto LABEL_816;
                                    }
                                    v315 = [(BWNode *)v424 output];
                                  }
                                  else
                                  {
                                    v426 = a12;
                                  }
                                  if (v538 == 1)
                                  {
                                    v427 = [[BWStillImageTurnstileNode alloc] initWithStillImageCoordinator:*(void *)(v265 + 56)];
                                    v428 = (objc_class *)v402[457];
                                    v622.receiver = (id)v265;
                                    v622.super_class = v428;
                                    if ((objc_msgSendSuper2(&v622, sel_addNode_error_, v427, &v745) & 1) == 0) {
                                      goto LABEL_816;
                                    }
                                    unsigned int v746 = objc_msgSend(v426, "safelyConnectOutput:toInput:pipelineStage:", v315, -[BWNode input](v427, "input"), v583);
                                    if (v746) {
                                      goto LABEL_816;
                                    }
                                    v429 = v402;
                                    v315 = [(BWNode *)v427 output];
                                  }
                                  else
                                  {
                                    v429 = v402;
                                  }
                                  LODWORD(v430) = [v22 deviceHasFlash];
                                  unsigned int v431 = [(FigCaptureCameraParameters *)v599 gainMapVersion];
                                  if (v539 == 1) {
                                    uint64_t v430 = 1;
                                  }
                                  else {
                                    uint64_t v430 = v430;
                                  }
                                  char v432 = v505;
                                  if (v539 == 1) {
                                    char v432 = 1;
                                  }
                                  if (v431 < 0x20000) {
                                    char v433 = v432;
                                  }
                                  else {
                                    char v433 = 0;
                                  }
                                  if ((v431 & 0xFFFE0000) != 0) {
                                    char v434 = v432;
                                  }
                                  else {
                                    char v434 = 0;
                                  }
                                  if (v565)
                                  {
                                    v435 = [[BWFunnelNode alloc] initWithNumberOfInputs:2 mediaType:1986618469];
                                    [(BWNode *)v435 setName:@"Stereo Photo Funnel"];
                                    v436 = (objc_class *)v429[457];
                                    v621.receiver = (id)v542;
                                    v621.super_class = v436;
                                    if ((objc_msgSendSuper2(&v621, sel_addNode_error_, v435, &v745) & 1) == 0) {
                                      goto LABEL_816;
                                    }
                                    unsigned int v746 = objc_msgSend(v426, "safelyConnectOutput:toInput:pipelineStage:", v315, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v435, "inputs"), "objectAtIndexedSubscript:", 0), v502);
                                    if (v746) {
                                      goto LABEL_816;
                                    }
                                    unsigned int v746 = objc_msgSend(v426, "safelyConnectOutput:toInput:pipelineStage:", v565, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v435, "inputs"), "objectAtIndexedSubscript:", 1), v502);
                                    if (v746) {
                                      goto LABEL_816;
                                    }
                                    v315 = [(BWNode *)v435 output];
                                  }
                                  uint64_t v620 = 0;
                                  uint64_t v619 = 0;
                                  uint64_t v618 = 0;
                                  v472 = v140;
                                  char v469 = v434;
                                  v437 = (void *)v542;
                                  uint64_t v438 = v502;
                                  unsigned int v746 = -[FigCapturePhotonicEngineSinkPipeline _buildScaleAndEncodeSubPipelineWithPipelineStage:graph:nodeConfiguration:stillImageSinkPipelineWithConfiguration:sensorConfigurationsByPortType:supportsScaling:deferredPearlDepthProcessingEnabled:provideMeteorHeadroom:provideFlexGTC:providePostEncodeInferences:semanticDevelopmentVersion:constituentPhotoDeliveryEnabled:demosaicedRawEnabled:nonPropagatedMainImageDownscalingFactorByAttachedMediaKey:propagatedMainImageDownscalingFactorByAttachedMediaKey:scalingMainImageDownscalingFactorByAttachedMediaKey:inferenceScheduler:subPipelineInputOut:subPipelineOutputOut:cameraSupportsFlash:cinematicFramingStatesProvider:photoEncoderControllerOut:]((void *)v542, v502, v426, v263, v22, (uint64_t)v604, v552 ^ 1, v588, v433, v469, v478, v511, v535, v472, v551, (uint64_t)v546, a10, &v620, &v619,
                                           v430,
                                           a11,
                                           &v618);
                                  if (v746) {
                                    goto LABEL_816;
                                  }
                                  if (v579 && v618) {
                                    -[BWPhotonicEngineNode setPhotoEncoderController:](v579, "setPhotoEncoderController:");
                                  }
                                  unsigned int v746 = [v426 safelyConnectOutput:v315 toInput:v620 pipelineStage:v502];
                                  if (v746) {
                                    goto LABEL_816;
                                  }
                                  uint64_t v439 = v619;
                                  if ([v537 optimizesImagesForOfflineVideoStabilization])
                                  {
                                    v440 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                                    long long v614 = 0u;
                                    long long v615 = 0u;
                                    long long v616 = 0u;
                                    long long v617 = 0u;
                                    uint64_t v441 = [v604 countByEnumeratingWithState:&v614 objects:v749 count:16];
                                    if (v441)
                                    {
                                      uint64_t v442 = v441;
                                      uint64_t v443 = *(void *)v615;
                                      do
                                      {
                                        for (uint64_t i3 = 0; i3 != v442; ++i3)
                                        {
                                          if (*(void *)v615 != v443) {
                                            objc_enumerationMutation(v604);
                                          }
                                          objc_msgSend(v440, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v604, "objectForKeyedSubscript:", *(void *)(*((void *)&v614 + 1) + 8 * i3)), "sensorIDDictionary"), *(void *)(*((void *)&v614 + 1) + 8 * i3));
                                        }
                                        uint64_t v442 = [v604 countByEnumeratingWithState:&v614 objects:v749 count:16];
                                      }
                                      while (v442);
                                    }
                                    unsigned int v445 = [v22 horizontalSensorBinningFactor];
                                    unsigned int v446 = [v22 verticalSensorBinningFactor];
                                    [v22 maxSupportedFrameRate];
                                    uint64_t v448 = FigCaptureBuildMotionAttachmentsNode((void *)v542, v439, v445, v446, v583, [v22 motionAttachmentsSource], (uint64_t)v440, objc_msgSend(v22, "cameraInfoByPortType"), v447, v477, 0, 1, 1, 0, &v746);
                                    if (v746) {
                                      goto LABEL_816;
                                    }
                                    uint64_t v439 = v448;
                                    v429 = &selRef_initWithWidth_height_pixelFormat_;
                                    v437 = (void *)v542;
                                    uint64_t v438 = v502;
                                  }
                                  v449 = -[BWStillImageSampleBufferSinkNode initWithSinkID:]([BWStillImageSampleBufferSinkNode alloc], "initWithSinkID:", [v437 sinkID]);
                                  [(BWNode *)v449 setName:@"Still Image Sink"];
                                  -[BWStillImageSampleBufferSinkNode setPropagatedAttachedMediaKeys:](v449, "setPropagatedAttachedMediaKeys:", [v551 allKeys]);
                                  [(BWStillImageSampleBufferSinkNode *)v449 setCameraSupportsFlash:v430];
                                  v450 = (objc_class *)v429[457];
                                  v613.receiver = v437;
                                  v613.super_class = v450;
                                  if (objc_msgSendSuper2(&v613, sel_addNode_error_, v449, &v745))
                                  {
                                    v437[9] = v449;
                                    unsigned int v746 = objc_msgSend(v426, "safelyConnectOutput:toInput:pipelineStage:", v439, -[BWNode input](v449, "input"), v438);
                                    if (!v746)
                                    {
                                      long long v611 = 0u;
                                      long long v612 = 0u;
                                      long long v609 = 0u;
                                      long long v610 = 0u;
                                      v451 = (void *)[v437 nodes];
                                      uint64_t v452 = [v451 countByEnumeratingWithState:&v609 objects:v748 count:16];
                                      if (v452)
                                      {
                                        uint64_t v453 = v452;
                                        uint64_t v454 = *(void *)v610;
                                        do
                                        {
                                          for (uint64_t i4 = 0; i4 != v453; ++i4)
                                          {
                                            if (*(void *)v610 != v454) {
                                              objc_enumerationMutation(v451);
                                            }
                                            v456 = *(void **)(*((void *)&v609 + 1) + 8 * i4);
                                            [v456 setDeferredPreparePriority:1];
                                            long long v607 = 0u;
                                            long long v608 = 0u;
                                            long long v605 = 0u;
                                            long long v606 = 0u;
                                            v457 = (void *)[v456 inputs];
                                            uint64_t v458 = [v457 countByEnumeratingWithState:&v605 objects:v747 count:16];
                                            if (v458)
                                            {
                                              uint64_t v459 = v458;
                                              uint64_t v460 = *(void *)v606;
                                              do
                                              {
                                                for (uint64_t i5 = 0; i5 != v459; ++i5)
                                                {
                                                  if (*(void *)v606 != v460) {
                                                    objc_enumerationMutation(v457);
                                                  }
                                                  objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v605 + 1) + 8 * i5), "connection"), "setWantsMessageCachingWhileSuspended:", 1);
                                                }
                                                uint64_t v459 = [v457 countByEnumeratingWithState:&v605 objects:v747 count:16];
                                              }
                                              while (v459);
                                            }
                                          }
                                          uint64_t v453 = [v451 countByEnumeratingWithState:&v609 objects:v748 count:16];
                                        }
                                        while (v453);
                                      }
                                      [*(id *)(v542 + 56) setDeferredPreparePriority:4];
                                      goto LABEL_817;
                                    }
                                  }
                                  goto LABEL_816;
                                }
                                v412 = [[BWStillImageSmartStyleAttachmentTransferNode alloc] initWithNodeConfiguration:v263];
                                v464 = (objc_class *)v402[457];
                                v626.receiver = (id)v265;
                                v626.super_class = v464;
                                if ((objc_msgSendSuper2(&v626, sel_addNode_error_, v412, &v745) & 1) == 0) {
                                  goto LABEL_816;
                                }
                                unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v315, -[BWNode input](v412, "input"), v583);
                                if (v746) {
                                  goto LABEL_816;
                                }
                              }
                              else
                              {
                                if (!v504)
                                {
LABEL_740:
                                  uint64_t v414 = v479;
                                  goto LABEL_741;
                                }
                                v412 = [[BWStillImageSmartStyleAttachmentTransferNode alloc] initWithNodeConfiguration:v263];
                                v415 = (objc_class *)v402[457];
                                v625.receiver = (id)v265;
                                v625.super_class = v415;
                                uint64_t v414 = v479;
                                if ((objc_msgSendSuper2(&v625, sel_addNode_error_, v412, &v745) & 1) == 0) {
                                  goto LABEL_816;
                                }
                                unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v315, -[BWNode input](v412, "input"), v583);
                                if (v746) {
                                  goto LABEL_816;
                                }
                              }
LABEL_738:
                              v315 = [(BWNode *)v412 output];
                              goto LABEL_741;
                            }
                          }
                        }
                      }
                    }
                  }
                }
                goto LABEL_816;
              }
              v397 = [[BWInferenceNode alloc] initWithScheduler:v342 priority:*(unsigned int *)(v265 + 52)];
              if (!-[FigCapturePhotonicEngineSinkPipeline _addLandmarksInferenceToNode:](v265, v397))
              {
                [(BWNode *)v397 setName:@"Landmarks"];
                if (((v555 | v496 ^ 1) & 1) == 0)
                {
                  [(BWInferenceNode *)v397 addInferenceOfType:104 version:Major & 0xFFFFFFFFFFFFLL configuration:v492];
                  v398 = NSString;
                  uint64_t v468 = [(BWNode *)v397 name];
                  v399 = v398;
                  unsigned int v348 = v523;
                  -[BWNode setName:](v397, "setName:", [v399 stringWithFormat:@"%@ + PersonSemantics", v468]);
                  LOBYTE(v555) = 1;
                }
                [(BWInferenceNode *)v397 setInferenceTypesToSkipResolver:v733];
                v634.receiver = (id)v265;
                v634.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
                if ((objc_msgSendSuper2(&v634, sel_addNode_error_, v397, &v745) & 1) == 0) {
                  goto LABEL_816;
                }
                unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v315, -[BWNode input](v397, "input"), v583);
                if (v746) {
                  goto LABEL_816;
                }
                v315 = [(BWNode *)v397 output];
                goto LABEL_686;
              }
LABEL_711:
              int v409 = -12780;
LABEL_712:
              unsigned int v746 = v409;
              goto LABEL_817;
            }
            v380 = v315;
            v592 = +[BWStillImageConditionalRouterUBConfiguration configurationWithPortTypes:v544];
            v381 = [[BWStillImageConditionalRouterNode alloc] initWithRoutingConfiguration:v592];
            [(BWNode *)v381 setName:@"UB Router for ConstituentPhoto without Depth"];
            v645.receiver = (id)v265;
            v645.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
            if ((objc_msgSendSuper2(&v645, sel_addNode_error_, v381, &v745) & 1) == 0) {
              goto LABEL_816;
            }
            v382 = (void *)v265;
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", v380, -[BWNode input](v381, "input"), v316);
            if (v746) {
              goto LABEL_816;
            }
            v383 = -[BWStillImageMultiCameraDoserNode initWithPortTypes:]([BWStillImageMultiCameraDoserNode alloc], "initWithPortTypes:", [v604 allKeys]);
            v644.receiver = v382;
            v644.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
            if ((objc_msgSendSuper2(&v644, sel_addNode_error_, v383, &v745) & 1) == 0) {
              goto LABEL_816;
            }
            v384 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", [v544 count], 1986618469);
            v643.receiver = v382;
            v643.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
            if ((objc_msgSendSuper2(&v643, sel_addNode_error_, v384, &v745) & 1) == 0) {
              goto LABEL_816;
            }
            newValueb = v384;
            [(BWNode *)v384 setName:@"Camera Calibration Data"];
            long long v642 = 0u;
            long long v641 = 0u;
            long long v640 = 0u;
            long long v639 = 0u;
            uint64_t v385 = [v544 countByEnumeratingWithState:&v639 objects:v750 count:16];
            if (v385)
            {
              uint64_t v386 = v385;
              uint64_t v587 = *(void *)v640;
LABEL_652:
              uint64_t v387 = 0;
              while (1)
              {
                if (*(void *)v640 != v587) {
                  objc_enumerationMutation(v544);
                }
                v388 = *(void **)(*((void *)&v639 + 1) + 8 * v387);
                uint64_t v389 = [(BWStillImageConditionalRouterUBConfiguration *)v592 outputIndexForPortType:v388];
                if (v389 == 0x7FFFFFFFFFFFFFFFLL) {
                  goto LABEL_711;
                }
                uint64_t v391 = v389;
                objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v381, "outputs"), "objectAtIndexedSubscript:", v389), "setName:", BWPortTypeToDisplayString(v388, v390));
                unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v381, "outputs"), "objectAtIndexedSubscript:", v391), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v383, "inputs"), "objectAtIndexedSubscript:", v391), v583);
                if (v746) {
                  goto LABEL_816;
                }
                unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v383, "outputs"), "objectAtIndexedSubscript:", v391), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](newValueb, "inputs"), "objectAtIndexedSubscript:", v391), v583);
                if (v746) {
                  goto LABEL_816;
                }
                if (v386 == ++v387)
                {
                  uint64_t v386 = [v544 countByEnumeratingWithState:&v639 objects:v750 count:16];
                  if (v386) {
                    goto LABEL_652;
                  }
                  break;
                }
              }
            }
            v379 = [[BWStillImageCameraCalibrationDataNode alloc] initWithSensorConfigurationsByPortType:v604];
            [(BWInferenceSynchronizerNode *)v379 setPropagatesDetectedObjects:1];
            -[BWInferenceSynchronizerNode setBaseZoomFactorsByPortType:](v379, "setBaseZoomFactorsByPortType:", [v22 baseZoomFactorsByPortType]);
            [(BWNode *)v379 setName:@"Still Image Camera Calibration Data"];
            v373 = (void *)v542;
            v638.receiver = (id)v542;
            v638.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
            if ((objc_msgSendSuper2(&v638, sel_addNode_error_, v379, &v745) & 1) == 0) {
              goto LABEL_816;
            }
            unsigned int v746 = objc_msgSend(a12, "safelyConnectOutput:toInput:pipelineStage:", -[BWNode output](newValueb, "output"), -[BWNode input](v379, "input"), v583);
            uint64_t v342 = a10;
            unsigned int v348 = v523;
            if (v746) {
              goto LABEL_816;
            }
          }
          v315 = [(BWNode *)v379 output];
          v263 = v540;
          uint64_t v265 = (uint64_t)v373;
          v354 = v527;
          goto LABEL_663;
        }
      }
    }
  }
LABEL_816:
  FigDebugAssert3();
LABEL_817:
  uint64_t result = v746;
  if (!v746)
  {
    if (v745) {
      return [v745 code];
    }
  }
  return result;
}

- (uint64_t)_addLandmarksInferenceToNode:(uint64_t)result
{
  if (result)
  {
    v3 = (void *)[a2 name];
    uint64_t v4 = [v3 length];
    v5 = @"Landmarks";
    if (v4) {
      v5 = (__CFString *)[v3 stringByAppendingFormat:@" + %@", @"Landmarks"];
    }
    [a2 setName:v5];
    id v6 = +[BWLandmarksInferenceConfiguration configuration];
    objc_msgSend(v6, "setMaximumNumberOfFaces:", +[BWLandmarksInferenceConfiguration portraitMaximumNumberOfFaces](BWLandmarksInferenceConfiguration, "portraitMaximumNumberOfFaces"));
    uint64_t v7 = [v6 landmarksInferenceVersion] & 0xFFFFFFFFFFFFLL;
    return [a2 addInferenceOfType:801 version:v7 configuration:v6];
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCapturePhotonicEngineSinkPipeline;
  [(FigCaptureSinkPipeline *)&v3 dealloc];
}

- (BWPortraitHDRStagingNode)portraitHDRStagingNode
{
  return self->_portraitHDRStagingNode;
}

BOOL __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke(uint64_t a1, const void *a2)
{
  return (BWStillImageProcessingFlagsForSampleBuffer(a2) & 0x200000) == 0;
}

uint64_t __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke_2(uint64_t a1, CMAttachmentBearerRef target)
{
  uint64_t v4 = (void *)CMGetAttachment(target, @"StillSettings", 0);
  int v5 = BWStillImageProcessingFlagsForSampleBuffer(target);
  int v6 = BWCIFilterArrayContainsPortraitFilters(objc_msgSend((id)objc_msgSend(v4, "requestedSettings"), "processedImageFilters"));
  BOOL v7 = (objc_msgSend((id)objc_msgSend(v4, "requestedSettings"), "portraitEffectsMatteDeliveryEnabled") & 1) != 0
    || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "requestedSettings"), "enabledSemanticSegmentationMatteURNs"), "count") != 0;
  if ((v5 & 0x1000) != 0) {
    int v8 = v6;
  }
  else {
    int v8 = 1;
  }
  if (v7 && v8 && (v5 & 0x200000) == 0) {
    return 0;
  }
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  if (*(unsigned char *)(a1 + 32)) {
    v12 = &unk_1EFB02E10;
  }
  else {
    v12 = &unk_1EFB02E28;
  }
  return [v11 setWithArray:v12];
}

BOOL __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke_662(uint64_t a1)
{
  return [(id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() count] == 0;
}

uint64_t __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke_911(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      uint64_t v4 = *(uint64_t (**)(void))(v3 + 16);
      return v4();
    }
    else
    {
      return 1;
    }
  }
  return result;
}

unint64_t __334__FigCapturePhotonicEngineSinkPipeline__buildStillImageSinkPipelineWithConfiguration_captureDevice_sourceOutputsByPortType_sourceSensorRawOutputsByPortType_highResStillImageDimensions_supplementalPointCloudCaptureDevice_supplementalPointCloudSourceOutput_captureStatusDelegate_inferenceScheduler_cinematicFramingStatesProvider_graph___block_invoke_2_946(uint64_t a1, CMAttachmentBearerRef target)
{
  unint64_t v3 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(target, @"StillSettings", 0), "captureSettings"), "captureFlags");
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4) {
    return (v3 >> 11) & 1;
  }
  if ((v3 & 0x800) == 0) {
    return 0;
  }
  int v6 = *(uint64_t (**)(void))(v4 + 16);
  return v6();
}

@end