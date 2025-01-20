@interface FigCaptureStillImageUnifiedBracketingSinkPipeline
+ (NSString)pipelineBaseName;
+ (void)initialize;
- (BWCompressedShotBufferNode)compressedShotBufferNode;
- (BWPortraitHDRStagingNode)portraitHDRStagingNode;
- (BWStillImageCoordinatorNode)stillImageCoordinatorNode;
- (BWStillImageSampleBufferSinkNode)stillImageSinkNode;
- (FigCaptureStillImageUnifiedBracketingSinkPipeline)initWithConfiguration:(id)a3 captureDevice:(id)a4 sourceOutputsByPortType:(id)a5 highResStillImageDimensions:(id)a6 supplementalPointCloudCaptureDevice:(id)a7 supplementalPointCloudSourceOutput:(id)a8 captureStatusDelegate:(id)a9 inferenceScheduler:(id)a10 cinematicFramingStatesProvider:(id)a11 graph:(id)a12 name:(id)a13;
- (uint64_t)_addMattingInferenceToNode:(unsigned int)a3 mattingVersion:(uint64_t)a4 refinedDepthEnabled:(unsigned int)a5 mainImageDownscalingFactor:(uint64_t)a6 enabledSemantics:(void *)a7 metalCommandQueue:(char)a8 mattingsensorConfigurationsByPortType:(float)a9 clientIsCameraOrDerivative:(float)a10 requiredAdditionalInferenceOutputBuffers:(unsigned int)a11 zoomFactorForPortrait:;
- (uint64_t)_buildRedEyeReductionSubPipelineWithName:(uint64_t)a3 pipelineStage:(void *)a4 graph:(uint64_t)a5 sensorConfigurationsByPortType:(uint64_t)a6 inferenceScheduler:(uint64_t *)a7 subPipelineInputOut:(uint64_t *)a8 subPipelineOutputOut:;
- (uint64_t)_buildScaleAndEncodeSubPipelineWithPipelineStage:(uint64_t)result graph:(uint64_t)a2 nodeConfiguration:(void *)a3 stillImageSinkPipelineWithConfiguration:(uint64_t)a4 sensorConfigurationsByPortType:(void *)a5 supportsScaling:(uint64_t)a6 provideMeteorHeadroom:(int)a7 providePostEncodeInferences:(int)a8 semanticDevelopmentVersion:(char)a9 constituentPhotoDeliveryEnabled:(unsigned int)a10 demosaicedRawEnabled:(unsigned __int8)a11 nonPropagatedMainImageDownscalingFactorByAttachedMediaKey:(void *)a12 propagatedMainImageDownscalingFactorByAttachedMediaKey:(void *)a13 inferenceScheduler:(uint64_t)a14 subPipelineInputOut:(uint64_t *)a15 subPipelineOutputOut:(uint64_t *)a16 cameraSupportsFlash:(unsigned __int8)a17 cinematicFramingStatesProvider:(void *)a18;
- (uint64_t)_buildStillImageSinkPipelineWithConfiguration:(uint64_t)a3 captureDevice:(uint64_t)a4 sourceOutputsByPortType:(uint64_t)a5 highResStillImageDimensions:(uint64_t)a6 supplementalPointCloudCaptureDevice:(uint64_t)a7 supplementalPointCloudSourceOutput:(uint64_t)a8 captureStatusDelegate:(uint64_t)a9 inferenceScheduler:(void *)a10 cinematicFramingStatesProvider:(void *)a11 graph:;
- (void)dealloc;
@end

@implementation FigCaptureStillImageUnifiedBracketingSinkPipeline

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (FigCaptureStillImageUnifiedBracketingSinkPipeline)initWithConfiguration:(id)a3 captureDevice:(id)a4 sourceOutputsByPortType:(id)a5 highResStillImageDimensions:(id)a6 supplementalPointCloudCaptureDevice:(id)a7 supplementalPointCloudSourceOutput:(id)a8 captureStatusDelegate:(id)a9 inferenceScheduler:(id)a10 cinematicFramingStatesProvider:(id)a11 graph:(id)a12 name:(id)a13
{
  v22.receiver = self;
  v22.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
  v19 = -[FigCaptureSinkPipeline initWithGraph:name:sinkID:](&v22, sel_initWithGraph_name_sinkID_, a12, a13, objc_msgSend((id)objc_msgSend(a3, "sinkConfiguration"), "sinkID"));
  v20 = v19;
  if (v19
    && -[FigCaptureStillImageUnifiedBracketingSinkPipeline _buildStillImageSinkPipelineWithConfiguration:captureDevice:sourceOutputsByPortType:highResStillImageDimensions:supplementalPointCloudCaptureDevice:supplementalPointCloudSourceOutput:captureStatusDelegate:inferenceScheduler:cinematicFramingStatesProvider:graph:]((uint64_t)v19, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, (uint64_t)a8, (uint64_t)a9, (uint64_t)a10, a11, a12))
  {
    FigDebugAssert3();

    return 0;
  }
  return v20;
}

- (uint64_t)_buildStillImageSinkPipelineWithConfiguration:(uint64_t)a3 captureDevice:(uint64_t)a4 sourceOutputsByPortType:(uint64_t)a5 highResStillImageDimensions:(uint64_t)a6 supplementalPointCloudCaptureDevice:(uint64_t)a7 supplementalPointCloudSourceOutput:(uint64_t)a8 captureStatusDelegate:(uint64_t)a9 inferenceScheduler:(void *)a10 cinematicFramingStatesProvider:(void *)a11 graph:
{
  uint64_t result = MEMORY[0x1F4188790](a1, a2, a3, a4);
  v479 = v19;
  v669[1] = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v20 = v18;
  uint64_t v21 = v17;
  objc_super v22 = v16;
  uint64_t v23 = v15;
  v24 = v14;
  v25 = v13;
  uint64_t v26 = result;
  unsigned int v637 = 0;
  id v636 = 0;
  [v13 sinkConfiguration];
  objc_opt_class();
  v27 = 0;
  if (objc_opt_isKindOfClass()) {
    v27 = (void *)[v25 sinkConfiguration];
  }
  if ([v27 depthDataDeliveryEnabled] && objc_msgSend(v25, "deviceType") == 9) {
    goto LABEL_679;
  }
  uint64_t v425 = v20;
  uint64_t v426 = v23;
  uint64_t v441 = v21;
  *(_DWORD *)(v26 + 48) = [v25 pipelineStagePriority];
  *(_DWORD *)(v26 + 52) = [v25 inferencePriority];
  v28 = objc_alloc_init(BWStillImageNodeConfiguration);
  -[BWStillImageNodeConfiguration setStillImageProcessingMode:](v28, "setStillImageProcessingMode:", [v25 stillImageSinkPipelineProcessingMode]);
  -[BWStillImageNodeConfiguration setMetalCommandQueue:](v28, "setMetalCommandQueue:", (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F55F60], "metalDevice"), "newCommandQueueWithMaxCommandBufferCount:", 512));
  [v25 pipelineStagePriority];
  v29 = FigDispatchQueueCreateWithPriority();
  [(MTLCommandQueue *)[(BWStillImageNodeConfiguration *)v28 metalCommandQueue] setCompletionQueue:v29];
  dispatch_release(v29);
  [(BWStillImageNodeConfiguration *)v28 setFigThreadPriority:*(unsigned int *)(v26 + 48)];
  -[BWStillImageNodeConfiguration setDepthDataType:](v28, "setDepthDataType:", [v25 depthDataType]);
  -[BWStillImageNodeConfiguration setPearlModuleType:](v28, "setPearlModuleType:", [v25 pearlModuleType]);
  [(BWStillImageNodeConfiguration *)v28 setInferenceScheduler:a9];
  v480 = v28;
  -[BWStillImageNodeConfiguration setMaxLossyCompressionLevel:](v28, "setMaxLossyCompressionLevel:", [v25 maxLossyCompressionLevel]);
  v30 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v24];
  uint64_t v31 = 0;
  int v464 = [v25 depthDataType];
  id v500 = v30;
  if (v464 == 7)
  {
    uint64_t v32 = *MEMORY[0x1E4F52DE0];
    uint64_t v33 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F52DE0]];
    uint64_t v668 = v32;
    v669[0] = v33;
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v669 forKeys:&v668 count:1];
    uint64_t v34 = v32;
    v30 = v500;
    [v500 setObject:0 forKeyedSubscript:v34];
  }
  v35 = (void *)[v30 allKeys];
  uint64_t v36 = [v24 allKeys];
  id v484 = v35;
  v471 = v22;
  obuint64_t j = v24;
  if ((unint64_t)[v24 count] >= 2)
  {
    switch([v25 deviceType])
    {
      case 4u:
        uint64_t v37 = *MEMORY[0x1E4F52DD8];
        uint64_t v667 = *MEMORY[0x1E4F52DF0];
        v38 = (void *)MEMORY[0x1E4F1C978];
        v39 = &v667;
        goto LABEL_15;
      case 6u:
        uint64_t v37 = *MEMORY[0x1E4F52DF8];
        v43 = (char *)*MEMORY[0x1E4F52E00];
        uint64_t v666 = *MEMORY[0x1E4F52E00];
        v44 = (void *)MEMORY[0x1E4F1C978];
        v45 = &v666;
        goto LABEL_20;
      case 8u:
        uint64_t v37 = *MEMORY[0x1E4F52DE8];
        uint64_t v664 = *MEMORY[0x1E4F52DD8];
        v38 = (void *)MEMORY[0x1E4F1C978];
        v39 = &v664;
LABEL_15:
        uint64_t v46 = 1;
        goto LABEL_17;
      case 9u:
        uint64_t v37 = *MEMORY[0x1E4F52DD8];
        uint64_t v47 = *MEMORY[0x1E4F52DF0];
        v663[0] = *MEMORY[0x1E4F52DE8];
        v663[1] = v47;
        v38 = (void *)MEMORY[0x1E4F1C978];
        v39 = v663;
        uint64_t v46 = 2;
LABEL_17:
        uint64_t v42 = [v38 arrayWithObjects:v39 count:v46];
        v43 = 0;
        v520 = (void *)v42;
        goto LABEL_21;
      case 0xCu:
        uint64_t v37 = *MEMORY[0x1E4F52E10];
        v43 = (char *)*MEMORY[0x1E4F52E00];
        uint64_t v665 = *MEMORY[0x1E4F52E00];
        v44 = (void *)MEMORY[0x1E4F1C978];
        v45 = &v665;
        goto LABEL_20;
      case 0xDu:
        uint64_t v37 = *MEMORY[0x1E4F52DD8];
        v43 = (char *)*MEMORY[0x1E4F52DE0];
        uint64_t v662 = *MEMORY[0x1E4F52DE0];
        v44 = (void *)MEMORY[0x1E4F1C978];
        v45 = &v662;
LABEL_20:
        v520 = (void *)[v44 arrayWithObjects:v45 count:1];
        uint64_t v42 = 0;
LABEL_21:
        v48 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:v36];
        v49 = (void *)[MEMORY[0x1E4F1CA80] set];
        v50 = v49;
        if (v37) {
          [v49 addObject:v37];
        }
        if (v42) {
          [v50 addObjectsFromArray:v42];
        }
        uint64_t v477 = v37;
        v41 = v43;
        if (v43) {
          [v50 addObject:v43];
        }
        v24 = obj;
        if ([v48 isEqualToSet:v50]) {
          goto LABEL_28;
        }
        goto LABEL_679;
      default:
        goto LABEL_679;
    }
  }
  uint64_t v40 = [v35 firstObject];
  uint64_t v661 = v40;
  v520 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v661 count:1];
  if (!v40) {
    goto LABEL_679;
  }
  uint64_t v477 = v40;
  v41 = 0;
  uint64_t v42 = 0;
LABEL_28:
  v497 = v41;
  v416 = (void *)v31;
  v488 = (void *)v42;
  uint64_t v422 = v36;
  v472 = v27;
  uint64_t v487 = v26;
  v518 = +[FigCaptureCameraParameters sharedInstance];
  v51 = (void *)[v25 sensorIDStringsByPortType];
  v514 = (void *)[v25 cameraInfoByPortType];
  v52 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  BOOL v515 = FigCaptureVideoDimensionsAreValid([v25 outputStillImageDimensions]);
  BOOL v481 = FigCaptureVideoDimensionsAreValid([v25 gdcInDCProcessorOutputCropDimensions]);
  long long v632 = 0u;
  long long v633 = 0u;
  long long v634 = 0u;
  long long v635 = 0u;
  uint64_t v53 = [v24 countByEnumeratingWithState:&v632 objects:v660 count:16];
  id v521 = v52;
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v490 = 0;
    uint64_t v55 = 0;
    uint64_t v56 = *(void *)v633;
    uint64_t v511 = *MEMORY[0x1E4F52E00];
    id newValue = (id)*MEMORY[0x1E4F52DE0];
    do
    {
      uint64_t v57 = 0;
      do
      {
        uint64_t v58 = v55;
        if (*(void *)v633 != v56) {
          objc_enumerationMutation(obj);
        }
        v59 = *(void **)(*((void *)&v632 + 1) + 8 * v57);
        uint64_t v60 = [v51 objectForKeyedSubscript:v59];
        v61 = -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v59, v60, -[FigCaptureCameraParameters sensorIDDictionaryForPortType:sensorIDString:](v518, "sensorIDDictionaryForPortType:sensorIDString:", v59, v60), [v514 objectForKeyedSubscript:v59]);
        v52 = v521;
        [v521 setObject:v61 forKeyedSubscript:v59];
        if (v515
          && ([v59 isEqualToString:v511] & 1) == 0
          && ([v59 isEqualToString:newValue] & 1) == 0)
        {
          v62 = objc_msgSend((id)objc_msgSend(obj, "objectForKeyedSubscript:", v59), "formatRequirements");
          BOOL v63 = FigCaptureVideoDimensionsAreValid(v55 | (v490 << 32));
          unsigned int v64 = [v62 width];
          uint64_t v55 = v64;
          if (v63)
          {
            v52 = v521;
            if (v58 != v64) {
              goto LABEL_682;
            }
            uint64_t v55 = v58;
            if (v490 != [v62 height]) {
              goto LABEL_682;
            }
          }
          else
          {
            unsigned int v65 = v64;
            unsigned int v66 = [v62 height];
            BOOL v67 = FigCaptureVideoDimensionsAreValid(v65 | ((unint64_t)v66 << 32));
            v52 = v521;
            if (!v67) {
              goto LABEL_682;
            }
            uint64_t v490 = v66;
          }
        }
        ++v57;
      }
      while (v54 != v57);
      uint64_t v68 = [obj countByEnumeratingWithState:&v632 objects:v660 count:16];
      uint64_t v54 = v68;
    }
    while (v68);
  }
  else
  {
    LODWORD(v490) = 0;
    LODWORD(v55) = 0;
  }
  v69 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v628 = 0u;
  long long v629 = 0u;
  long long v630 = 0u;
  long long v631 = 0u;
  uint64_t v70 = [v52 countByEnumeratingWithState:&v628 objects:v659 count:16];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = *(void *)v629;
    do
    {
      for (uint64_t i = 0; i != v71; ++i)
      {
        if (*(void *)v629 != v72) {
          objc_enumerationMutation(v52);
        }
        uint64_t v74 = *(void *)(*((void *)&v628 + 1) + 8 * i);
        if ([v520 containsObject:v74]) {
          objc_msgSend(v69, "setObject:forKeyedSubscript:", objc_msgSend(v52, "objectForKeyedSubscript:", v74), v74);
        }
      }
      uint64_t v71 = [v52 countByEnumeratingWithState:&v628 objects:v659 count:16];
    }
    while (v71);
  }
  uint64_t v446 = [v520 firstObject];
  v473 = objc_msgSend(v69, "objectForKeyedSubscript:");
  uint64_t v460 = [v500 objectForKeyedSubscript:v497];
  int v470 = [v497 isEqualToString:*MEMORY[0x1E4F52E00]];
  v450 = v69;
  int v512 = v55;
  BOOL v75 = [v25 depthDataType] == 3 && objc_msgSend(v25, "pearlModuleType") == 2;
  int v76 = [v472 bravoConstituentPhotoDeliveryEnabled];
  unsigned int v438 = [v25 deferredProcessingSupported];
  int v475 = [v25 stillImageSinkPipelineProcessingMode];
  unsigned int v77 = [v472 depthDataDeliveryEnabled];
  unsigned int v462 = [v25 depthDataType];
  int v465 = [v472 filterRenderingEnabled];
  float v78 = 0.0;
  unsigned int v486 = v77;
  if (v77)
  {
    objc_msgSend(v479, "requestedZoomFactorRelativeToPortType:", objc_msgSend(v473, "portType"));
    float v78 = v79;
  }
  if ([v25 highQualityPhotoCaptureForVideoFormatEnabled])
  {
    if (v77 | v76) {
      int v80 = 0;
    }
    else {
      int v80 = 2;
    }
  }
  else
  {
    int v80 = [v25 stillImageStabilizationSupported];
  }
  unsigned int v81 = [v25 learnedNRSupported];
  unsigned int v437 = v81;
  if (v80 == 2) {
    unsigned int v82 = v81;
  }
  else {
    unsigned int v82 = 0;
  }
  int v83 = [v25 deepFusionSupported];
  int v84 = (v80 == 2) ^ v82;
  if (v80 == 1) {
    int v84 = 1;
  }
  int v448 = v84;
  unsigned int v459 = v82;
  int v85 = (v83 | v82) ^ 1;
  if (v475 != 1) {
    int v85 = 1;
  }
  int v466 = v85;
  int v86 = [v472 digitalFlashCaptureEnabled];
  int v476 = [v25 depthDataType];
  unsigned int v474 = [v472 portraitEffectsMatteDeliveryEnabled];
  BOOL v87 = (v474 & 1) != 0 || objc_msgSend((id)objc_msgSend(v25, "enabledSemanticSegmentationMatteURNs"), "count") != 0;
  BOOL v483 = v87;
  if ([(FigCaptureCameraParameters *)v518 personSemanticsVersion]) {
    uint64_t v88 = [(FigCaptureCameraParameters *)v518 personSemanticsVersion];
  }
  else {
    uint64_t v88 = 3;
  }
  unint64_t Major = BWInferenceVersionMakeMajor(v88);
  unint64_t v427 = Major >> 16;
  unsigned int v458 = v80;
  if (v483)
  {
    v89 = [(BWInferenceConfiguration *)[BWPersonSemanticsConfiguration alloc] initWithInferenceType:104];
    [(BWInferenceConfiguration *)v89 setPriority:*(unsigned int *)(v487 + 52)];
    if (v474) {
      [(BWPersonSemanticsConfiguration *)v89 setEnabledSemantics:[(BWPersonSemanticsConfiguration *)v89 enabledSemantics] | 1];
    }
    v90 = (void *)[v25 enabledSemanticSegmentationMatteURNs];
    if ([v90 containsObject:*MEMORY[0x1E4F55FC8]]) {
      [(BWPersonSemanticsConfiguration *)v89 setEnabledSemantics:[(BWPersonSemanticsConfiguration *)v89 enabledSemantics] | 2];
    }
    v91 = (void *)[v25 enabledSemanticSegmentationMatteURNs];
    if ([v91 containsObject:*MEMORY[0x1E4F55FD0]]) {
      [(BWPersonSemanticsConfiguration *)v89 setEnabledSemantics:[(BWPersonSemanticsConfiguration *)v89 enabledSemantics] | 8];
    }
    v92 = (void *)[v25 enabledSemanticSegmentationMatteURNs];
    if ([v92 containsObject:*MEMORY[0x1E4F55FE0]]) {
      [(BWPersonSemanticsConfiguration *)v89 setEnabledSemantics:[(BWPersonSemanticsConfiguration *)v89 enabledSemantics] | 0x10];
    }
    v93 = v89;
    v94 = (void *)[v25 supportedSemanticSegmentationMatteURNs];
    uint64_t v95 = *MEMORY[0x1E4F55FC0];
    if (![v94 containsObject:*MEMORY[0x1E4F55FC0]]) {
      goto LABEL_93;
    }
    if ((Major & 0xFFFC) == 0)
    {
      unint64_t v96 = BWInferenceVersionMakeMajor(4);
      unint64_t v427 = v96 >> 16;
      LOWORD(Major) = v96;
    }
    if (objc_msgSend((id)objc_msgSend(v25, "enabledSemanticSegmentationMatteURNs"), "containsObject:", v95))
    {
      v97 = v93;
      [(BWPersonSemanticsConfiguration *)v93 setEnabledSemantics:[(BWPersonSemanticsConfiguration *)v93 enabledSemantics] | 0x20];
    }
    else
    {
LABEL_93:
      v97 = v93;
    }
  }
  else
  {
    v97 = 0;
  }
  v439 = v97;
  if (v486)
  {
    uint64_t v98 = [v473 portType];
    uint64_t v99 = [v473 sensorIDString];
    *(float *)&double v100 = v78;
    unsigned int v430 = [(FigCaptureCameraParameters *)v518 sdofRenderingVersionForPortType:v98 sensorIDString:v99 zoomFactor:v100];
  }
  else
  {
    unsigned int v430 = 0;
  }
  int v101 = [(FigCaptureCameraParameters *)v518 learnedMattingVersion];
  int v453 = v486 & v465;
  int v431 = v101;
  if ((v483 & v486) == 1)
  {
    if (v101 <= 0 || v464 == 7) {
      int v103 = v486 & v465;
    }
    else {
      int v103 = 1;
    }
    int v445 = v103;
  }
  else
  {
    int v445 = 0;
  }
  if ([v25 clientIsCameraOrDerivative])
  {
    int v104 = [v25 stillImageStabilizationSupported];
    if (v476 == 2) {
      int v105 = 0;
    }
    else {
      int v105 = v104;
    }
    int v442 = v105;
  }
  else
  {
    int v442 = 0;
  }
  if (v488) {
    unsigned int v106 = v486;
  }
  else {
    unsigned int v106 = 0;
  }
  if ([v25 allowsMultipleInflightCaptures])
  {
    uint64_t v485 = 1;
    if ([v25 responsiveShutterSupported])
    {
      if ([v25 responsiveShutterEnabled]) {
        uint64_t v107 = 2;
      }
      else {
        uint64_t v107 = 1;
      }
      uint64_t v485 = v107;
    }
    int v108 = v86;
    if ([v25 clientIsCameraOrDerivative])
    {
      if ([v25 responsiveShutterSupported]) {
        uint64_t v109 = v485;
      }
      else {
        uint64_t v109 = 2;
      }
      uint64_t v485 = v109;
    }
  }
  else
  {
    int v108 = v86;
    uint64_t v485 = 0;
  }
  int v478 = [v25 redEyeReductionVersion];
  if (v478 > 0) {
    int v110 = v76;
  }
  else {
    int v110 = 0;
  }
  if (v483)
  {
    unsigned int v111 = -[FigCaptureCameraParameters mattingVersionForPortType:sensorIDString:](v518, "mattingVersionForPortType:sensorIDString:", [v473 portType], objc_msgSend(v473, "sensorIDString"));
    if (v111) {
      unsigned int v112 = 0;
    }
    else {
      unsigned int v112 = v474;
    }
    if (v112 == 1
      || (unsigned int v113 = v111, objc_msgSend((id)objc_msgSend(v25, "enabledSemanticSegmentationMatteURNs"), "count"))
      && v113 <= 1)
    {
      unsigned int v637 = FigSignalErrorAt();
      goto LABEL_682;
    }
  }
  else
  {
    unsigned int v113 = 0;
  }
  unsigned int v418 = v113;
  if (v486)
  {
    uint64_t v114 = [v473 portType];
    uint64_t v115 = [v473 sensorIDString];
    *(float *)&double v116 = v78;
    int v117 = [(FigCaptureCameraParameters *)v518 disparityRefinementTypeForPortType:v114 sensorIDString:v115 zoomFactor:v116];
  }
  else
  {
    int v117 = 0;
  }
  unsigned int v118 = v474;
  if (v117 != 1) {
    unsigned int v118 = 0;
  }
  unsigned int v428 = v118;
  if (v470)
  {
    if ([(FigCaptureCameraParameters *)v518 personSemanticsVersion] <= 4) {
      BOOL v75 = 0;
    }
  }
  else
  {
    BOOL v75 = 0;
  }
  char v119 = v106 ^ 1;
  if (v476 == 2) {
    char v119 = 1;
  }
  char v435 = v119;
  char v434 = [v25 allowedToModifyInputBuffers];
  int v120 = [v25 semanticRenderingVersion];
  id newValuea = (id)[MEMORY[0x1E4F1CA60] dictionary];
  int v447 = v120;
  if (v120) {
    unsigned int v455 = [v25 semanticDevelopmentVersion];
  }
  else {
    unsigned int v455 = 0;
  }
  int v463 = [v472 demosaicedRawEnabled];
  if (v463) {
    [newValuea setObject:BWSemanticSegmentationMatteAttachedMediaKeysSupportedByDemosaicedRaw() forKeyedSubscript:&unk_1EFAFF948];
  }
  if (v75)
  {
    v121 = (void *)[MEMORY[0x1E4F1CA48] array];
    [v121 addObject:0x1EFA6A200];
    [v121 addObjectsFromArray:BWInferenceLowResPersonInstanceMaskKeys()];
    [newValuea setObject:v121 forKeyedSubscript:&unk_1EFAFF960];
  }
  int v421 = v110;
  if (objc_msgSend((id)objc_msgSend(v25, "portTypesWithGeometricDistortionCorrectionEnabled"), "count"))
  {
    if ((v486 ^ 1 | v76)) {
      int v122 = 1;
    }
    else {
      int v122 = objc_msgSend((id)objc_msgSend(v25, "portTypesWithGeometricDistortionCorrectionEnabled"), "containsObject:", v446);
    }
    int v123 = [v25 gdcInDCProcessorSupported] & v122;
  }
  else
  {
    int v123 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(v25, "portTypesWithIntelligentDistortionCorrectionEnabled"), "count")) {
    int v124 = 1;
  }
  else {
    int v124 = v123;
  }
  int v436 = v124;
  int v433 = v515 & v123;
  if (v512 >= (int)[v25 rawSensorDimensions]
    && ((int)v490 >= (int)((unint64_t)[v25 rawSensorDimensions] >> 32)
      ? (int v125 = v515 & v123)
      : (int v125 = 0),
        v125 == 1))
  {
    if (v481) {
      uint64_t v126 = [v25 gdcInDCProcessorOutputCropDimensions];
    }
    else {
      uint64_t v126 = [v25 outputStillImageDimensions];
    }
    uint64_t v419 = v126;
  }
  else
  {
    uint64_t v419 = 0;
  }
  if ([v25 clientIsCameraOrDerivative]
    && +[BWInferenceEngine isNeuralEngineSupported])
  {
    char v429 = [v25 captureTimePhotosCurationSupported];
  }
  else
  {
    char v429 = 0;
  }
  unsigned int v468 = v108 & v466;
  if (v483)
  {
    v127 = (unsigned int *)v487;
    if ([v25 clientIsCameraOrDerivative])
    {
      unsigned int v417 = 0;
    }
    else
    {
      if (v76) {
        int v128 = 8 * [v500 count];
      }
      else {
        int v128 = 8;
      }
      unsigned int v417 = v128 - 1;
    }
  }
  else
  {
    unsigned int v417 = 0;
    v127 = (unsigned int *)v487;
  }
  int v482 = v76 | v106;
  int v456 = v123;
  if (v485 == 2) {
    unsigned int v443 = [v25 responsiveShutterSupported];
  }
  else {
    unsigned int v443 = 0;
  }
  [v479 setStillImageCaptureEnabled:1];
  objc_msgSend(v479, "setIrisFrameHarvestingEnabled:", objc_msgSend(v472, "irisFrameHarvestingEnabled"));
  objc_msgSend(v479, "setStillImageFusionScheme:", objc_msgSend(v25, "noiseReductionAndFusionScheme"));
  [v479 setUnifiedBracketingMode:v458];
  objc_msgSend(v479, "setSifrStillImageCaptureEnabledIfAvailable:", objc_msgSend(v25, "sifrStillImageCaptureEnabledIfAvailable"));
  objc_msgSend(v479, "setDeepFusionEnabled:", objc_msgSend(v25, "deepFusionSupported"));
  [v479 setLearnedNRMode:v459];
  [v479 setDigitalFlashEnabled:v468];
  objc_msgSend(v479, "setRedSaturationMitigationEnabled:", objc_msgSend(v472, "optimizesImagesForOfflineVideoStabilization") ^ 1);
  [v479 registerForAEMatrixMetadata];
  [v479 setRedEyeReductionEnabled:v478 > 0];
  BOOL v432 = v75;
  if (v488) {
    int v129 = v486 & (v76 ^ 1);
  }
  else {
    int v129 = 0;
  }
  int v420 = v129;
  objc_msgSend(v479, "setDisparityGenerationFromReferenceFramesSupported:");
  [v479 setSupplementalPointCloudCaptureDevice:v471];
  v130 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage" priority:v127[12]];
  v131 = v130;
  if (v482)
  {
    v454 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.ub.default" priority:v127[12]];
    v132 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.ub.telephoto" priority:v127[12]];
    v130 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.multi" priority:v127[12]];
    v491 = v131;
    v451 = v131;
  }
  else
  {
    v491 = v130;
    v454 = v130;
    v132 = v130;
    v451 = v130;
    if (v485 == 2)
    {
      v451 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.scale-and-encode" priority:v127[12]];
      if (v443) {
        v491 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.buffer-servicing" priority:v127[12]];
      }
      else {
        v491 = v131;
      }
      v454 = v131;
      v132 = v131;
      v130 = v131;
    }
  }
  uint64_t v424 = (uint64_t)v132;
  v457 = v130;
  v133 = a11;
  int v452 = v76;
  v513 = v131;
  if (dword_1EB4C5610)
  {
    LODWORD(v609) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v460)
  {
    v135 = [BWAttachedMediaSplitNode alloc];
    v655 = @"Depth";
    v136 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:](v135, "initWithAttachedMediaKeys:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v655 count:1]);
    v627.receiver = v127;
    v627.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    v137 = v488;
    if ((objc_msgSendSuper2(&v627, sel_addNode_error_, v136, &v636) & 1) == 0
      || (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v460, -[BWNode input](v136, "input"), v491) & 1) == 0)
    {
      goto LABEL_681;
    }
    [(BWNode *)v136 setName:@"Still Image IR-Depth Splitter"];
    [(BWAttachedMediaSplitNode *)v136 setEmitsNodeErrorsForMissingAttachedMedia:1];
    id obja = [(NSArray *)[(BWNode *)v136 outputs] objectAtIndexedSubscript:0];
  }
  else
  {
    id obja = 0;
    v137 = v488;
  }
  int v467 = v448 & v466;
  v138 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v500, "count", v411, v413));
  v423 = (void *)[v471 cameraInfoByPortType];
  if ([v25 stillImageSinkPipelineProcessingMode]
    && [v25 stillImageSinkPipelineProcessingMode] != 2)
  {
    v141 = v500;
    id v142 = (id)[v500 mutableCopy];
    if (v497)
    {
      SEL v498 = (SEL)objc_msgSend(v500, "objectForKeyedSubscript:");
      int v492 = 0;
    }
    else
    {
      int v492 = 0;
      SEL v498 = 0;
    }
  }
  else
  {
    if ([v25 stillImageSinkPipelineProcessingMode])
    {
      v139 = 0;
      v140 = (void *)v487;
    }
    else
    {
      v139 = [[BWStillImageCoordinatorNode alloc] initWithCaptureDevice:v479 inputPortTypes:v484 sensorRawInputPortTypes:0 highResStillImageDimensions:v426];
      v626.receiver = (id)v487;
      v626.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
      if ((objc_msgSendSuper2(&v626, sel_addNode_error_, v139, &v636) & 1) == 0) {
        goto LABEL_681;
      }
      [(BWNode *)v139 setName:@"Still Image Coordinator"];
      [(BWStillImageCoordinatorNode *)v139 setStillImageCaptureStatusDelegate:v425];
      [(BWStillImageCoordinatorNode *)v139 setResponsiveShutterEnabled:v443];
      if ([v25 responsiveShutterSupported]) {
        uint64_t v143 = [v25 responsiveShutterEnabled];
      }
      else {
        uint64_t v143 = 0;
      }
      [(BWStillImageCoordinatorNode *)v139 setResponsiveShutterEnabledViaAPI:v143];
      -[BWStillImageCoordinatorNode setFastCapturePrioritizationEnabled:](v139, "setFastCapturePrioritizationEnabled:", [v25 fastCapturePrioritizationEnabled]);
      [(BWStillImageCoordinatorNode *)v139 setStillImageCapturePipeliningMode:v485];
      -[BWStillImageCoordinatorNode setCinematicFramingWarpingRequired:](v139, "setCinematicFramingWarpingRequired:", [v25 cinematicFramingWarpingRequired]);
      if (v485 == 1) {
        [(BWStillImageCoordinatorNode *)v139 setMaxNumberOfBurstCapturesAllowedInFlight:2];
      }
      v140 = (void *)v487;
      *(void *)(v487 + 56) = v139;
    }
    v144 = [[BWStillImageFrameCoordinatorNode alloc] initWithNodeConfiguration:v480 inputPortTypes:v484 sensorRawInputPortTypes:0];
    v625.receiver = v140;
    v625.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v625, sel_addNode_error_, v144, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    [(BWNode *)v144 setName:@"Still Image Frame Coordinator"];
    long long v624 = 0u;
    long long v623 = 0u;
    long long v622 = 0u;
    long long v621 = 0u;
    v145 = v500;
    uint64_t v146 = [v500 countByEnumeratingWithState:&v621 objects:v654 count:16];
    if (v146)
    {
      uint64_t v147 = v146;
      uint64_t v148 = *(void *)v622;
      do
      {
        for (uint64_t j = 0; j != v147; ++j)
        {
          if (*(void *)v622 != v148) {
            objc_enumerationMutation(v145);
          }
          v150 = *(void **)(*((void *)&v621 + 1) + 8 * j);
          uint64_t v151 = [v145 objectForKeyedSubscript:v150];
          if ([v150 isEqualToString:v497]) {
            uint64_t v151 = (uint64_t)obja;
          }
          if (v139)
          {
            if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v151, -[BWStillImageCoordinatorNode inputForPortType:](v139, "inputForPortType:", v150), v491) & 1) == 0)goto LABEL_681; {
            v137 = v488;
            }
            if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", -[BWStillImageCoordinatorNode outputForPortType:](v139, "outputForPortType:", v150), -[BWStillImageFrameCoordinatorNode inputForPortType:](v144, "inputForPortType:", v150), v513) & 1) == 0)goto LABEL_681; {
          }
            }
          else if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v151, -[BWStillImageFrameCoordinatorNode inputForPortType:](v144, "inputForPortType:", v150), v513) & 1) == 0)
          {
            goto LABEL_681;
          }
          objc_msgSend(v138, "setObject:forKeyedSubscript:", -[BWStillImageFrameCoordinatorNode outputForPortType:](v144, "outputForPortType:", v150), v150);
          v145 = v500;
        }
        uint64_t v147 = [v500 countByEnumeratingWithState:&v621 objects:v654 count:16];
      }
      while (v147);
    }
    SEL v498 = [(BWStillImageFrameCoordinatorNode *)v144 outputForPortType:v497];
    v152 = objc_alloc_init(FigCaptureIrisPreparedSettings);
    int v153 = [v25 deepFusionSupported];
    if (v467) {
      unsigned int v154 = 2;
    }
    else {
      unsigned int v154 = 1;
    }
    if (v153) {
      uint64_t v155 = 3;
    }
    else {
      uint64_t v155 = v154;
    }
    [(FigCaptureIrisPreparedSettings *)v152 setQualityPrioritization:v155];
    [(FigCaptureIrisPreparedSettings *)v152 setDigitalFlashMode:v468];
    v656[1] = 0;
    v656[0] = 0;
    int v657 = 0;
    v156 = v152;
    v141 = v500;
    +[BWStillImageCoordinatorNode worstCaseMaxBracketedCaptureBufferCountForPreparedSettings:v156 stillImageCaptureSettings:0 captureDevice:v479];
    int v157 = v656[0];
    if (SLODWORD(v656[0]) <= SHIDWORD(v656[0])) {
      int v157 = HIDWORD(v656[0]);
    }
    int v492 = v157;
    v127 = (unsigned int *)v487;
    v52 = v521;
    v131 = v513;
    v133 = a11;
    id v142 = v138;
  }
  BOOL v461 = v137 == 0;
  if (v137) {
    char v158 = v482;
  }
  else {
    char v158 = 1;
  }
  id objb = v142;
  if ((v158 & 1) == 0)
  {
    v159 = v141;
    v160 = -[BWCrossoverNode initWithMediaType:numberOfInputs:]([BWCrossoverNode alloc], "initWithMediaType:numberOfInputs:", 1986618469, [v141 count]);
    v620.receiver = v127;
    v620.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v620, sel_addNode_error_, v160, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    long long v619 = 0u;
    long long v618 = 0u;
    long long v617 = 0u;
    long long v616 = 0u;
    uint64_t v161 = [v159 countByEnumeratingWithState:&v616 objects:v653 count:16];
    if (v161)
    {
      uint64_t v162 = v161;
      int v163 = 0;
      uint64_t v164 = *(void *)v617;
LABEL_253:
      uint64_t v165 = 0;
      while (1)
      {
        if (*(void *)v617 != v164) {
          objc_enumerationMutation(v500);
        }
        uint64_t v166 = [objb objectForKeyedSubscript:*(void *)(*((void *)&v616 + 1) + 8 * v165)];
        uint64_t v167 = [(NSArray *)[(BWNode *)v160 inputs] objectAtIndexedSubscript:(v163 + v165)];
        uint64_t v168 = v166;
        v131 = v513;
        if (![a11 connectOutput:v168 toInput:v167 pipelineStage:v513]) {
          goto LABEL_681;
        }
        if (v162 == ++v165)
        {
          uint64_t v162 = [v500 countByEnumeratingWithState:&v616 objects:v653 count:16];
          v163 += v165;
          if (v162) {
            goto LABEL_253;
          }
          break;
        }
      }
    }
    id v142 = objb;
    objc_msgSend(objb, "setObject:forKeyedSubscript:", -[BWNode output](v160, "output"), v477);
    v52 = v521;
    v133 = a11;
  }
  v169 = (void *)[MEMORY[0x1E4F1CA48] array];
  v170 = objc_alloc_init(BWPixelTransferNode);
  [(BWNode *)v170 setName:@"Still Image Format Converter"];
  -[BWPixelTransferNode setOutputColorSpaceProperties:](v170, "setOutputColorSpaceProperties:", [v25 outputColorSpaceProperties]);
  [(BWPixelTransferNode *)v170 setCropMode:3];
  [(BWPixelTransferNode *)v170 setMaxInputLossyCompressionLevel:3];
  -[BWPixelTransferNode setMaxOutputLossyCompressionLevel:](v170, "setMaxOutputLossyCompressionLevel:", [v25 maxLossyCompressionLevel]);
  [(BWPixelTransferNode *)v170 setConversionMethodForStillImagesDuringHDRVideos:1];
  id v501 = v169;
  v449 = v170;
  [v169 addObject:v170];
  if (v478 == 1)
  {
    v615.receiver = v127;
    v615.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v615, sel_addNode_error_, v170, &v636) & 1) == 0
      || (objc_msgSend(v133, "connectOutput:toInput:pipelineStage:", objc_msgSend(v142, "objectForKeyedSubscript:", v477), -[BWNode input](v170, "input"), v131) & 1) == 0)
    {
      goto LABEL_681;
    }
    objc_msgSend(v142, "setObject:forKeyedSubscript:", -[BWNode output](v170, "output"), v477);
    if (v482)
    {
      long long v614 = 0u;
      long long v613 = 0u;
      long long v612 = 0u;
      long long v611 = 0u;
      uint64_t v171 = [v137 countByEnumeratingWithState:&v611 objects:v652 count:16];
      if (v171)
      {
        uint64_t v172 = v171;
        uint64_t v173 = *(void *)v612;
LABEL_266:
        uint64_t v174 = 0;
        while (1)
        {
          if (*(void *)v612 != v173) {
            objc_enumerationMutation(v137);
          }
          v175 = *(void **)(*((void *)&v611 + 1) + 8 * v174);
          v176 = objc_alloc_init(BWPixelTransferNode);
          -[BWNode setName:](v176, "setName:", [NSString stringWithFormat:@"%@ Format Converter", BWPortTypeToDisplayString(v175, v177)]);
          -[BWPixelTransferNode setOutputColorSpaceProperties:](v176, "setOutputColorSpaceProperties:", [v25 outputColorSpaceProperties]);
          [(BWPixelTransferNode *)v176 setCropMode:3];
          -[BWPixelTransferNode setMaxLossyCompressionLevel:](v176, "setMaxLossyCompressionLevel:", [v25 maxLossyCompressionLevel]);
          v610.receiver = (id)v487;
          v610.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
          if ((objc_msgSendSuper2(&v610, sel_addNode_error_, v176, &v636) & 1) == 0) {
            goto LABEL_681;
          }
          id v142 = objb;
          if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", objc_msgSend(objb, "objectForKeyedSubscript:", v175), -[BWNode input](v176, "input"), v513) & 1) == 0)goto LABEL_681; {
          objc_msgSend(objb, "setObject:forKeyedSubscript:", -[BWNode output](v176, "output"), v175);
          }
          [v501 addObject:v176];
          if (v172 == ++v174)
          {
            uint64_t v172 = [v137 countByEnumeratingWithState:&v611 objects:v652 count:16];
            if (v172) {
              goto LABEL_266;
            }
            break;
          }
        }
      }
    }
    if ((unint64_t)[v137 count] >= 2)
    {
      uint64_t v414 = v11;
      LODWORD(v412) = 0;
      FigDebugAssert3();
    }
    uint64_t v178 = objc_msgSend(v137, "firstObject", v412, v414);
    v656[0] = 0;
    v658[0] = 0;
    v127 = (unsigned int *)v487;
    v133 = a11;
    v52 = v521;
    unsigned int v637 = -[FigCaptureStillImageUnifiedBracketingSinkPipeline _buildRedEyeReductionSubPipelineWithName:pipelineStage:graph:sensorConfigurationsByPortType:inferenceScheduler:subPipelineInputOut:subPipelineOutputOut:](v487, @"Default", (uint64_t)v513, a11, (uint64_t)v521, a9, v656, v658);
    if (v637) {
      goto LABEL_681;
    }
    if (v421)
    {
      uint64_t v609 = 0;
      *(void *)type = 0;
      unsigned int v637 = -[FigCaptureStillImageUnifiedBracketingSinkPipeline _buildRedEyeReductionSubPipelineWithName:pipelineStage:graph:sensorConfigurationsByPortType:inferenceScheduler:subPipelineInputOut:subPipelineOutputOut:](v487, @"Secondary", v424, a11, (uint64_t)v521, a9, &v609, (uint64_t *)type);
      if (v637) {
        goto LABEL_681;
      }
      uint64_t v179 = [v142 objectForKeyedSubscript:v477];
      if (([a11 connectOutput:v179 toInput:v656[0] pipelineStage:v513] & 1) == 0) {
        goto LABEL_681;
      }
      [v142 setObject:v658[0] forKeyedSubscript:v477];
      uint64_t v180 = [v142 objectForKeyedSubscript:v178];
      if (([a11 connectOutput:v180 toInput:v609 pipelineStage:v424] & 1) == 0) {
        goto LABEL_681;
      }
      uint64_t v181 = *(void *)type;
LABEL_284:
      [v142 setObject:v181 forKeyedSubscript:v178];
      v131 = v513;
      goto LABEL_289;
    }
    if (v482)
    {
      uint64_t v182 = [v142 objectForKeyedSubscript:v178];
      if (([a11 connectOutput:v182 toInput:v656[0] pipelineStage:v424] & 1) == 0) {
        goto LABEL_681;
      }
      uint64_t v181 = v658[0];
      goto LABEL_284;
    }
    uint64_t v183 = [v142 objectForKeyedSubscript:v477];
    v131 = v513;
    if (([a11 connectOutput:v183 toInput:v656[0] pipelineStage:v513] & 1) == 0) {
      goto LABEL_681;
    }
    [v142 setObject:v658[0] forKeyedSubscript:v477];
  }
LABEL_289:
  if (v498)
  {
    id v184 = [[BWDepthSynchronizerNode alloc] initForStreaming:0 separateDepthComponentsEnabled:0];
    v607.receiver = v127;
    v607.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v607, sel_addNode_error_, v184, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    [v184 setName:@"Still Image YUV Depth Synchronizer"];
    if ((objc_msgSend(v133, "connectOutput:toInput:pipelineStage:", objc_msgSend(v142, "objectForKeyedSubscript:", v477), objc_msgSend(v184, "imageInput"), v131) & 1) == 0|| (objc_msgSend(v133, "connectOutput:toInput:pipelineStage:", v498, objc_msgSend(v184, "depthInput"), v131) & 1) == 0)
    {
      goto LABEL_681;
    }
    id v142 = objb;
    objc_msgSend(objb, "setObject:forKeyedSubscript:", objc_msgSend(v184, "output"), v477);
  }
  SEL v499 = (SEL)[v142 objectForKeyedSubscript:v477];
  uint64_t v444 = [v137 firstObject];
  v185 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v185, "setObject:forKeyedSubscript:", objc_msgSend(v52, "objectForKeyedSubscript:", v477), v477);
  long long v606 = 0u;
  long long v605 = 0u;
  long long v604 = 0u;
  long long v603 = 0u;
  uint64_t v186 = [v137 countByEnumeratingWithState:&v603 objects:v651 count:16];
  if (v186)
  {
    uint64_t v187 = v186;
    uint64_t v188 = *(void *)v604;
    do
    {
      for (uint64_t k = 0; k != v187; ++k)
      {
        if (*(void *)v604 != v188) {
          objc_enumerationMutation(v137);
        }
        objc_msgSend(v185, "setObject:forKeyedSubscript:", objc_msgSend(v52, "objectForKeyedSubscript:", *(void *)(*((void *)&v603 + 1) + 8 * k)), *(void *)(*((void *)&v603 + 1) + 8 * k));
      }
      uint64_t v187 = [v137 countByEnumeratingWithState:&v603 objects:v651 count:16];
    }
    while (v187);
  }
  if (v464 == 7) {
    objc_msgSend(v185, "setObject:forKeyedSubscript:", objc_msgSend(v52, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DE0]), *MEMORY[0x1E4F52DE0]);
  }
  v190 = v513;
  if (v482)
  {
    v191 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", [v185 count], 1986618469);
    v602.receiver = v127;
    v602.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v602, sel_addNode_error_, v191, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    [(BWNode *)v191 setName:@"UB Funnel"];
    long long v601 = 0u;
    long long v600 = 0u;
    long long v599 = 0u;
    long long v598 = 0u;
    v192 = objb;
    uint64_t v193 = [objb countByEnumeratingWithState:&v598 objects:v650 count:16];
    if (v193)
    {
      uint64_t v194 = v193;
      int v195 = 0;
      uint64_t v196 = *(void *)v599;
LABEL_307:
      uint64_t v197 = 0;
      while (1)
      {
        if (*(void *)v599 != v196) {
          objc_enumerationMutation(v192);
        }
        if (!objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", objc_msgSend(v192, "objectForKeyedSubscript:", *(void *)(*((void *)&v598 + 1) + 8 * v197)), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v191, "inputs"), "objectAtIndexedSubscript:", (v195 + v197)), v454))goto LABEL_681; {
        ++v197;
        }
        v192 = objb;
        if (v194 == v197)
        {
          uint64_t v194 = [objb countByEnumeratingWithState:&v598 objects:v650 count:16];
          v195 += v197;
          if (v194) {
            goto LABEL_307;
          }
          break;
        }
      }
    }
    SEL v499 = [(BWNode *)v191 output];
    v127 = (unsigned int *)v487;
    v52 = v521;
    v190 = v513;
  }
  if (v478 == 1)
  {
    int v198 = v452;
  }
  else
  {
    v597.receiver = v127;
    v597.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    int v198 = v452;
    if ((objc_msgSendSuper2(&v597, sel_addNode_error_, v449, &v636) & 1) == 0
      || (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v499, -[BWNode input](v449, "input"), v190) & 1) == 0)
    {
      goto LABEL_681;
    }
    SEL v499 = [(BWNode *)v449 output];
  }
  v199 = v127;
  if ([v25 clientIsCameraOrDerivative])
  {
    if (v442) {
      int v200 = 2;
    }
    else {
      int v200 = 1;
    }
    int v201 = v475;
    if (v475 == 1) {
      unsigned int v202 = 1;
    }
    else {
      unsigned int v202 = v200;
    }
  }
  else
  {
    if (v198) {
      unsigned int v202 = 8 * [v185 count];
    }
    else {
      unsigned int v202 = 8;
    }
    int v201 = v475;
  }
  BOOL v203 = v201 == 1;
  if (v202 <= 2) {
    int v204 = 2;
  }
  else {
    int v204 = v202;
  }
  if (v485 == 1) {
    int v205 = v204;
  }
  else {
    int v205 = v202;
  }
  v206 = objc_alloc_init(BWUBNodeConfiguration);
  [(BWStillImageNodeConfiguration *)v206 setMetalCommandQueue:[(BWStillImageNodeConfiguration *)v480 metalCommandQueue]];
  [(BWStillImageNodeConfiguration *)v206 setFigThreadPriority:[(BWStillImageNodeConfiguration *)v480 figThreadPriority]];
  [(BWStillImageNodeConfiguration *)v206 setDepthDataType:[(BWStillImageNodeConfiguration *)v480 depthDataType]];
  [(BWStillImageNodeConfiguration *)v206 setPearlModuleType:[(BWStillImageNodeConfiguration *)v480 pearlModuleType]];
  [(BWStillImageNodeConfiguration *)v206 setInferenceScheduler:[(BWStillImageNodeConfiguration *)v480 inferenceScheduler]];
  [(BWStillImageNodeConfiguration *)v206 setMaxLossyCompressionLevel:[(BWStillImageNodeConfiguration *)v480 maxLossyCompressionLevel]];
  -[BWUBNodeConfiguration setSensorConfigurationsByPortType:](v206, (char *)v185);
  -[BWUBNodeConfiguration setInputIs10Bit:]((uint64_t)v206, [v25 inputIs10Bit]);
  -[BWUBNodeConfiguration setRetainedBufferCount:]((uint64_t)v206, v492);
  unsigned int v493 = v205;
  -[BWUBNodeConfiguration setOutputBufferCount:]((uint64_t)v206, v205);
  -[BWUBNodeConfiguration setMinimumOutputBufferCount:]((uint64_t)v206, v202);
  -[BWUBNodeConfiguration setMaxNumberOfBurstCapturesAllowedInFlight:]((uint64_t)v206, 2);
  -[BWUBNodeConfiguration setOutputPoolBackPressureEnabled:]((uint64_t)v206, v485 == 2);
  [(BWStillImageNodeConfiguration *)v206 setDeferredCaptureSupportEnabled:v438];
  [(BWStillImageNodeConfiguration *)v206 setDeferredPhotoProcessorEnabled:v203];
  -[BWUBNodeConfiguration setStillImageFusionScheme:]((uint64_t)v206, [v25 noiseReductionAndFusionScheme]);
  uint64_t v207 = (uint64_t)v199;
  [(BWStillImageNodeConfiguration *)v206 setFigThreadPriority:v199[12]];
  -[BWUBNodeConfiguration setReferenceFrameSelectionDelegate:]((uint64_t)v206, *((void *)v199 + 7));
  if (v433) {
    -[BWUBNodeConfiguration setOutputDimensions:]((uint64_t)v206, [v25 outputStillImageDimensions]);
  }
  -[BWUBNodeConfiguration setFusionSupportEnabled:]((uint64_t)v206, v467);
  -[BWUBNodeConfiguration setDigitalFlashSupportEnabled:]((uint64_t)v206, v468);
  char v208 = [v25 deepFusionSupported];
  if (v475 == 1) {
    char v209 = 0;
  }
  else {
    char v209 = v208;
  }
  -[BWUBNodeConfiguration setDeepFusionSyntheticsInNRSupportEnabled:]((uint64_t)v206, v209);
  int v210 = [v25 deepFusionSupported];
  if (v485 == 2) {
    char v211 = 0;
  }
  else {
    char v211 = v438;
  }
  if (v210) {
    char v212 = v211;
  }
  else {
    char v212 = 0;
  }
  -[BWUBNodeConfiguration setDeepFusionWaitForPreprocessingToFinish:]((uint64_t)v206, v212);
  -[BWUBNodeConfiguration setDeepFusionSupportEnabled:]((uint64_t)v206, [v25 deepFusionSupported]);
  -[BWStillImageNodeConfiguration setDeepFusionEnhancedResolutionDimensions:](v206, "setDeepFusionEnhancedResolutionDimensions:", [v25 deepFusionEnhancedResolutionDimensions]);
  if (v458 == 2) {
    unsigned int v213 = v437;
  }
  else {
    unsigned int v213 = 0;
  }
  if (v475 == 1) {
    char v214 = 1;
  }
  else {
    char v214 = v438;
  }
  v215 = v518;
  v216 = a11;
  if ((v214 & 1) != 0 || v213) {
    int v217 = [v25 deepZoomVersion];
  }
  else {
    int v217 = 0;
  }
  unsigned int v469 = v453 ^ 1;
  -[BWUBNodeConfiguration setDeepZoomVersion:]((uint64_t)v206, v217);
  -[BWUBNodeConfiguration setMaxDeepFusionOutputCount:]((uint64_t)v206, 1);
  -[BWUBNodeConfiguration setLearnedNRMode:]((uint64_t)v206, v459);
  -[BWUBNodeConfiguration setDepthDataDeliveryEnabled:]((uint64_t)v206, v486);
  if (v471)
  {
    v218 = [BWSensorConfiguration alloc];
    uint64_t v219 = objc_msgSend((id)objc_msgSend(v471, "captureStream"), "portType");
    uint64_t v220 = objc_msgSend((id)objc_msgSend(v471, "captureStream"), "sensorIDString");
    uint64_t v221 = objc_msgSend((id)objc_msgSend(v471, "captureStream"), "sensorIDDictionary");
    uint64_t v222 = objc_msgSend(v423, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v471, "captureStream"), "portType"));
    v223 = v218;
    uint64_t v224 = v220;
    v215 = v518;
    v216 = a11;
    -[BWUBNodeConfiguration setJasperSensorConfiguration:](v206, (char *)[(BWSensorConfiguration *)v223 initWithPortType:v219 sensorIDString:v224 sensorIDDictionary:v221 cameraInfo:v222]);
  }
  -[BWUBNodeConfiguration setAlwaysAllowModifyingInputBuffers:]((uint64_t)v206, v434 & v435);
  [v25 ubInferenceMainImageDownscalingFactor];
  -[BWUBNodeConfiguration setInferenceMainImageDownscalingFactor:]((uint64_t)v206, v225);
  -[BWUBNodeConfiguration setProvidedInferenceAttachedMediaByMode:](v206, (char *)newValuea);
  -[BWUBNodeConfiguration setSemanticRenderingVersion:]((uint64_t)v206, v447);
  -[BWUBNodeConfiguration setSemanticDevelopmentVersion:]((uint64_t)v206, v455);
  -[BWUBNodeConfiguration setPersonSemanticsVersion:]((uint64_t)v206, [(FigCaptureCameraParameters *)v215 personSemanticsVersion]);
  -[BWUBNodeConfiguration setSemanticStyleRenderingEnabled:]((uint64_t)v206, [v25 semanticStyleRenderingEnabled]);
  if (v476 == 2)
  {
    if ([(FigCaptureCameraParameters *)v215 disparityVersion] >= 5)
    {
      -[BWUBNodeConfiguration setPortTypesWithDepthSegmentationPortraitParameters:](v206, (char *)[v450 allKeys]);
      -[BWStillImageNodeConfiguration setDepthDataType:](v206, "setDepthDataType:", [v25 depthDataType]);
      -[BWUBNodeConfiguration setShouldComputeDisparityWhenCalibrationFails:]((uint64_t)v206, v469);
    }
    -[BWUBNodeConfiguration setGenerateLiDARDepth:]((uint64_t)v206, v464 == 7);
    uint64_t v226 = v441;
  }
  else
  {
    -[BWUBNodeConfiguration setGenerateLiDARDepth:]((uint64_t)v206, v464 == 7);
    uint64_t v226 = v441;
    if (v464 != 7) {
      goto LABEL_365;
    }
  }
  -[BWUBNodeConfiguration setDisparityOutputDimensions:]((uint64_t)v206, [v25 depthDataDimensions]);
LABEL_365:
  -[BWUBNodeConfiguration setDemosaicedRawEnabled:]((uint64_t)v206, v463);
  if (v463) {
    -[BWUBNodeConfiguration setDemosaicedRawPixelFormat:]((uint64_t)v206, [v25 demosaicedRawPixelFormat]);
  }
  -[BWUBNodeConfiguration setRawColorCalibrationsByPortType:](v206, (char *)[v25 rawColorCalibrationsByPortType]);
  -[BWUBNodeConfiguration setRawLensShadingCorrectionCoefficientsByPortType:](v206, (char *)[v25 rawLensShadingCorrectionCoefficientsByPortType]);
  if (v436)
  {
    -[BWUBNodeConfiguration setIntelligentDistortionCorrectionVersion:]((uint64_t)v206, [v25 dcProcessorVersion]);
    if (v456) {
      v227 = (char *)[v25 portTypesWithGeometricDistortionCorrectionEnabled];
    }
    else {
      v227 = 0;
    }
    -[BWUBNodeConfiguration setPortTypesWithGeometricDistortionCorrectionEnabled:](v206, v227);
    -[BWUBNodeConfiguration setGeometricDistortionCorrectionExpandedImageDimensions:]((uint64_t)v206, v419);
    -[BWUBNodeConfiguration setPortTypesWithIntelligentDistortionCorrectionEnabled:](v206, (char *)[v25 portTypesWithIntelligentDistortionCorrectionEnabled]);
    -[BWUBNodeConfiguration setIntelligentDistortionCorrectionAppliesFinalDimensions:]((uint64_t)v206, !v515 | v456);
  }
  -[BWUBNodeConfiguration setGreenGhostMitigationVersion:]((uint64_t)v206, [v25 greenGhostMitigationVersion]);
  -[BWUBNodeConfiguration setRedEyeReductionEnabled:]((uint64_t)v206, v478 > 1);
  [v25 gainMapMainImageDownscalingFactor];
  -[BWUBNodeConfiguration setGainMapMainImageDownscalingFactor:]((uint64_t)v206, v228);
  -[BWUBNodeConfiguration setHorizontalSensorBinningFactor:]((uint64_t)v206, [v25 horizontalSensorBinningFactor]);
  -[BWUBNodeConfiguration setVerticalSensorBinningFactor:]((uint64_t)v206, [v25 verticalSensorBinningFactor]);
  v229 = [[BWUBNode alloc] initWithNodeConfiguration:v206 captureDevice:v479];
  v596.receiver = v199;
  v596.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
  if ((objc_msgSendSuper2(&v596, sel_addNode_error_, v229, &v636) & 1) == 0) {
    goto LABEL_681;
  }
  [(BWNode *)v229 setName:@"UB"];
  [*((id *)v199 + 7) setStillImageProcessingSupportProvider:v229];
  if ((objc_msgSend(v216, "connectOutput:toInput:pipelineStage:", v499, -[BWNode input](v229, "input"), v454) & 1) == 0) {
    goto LABEL_681;
  }
  if (v226)
  {
    v230 = newValuea;
    if ((objc_msgSend(v216, "connectOutput:toInput:pipelineStage:", v226, -[BWUBNode pointCloudInput](v229, "pointCloudInput"), v454) & 1) == 0)goto LABEL_681; {
  }
    }
  else
  {
    uint64_t v231 = *MEMORY[0x1E4F52DE0];
    v230 = newValuea;
    if ([v416 objectForKeyedSubscript:*MEMORY[0x1E4F52DE0]]
      && (objc_msgSend(v216, "connectOutput:toInput:pipelineStage:", objc_msgSend(v416, "objectForKeyedSubscript:", v231), -[BWUBNode pointCloudInput](v229, "pointCloudInput"), v454) & 1) == 0)
    {
      goto LABEL_681;
    }
  }
  objc = [(BWNode *)v229 output];
  if (((!v515 | v456) & 1) == 0)
  {
    v232 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    [v25 gainMapMainImageDownscalingFactor];
    if (v233 != 0.0)
    {
      v234 = NSNumber;
      [v25 gainMapMainImageDownscalingFactor];
      objc_msgSend(v232, "setObject:forKeyedSubscript:", objc_msgSend(v234, "numberWithFloat:"), 0x1EFA4EB60);
    }
    v235 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v592 = 0u;
    long long v593 = 0u;
    long long v594 = 0u;
    long long v595 = 0u;
    uint64_t v236 = [v230 countByEnumeratingWithState:&v592 objects:v649 count:16];
    if (v236)
    {
      uint64_t v237 = v236;
      uint64_t v238 = *(void *)v593;
      do
      {
        for (uint64_t m = 0; m != v237; ++m)
        {
          if (*(void *)v593 != v238) {
            objc_enumerationMutation(v230);
          }
          objc_msgSend(v235, "addObjectsFromArray:", objc_msgSend(v230, "objectForKeyedSubscript:", *(void *)(*((void *)&v592 + 1) + 8 * m)));
        }
        uint64_t v237 = [v230 countByEnumeratingWithState:&v592 objects:v649 count:16];
      }
      while (v237);
    }
    if (v463)
    {
      [v232 setObject:&unk_1EFB05938 forKeyedSubscript:0x1EFA745E0];
      long long v591 = 0u;
      long long v590 = 0u;
      long long v589 = 0u;
      long long v588 = 0u;
      uint64_t v240 = [v235 countByEnumeratingWithState:&v588 objects:v648 count:16];
      if (v240)
      {
        uint64_t v241 = v240;
        uint64_t v242 = *(void *)v589;
        do
        {
          for (uint64_t n = 0; n != v241; ++n)
          {
            if (*(void *)v589 != v242) {
              objc_enumerationMutation(v235);
            }
            uint64_t v244 = *(void *)(*((void *)&v588 + 1) + 8 * n);
            v245 = NSNumber;
            [v25 ubInferenceMainImageDownscalingFactor];
            objc_msgSend(v232, "setObject:forKeyedSubscript:", objc_msgSend(v245, "numberWithFloat:"), v244);
          }
          uint64_t v241 = [v235 countByEnumeratingWithState:&v588 objects:v648 count:16];
        }
        while (v241);
      }
    }
    v246 = [[BWStillImageScalerNode alloc] initWithBasePoolCapacity:v493 nodeConfiguration:v480];
    [(BWNode *)v246 setName:@"Resizing"];
    -[BWStillImageScalerNode setResizedOutputDimensions:](v246, "setResizedOutputDimensions:", [v25 outputStillImageDimensions]);
    [(BWStillImageScalerNode *)v246 setBlackFillingRequired:0];
    [(BWStillImageScalerNode *)v246 setMainImageDownscalingFactorByAttachedMediaKey:v232];
    uint64_t v207 = v487;
    v587.receiver = (id)v487;
    v587.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v587, sel_addNode_error_, v246, &v636) & 1) == 0)
    {
      FigDebugAssert3();
      int v410 = -12786;
      goto LABEL_680;
    }
    v216 = a11;
    if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", objc, -[BWNode input](v246, "input"), v513) & 1) == 0) {
      goto LABEL_681;
    }
    objc = [(BWNode *)v246 output];
    v52 = v521;
  }
  uint64_t v247 = 0;
  id v248 = v484;
  if (((v461 | v486 ^ 1) & 1) == 0 && v476 != 2)
  {
    v249 = +[BWStillImageConditionalRouterUBConfiguration configurationWithPortTypes:v484];
    v250 = [[BWStillImageConditionalRouterNode alloc] initWithRoutingConfiguration:v249];
    v586.receiver = (id)v207;
    v586.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v586, sel_addNode_error_, v250, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    [(BWNode *)v250 setName:@"UB Router"];
    if ((objc_msgSend(v216, "connectOutput:toInput:pipelineStage:", objc, -[BWNode input](v250, "input"), v513) & 1) == 0) {
      goto LABEL_681;
    }
    if ((unint64_t)[v488 count] >= 2)
    {
      uint64_t v414 = v11;
      LODWORD(v412) = 0;
      FigDebugAssert3();
    }
    uint64_t v251 = -[BWStillImageConditionalRouterUBConfiguration outputIndexForPortType:](v249, "outputIndexForPortType:", v444, v412, v414);
    uint64_t v252 = [(BWStillImageConditionalRouterUBConfiguration *)v249 outputIndexForPortType:v477];
    if (v251 == 0x7FFFFFFFFFFFFFFFLL || v252 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_679;
    }
    objc = [(NSArray *)[(BWNode *)v250 outputs] objectAtIndexedSubscript:v252];
    uint64_t v247 = [(NSArray *)[(BWNode *)v250 outputs] objectAtIndexedSubscript:v251];
  }
  v253 = [(BWNodeInput *)[(BWNode *)v229 input] formatRequirements];
  long long v582 = 0u;
  long long v583 = 0u;
  long long v584 = 0u;
  long long v585 = 0u;
  uint64_t v254 = [v501 countByEnumeratingWithState:&v582 objects:v647 count:16];
  if (v254)
  {
    uint64_t v255 = v254;
    uint64_t v256 = *(void *)v583;
    do
    {
      for (iuint64_t i = 0; ii != v255; ++ii)
      {
        if (*(void *)v583 != v256) {
          objc_enumerationMutation(v501);
        }
        v258 = *(void **)(*((void *)&v582 + 1) + 8 * ii);
        objc_msgSend(v258, "setPreferredOutputPixelFormats:", -[BWFormatRequirements supportedPixelFormats](v253, "supportedPixelFormats"));
        [v258 setConverting10BitVideoRangeTo8BitFullRangeEncouraged:1];
      }
      uint64_t v255 = [v501 countByEnumeratingWithState:&v582 objects:v647 count:16];
    }
    while (v255);
  }
  if ((v442 & v453) == 1)
  {
    v259 = objc_alloc_init(BWPortraitHDRStagingNode);
    v581.receiver = (id)v207;
    v581.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    v260 = a11;
    BOOL v261 = v432;
    uint64_t v262 = (uint64_t)objc;
    if ((objc_msgSendSuper2(&v581, sel_addNode_error_, v259, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    v263 = v259;
    *(void *)(v207 + 96) = v263;
    if (v488)
    {
      if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v247, -[BWNode input](v263, "input"), v457) & 1) == 0) {
        goto LABEL_681;
      }
      uint64_t v247 = [*(id *)(v207 + 96) output];
    }
    else
    {
      v264 = v518;
      if ((v470 & 1) == 0)
      {
        unsigned int v265 = v462;
        if (v462 > 9) {
          goto LABEL_429;
        }
        if (((1 << v462) & 0x230) == 0)
        {
          unsigned int v265 = v462;
          goto LABEL_429;
        }
      }
      if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", objc, -[BWNode input](v263, "input"), v457) & 1) == 0) {
        goto LABEL_681;
      }
      uint64_t v262 = [*(id *)(v207 + 96) output];
    }
  }
  else
  {
    v260 = a11;
    BOOL v261 = v432;
    uint64_t v262 = (uint64_t)objc;
  }
  int v266 = v486;
  unsigned int v265 = v462;
  if (!v486)
  {
    v264 = v518;
    goto LABEL_433;
  }
  v264 = v518;
  if (v470)
  {
LABEL_431:
    int v266 = !v261;
    goto LABEL_433;
  }
LABEL_429:
  int v266 = 0;
  if (v265 <= 9 && ((1 << v265) & 0x230) != 0) {
    goto LABEL_431;
  }
LABEL_433:
  unsigned int v489 = v266;
  if (v265 == 6) {
    int v266 = 1;
  }
  char v494 = v266 | v261;
  if ((v266 | v261) == 1)
  {
    v267 = [[BWInferenceNode alloc] initWithScheduler:a9 priority:*(unsigned int *)(v207 + 52)];
    v268 = v267;
    if (v462 == 6)
    {
      [(BWNode *)v267 setName:@"MonocularDepth"];
      [(BWInferenceNode *)v268 addInferenceOfType:106 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:[[BWMonocularDepthConfiguration alloc] initWithInferenceType:106 monocularDepthType:2]];
      v269 = v513;
    }
    else
    {
      v269 = v513;
      if (v489)
      {
        [(BWNode *)v267 setName:@"RGB Segmentation"];
        [(BWInferenceNode *)v268 addInferenceOfType:103 version:+[BWRGBPersonSegmentationInferenceConfiguration portraitVersion] & 0xFFFFFFFFFFFFLL];
      }
    }
    if (-[FigCapturePhotonicEngineSinkPipeline _addLandmarksInferenceToNode:](v207, v268)) {
      goto LABEL_679;
    }
    v580.receiver = (id)v207;
    v580.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v580, sel_addNode_error_, v268, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    uint64_t v270 = [(BWNode *)v268 input];
    if (v482)
    {
      if (([v260 connectOutput:v247 toInput:v270 pipelineStage:v269] & 1) == 0) {
        goto LABEL_681;
      }
    }
    else if (([v260 connectOutput:v262 toInput:v270 pipelineStage:v269] & 1) == 0)
    {
      goto LABEL_681;
    }
    uint64_t v271 = [(BWNode *)v268 output];
    if (v445)
    {
      id objd = (id)v262;
      v272 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.person-semantics" priority:*(unsigned int *)(v207 + 48)];
      v273 = [[BWFanOutNode alloc] initWithFanOutCount:2 mediaType:1986618469];
      [(BWNode *)v273 setName:@"Concurrent PersonSemantics / DepthProcessing Fan Out"];
      v579.receiver = (id)v207;
      v579.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
      if ((objc_msgSendSuper2(&v579, sel_addNode_error_, v273, &v636) & 1) == 0
        || (objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", v271, -[BWNode input](v273, "input"), v457) & 1) == 0)
      {
        goto LABEL_681;
      }
      uint64_t v274 = [(NSArray *)[(BWNode *)v273 outputs] objectAtIndexedSubscript:0];
      int v275 = v470;
      if (v462 == 6) {
        int v275 = 1;
      }
      if (v275 == 1)
      {
        v276 = [BWAttachedMediaSplitNode alloc];
        v646[0] = @"PrimaryFormat";
        v646[1] = @"Depth";
        v277 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:](v276, "initWithAttachedMediaKeys:", [MEMORY[0x1E4F1C978] arrayWithObjects:v646 count:2]);
        [(BWNode *)v277 setName:@"Unprocessed DepthData Discarder"];
        v578.receiver = (id)v207;
        v578.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
        if ((objc_msgSendSuper2(&v578, sel_addNode_error_, v277, &v636) & 1) == 0
          || (objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", v274, -[BWNode input](v277, "input"), v272) & 1) == 0)
        {
          goto LABEL_681;
        }
        uint64_t v274 = [(BWNode *)v277 output];
      }
      v278 = [[BWInferenceNode alloc] initWithScheduler:a9 priority:*(unsigned int *)(v207 + 52)];
      [(BWInferenceNode *)v278 addInferenceOfType:104 version:(unsigned __int16)Major | ((unint64_t)v427 << 16) configuration:v439];
      [(BWNode *)v278 setName:@"Person Semantics"];
      if (v431 >= 1)
      {
        [v25 portraitEffectsMatteMainImageDownscalingFactor];
        float v280 = v279;
        unsigned int v281 = [(BWPersonSemanticsConfiguration *)v439 enabledSemantics];
        uint64_t v282 = [(BWStillImageNodeConfiguration *)v480 metalCommandQueue];
        char v283 = [v25 clientIsCameraOrDerivative];
        uint64_t v284 = v282;
        uint64_t v207 = v487;
        if (-[FigCaptureStillImageUnifiedBracketingSinkPipeline _addMattingInferenceToNode:mattingVersion:refinedDepthEnabled:mainImageDownscalingFactor:enabledSemantics:metalCommandQueue:mattingsensorConfigurationsByPortType:clientIsCameraOrDerivative:requiredAdditionalInferenceOutputBuffers:zoomFactorForPortrait:](v487, v278, v418, v428, v281, v284, v450, v283, v280, v78, v417))goto LABEL_679; {
      }
        }
      v577.receiver = (id)v207;
      v577.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
      if ((objc_msgSendSuper2(&v577, sel_addNode_error_, v278, &v636) & 1) == 0
        || (objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", v274, -[BWNode input](v278, "input"), v272) & 1) == 0)
      {
        goto LABEL_681;
      }
      v502 = [(BWNode *)v278 output];
      uint64_t v271 = [(NSArray *)[(BWNode *)v273 outputs] objectAtIndexedSubscript:1];
      v52 = v521;
      v264 = v518;
      uint64_t v262 = (uint64_t)objd;
    }
    else
    {
      v502 = 0;
    }
    if (v482) {
      uint64_t v247 = v271;
    }
    else {
      uint64_t v262 = v271;
    }
    unsigned int v265 = v462;
  }
  else
  {
    v502 = 0;
  }
  if (v486 && v265 <= 9 && ((1 << v265) & 0x230) != 0)
  {
    uint64_t v285 = [v25 depthDataDimensions];
    v286 = -[BWStillImageFocusPixelDisparityNode initWithNodeConfiguration:sensorConfiguration:disparityMapWidth:disparityMapHeight:depthIsAlwaysHighQuality:]([BWStillImageFocusPixelDisparityNode alloc], "initWithNodeConfiguration:sensorConfiguration:disparityMapWidth:disparityMapHeight:depthIsAlwaysHighQuality:", v480, v473, (int)v285, v285 >> 32, [v25 clientIsCameraOrDerivative]);
    v287 = (void *)v207;
    v288 = (BWInferenceSynchronizerNode *)v286;
    v576.receiver = v287;
    v576.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v576, sel_addNode_error_, v286, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    uint64_t v289 = [(BWNode *)v288 input];
    v290 = v513;
    if (!v482)
    {
      v298 = v472;
      v299 = v450;
      v300 = newValuea;
      if (([v260 connectOutput:v262 toInput:v289 pipelineStage:v513] & 1) == 0) {
        goto LABEL_681;
      }
      goto LABEL_560;
    }
    if (([v260 connectOutput:v247 toInput:v289 pipelineStage:v513] & 1) == 0) {
      goto LABEL_681;
    }
    uint64_t v291 = [(BWNode *)v288 output];
    uint64_t v207 = v487;
    if (v476 != 2)
    {
      uint64_t v247 = v291;
      goto LABEL_487;
    }
LABEL_476:
    uint64_t v292 = v262;
    id v293 = +[BWStillImageConditionalRouterInferenceConfiguration inferenceConfiguration];
    v294 = [[BWStillImageConditionalRouterNode alloc] initWithRoutingConfiguration:v293];
    v575.receiver = (id)v207;
    v575.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v575, sel_addNode_error_, v294, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    [(BWNode *)v294 setName:@"Inference Conditional Router"];
    if ((objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", v292, -[BWNode input](v294, "input"), v290) & 1) == 0) {
      goto LABEL_681;
    }
    v295 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.inference.bravo" priority:*(unsigned int *)(v207 + 48)];
    v296 = [[BWInferenceNode alloc] initWithScheduler:a9 priority:*(unsigned int *)(v207 + 52)];
    if ((v494 & 1) == 0)
    {
      char v297 = v474;
      if (v431 <= 0) {
        char v297 = 0;
      }
      if (v297)
      {
        char v494 = 0;
        goto LABEL_550;
      }
      if (-[FigCapturePhotonicEngineSinkPipeline _addLandmarksInferenceToNode:](v207, v296)) {
        goto LABEL_679;
      }
    }
    char v494 = 1;
LABEL_550:
    if ((v483 & v445) == 1)
    {
      v335 = [(BWNode *)v296 name];
      uint64_t v336 = [(NSString *)v335 length];
      v337 = @"Person Semantics";
      if (v336) {
        v337 = [(NSString *)v335 stringByAppendingFormat:@" + %@", @"Person Semantics"];
      }
      [(BWNode *)v296 setName:v337];
      [(BWInferenceNode *)v296 addInferenceOfType:104 version:(unsigned __int16)Major | ((unint64_t)v427 << 16) configuration:v439];
      if (v431 >= 1)
      {
        [v25 portraitEffectsMatteMainImageDownscalingFactor];
        if (-[FigCaptureStillImageUnifiedBracketingSinkPipeline _addMattingInferenceToNode:mattingVersion:refinedDepthEnabled:mainImageDownscalingFactor:enabledSemantics:metalCommandQueue:mattingsensorConfigurationsByPortType:clientIsCameraOrDerivative:requiredAdditionalInferenceOutputBuffers:zoomFactorForPortrait:](v207, v296, v418, 0, -[BWPersonSemanticsConfiguration enabledSemantics](v439, "enabledSemantics"), (uint64_t)-[BWStillImageNodeConfiguration metalCommandQueue](v480, "metalCommandQueue"), v450, [v25 clientIsCameraOrDerivative], v338, v78, v417))goto LABEL_679; {
      }
        }
    }
    v574.receiver = (id)v207;
    v574.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v574, sel_addNode_error_, v296, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v294, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v293, "inferenceOuputIndex")), -[BWNode input](v296, "input"), v295) & 1) == 0)goto LABEL_681; {
    uint64_t v339 = [(BWNode *)v296 output];
    }
    v288 = [[BWInferenceSynchronizerNode alloc] initWithIndexOfInputProvidingOutputSampleBuffer:1 indexOfInputProvidingPreferredInferences:1 errorHandlingModel:0];
    [(BWNode *)v288 setName:@"Disparity/Inference Sync"];
    [(BWInferenceSynchronizerNode *)v288 setSynchronizesTopLevelAttachments:1];
    v573.receiver = (id)v487;
    v573.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v573, sel_addNode_error_, v288, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    v260 = a11;
    v298 = v472;
    v299 = v450;
    v300 = newValuea;
    if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v294, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v293, "defaultOutputIndex")), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v288, "inputs"), "objectAtIndexedSubscript:", 0), v457) & 1) == 0)goto LABEL_681; {
    char v340 = objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v339, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v288, "inputs"), "objectAtIndexedSubscript:", 1), v457);
    }
    v264 = v518;
    v290 = v513;
    if ((v340 & 1) == 0) {
      goto LABEL_681;
    }
    goto LABEL_560;
  }
  if (!v482)
  {
    v298 = v472;
    v299 = v450;
    v300 = newValuea;
    v290 = v513;
    goto LABEL_562;
  }
  v290 = v513;
  if (v476 == 2) {
    goto LABEL_476;
  }
  if (!v486)
  {
    if (!v452)
    {
      v298 = v472;
      v299 = v450;
      v300 = newValuea;
LABEL_568:
      if (v502)
      {
        v343 = [[BWInferenceSynchronizerNode alloc] initWithIndexOfInputProvidingOutputSampleBuffer:0 indexOfInputProvidingPreferredInferences:1 errorHandlingModel:0];
        [(BWNode *)v343 setName:@"DepthData Processing / PersonSemantics"];
        v557.receiver = (id)v207;
        v557.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
        if ((objc_msgSendSuper2(&v557, sel_addNode_error_, v343, &v636) & 1) == 0
          || (objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", v262, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v343, "inputs"), "objectAtIndexedSubscript:", 0), v457) & 1) == 0|| (objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", v502, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v343, "inputs"), "objectAtIndexedSubscript:", 1), v457) & 1) == 0)
        {
          goto LABEL_681;
        }
        uint64_t v262 = [(BWNode *)v343 output];
      }
      if (v430)
      {
        v344 = [BWStillImagePortraitMetadataNode alloc];
        *(float *)&double v345 = v78;
        v346 = [(BWStillImagePortraitMetadataNode *)v344 initWithNodeConfiguration:v480 sdofRenderingVersion:v430 sensorConfigurationsByPortType:v299 defaultPortType:v446 defaultZoomFactor:v345];
        v556.receiver = (id)v207;
        v556.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
        if ((objc_msgSendSuper2(&v556, sel_addNode_error_, v346, &v636) & 1) == 0
          || (objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", v262, -[BWNode input](v346, "input"), v290) & 1) == 0)
        {
          goto LABEL_681;
        }
        uint64_t v262 = [(BWNode *)v346 output];
      }
      if (!v483)
      {
LABEL_604:
        if (v465)
        {
          if ([v298 previewQualityAdjustedPhotoFilterRenderingEnabled]) {
            int v356 = 2;
          }
          else {
            int v356 = 0;
          }
          v357 = [BWStillImageFilterNode alloc];
          LOBYTE(v415) = 0;
          LODWORD(v412) = v356;
          *(float *)&double v358 = v78;
          v359 = [(BWStillImageFilterNode *)v357 initWithNodeConfiguration:v480 sensorConfigurationsByPortType:v299 statusDelegate:0 depthDataDeliveryEnabled:v486 personSegmentationEnabled:v474 refinedDepthEnabled:v428 portraitRenderQuality:0.0 targetAspectRatio:v358 defaultPortType:v412 defaultZoomFactor:v446 backPressureDrivenPipelining:v415];
          v550.receiver = (id)v207;
          v550.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
          if ((objc_msgSendSuper2(&v550, sel_addNode_error_, v359, &v636) & 1) == 0
            || (objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", v262, -[BWNode input](v359, "input"), v457) & 1) == 0)
          {
            goto LABEL_681;
          }
          uint64_t v262 = [(BWNode *)v359 output];
        }
        if (v485 == 1)
        {
          v360 = [[BWStillImageTurnstileNode alloc] initWithStillImageCoordinator:*(void *)(v207 + 56)];
          v549.receiver = (id)v207;
          v549.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
          if ((objc_msgSendSuper2(&v549, sel_addNode_error_, v360, &v636) & 1) == 0
            || (objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", v262, -[BWNode input](v360, "input"), v290) & 1) == 0)
          {
            goto LABEL_681;
          }
          uint64_t v262 = [(BWNode *)v360 output];
        }
        id objg = (id)v262;
        v361 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        [v25 gainMapMainImageDownscalingFactor];
        if (v362 != 0.0)
        {
          v363 = NSNumber;
          [v25 gainMapMainImageDownscalingFactor];
          objc_msgSend(v361, "setObject:forKeyedSubscript:", objc_msgSend(v363, "numberWithFloat:"), 0x1EFA4EB60);
        }
        if (v463)
        {
          [v361 setObject:&unk_1EFB05938 forKeyedSubscript:0x1EFA745E0];
          long long v548 = 0u;
          long long v547 = 0u;
          long long v546 = 0u;
          long long v545 = 0u;
          uint64_t v519 = [v300 countByEnumeratingWithState:&v545 objects:v643 count:16];
          if (v519)
          {
            uint64_t v517 = *(void *)v546;
            do
            {
              for (juint64_t j = 0; jj != v519; ++jj)
              {
                if (*(void *)v546 != v517) {
                  objc_enumerationMutation(v300);
                }
                uint64_t v365 = *(void *)(*((void *)&v545 + 1) + 8 * jj);
                long long v541 = 0u;
                long long v542 = 0u;
                long long v543 = 0u;
                long long v544 = 0u;
                v366 = (void *)[v300 objectForKeyedSubscript:v365];
                uint64_t v367 = [v366 countByEnumeratingWithState:&v541 objects:v642 count:16];
                if (v367)
                {
                  uint64_t v368 = v367;
                  uint64_t v369 = *(void *)v542;
                  do
                  {
                    for (kuint64_t k = 0; kk != v368; ++kk)
                    {
                      if (*(void *)v542 != v369) {
                        objc_enumerationMutation(v366);
                      }
                      uint64_t v371 = *(void *)(*((void *)&v541 + 1) + 8 * kk);
                      v372 = NSNumber;
                      [v25 ubInferenceMainImageDownscalingFactor];
                      objc_msgSend(v361, "setObject:forKeyedSubscript:", objc_msgSend(v372, "numberWithFloat:"), v371);
                    }
                    uint64_t v368 = [v366 countByEnumeratingWithState:&v541 objects:v642 count:16];
                  }
                  while (v368);
                }
                v300 = newValuea;
              }
              uint64_t v519 = [newValuea countByEnumeratingWithState:&v545 objects:v643 count:16];
            }
            while (v519);
          }
        }
        v373 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        [v25 portraitEffectsMatteMainImageDownscalingFactor];
        if (v374 != 0.0)
        {
          if (v474)
          {
            v375 = NSNumber;
            [v25 portraitEffectsMatteMainImageDownscalingFactor];
            objc_msgSend(v373, "setObject:forKeyedSubscript:", objc_msgSend(v375, "numberWithFloat:"), 0x1EFA74420);
          }
          long long v540 = 0u;
          long long v538 = 0u;
          long long v539 = 0u;
          long long v537 = 0u;
          v376 = (void *)[v25 enabledSemanticSegmentationMatteURNs];
          uint64_t v377 = [v376 countByEnumeratingWithState:&v537 objects:v641 count:16];
          if (v377)
          {
            uint64_t v378 = v377;
            uint64_t v379 = *(void *)v538;
            do
            {
              for (muint64_t m = 0; mm != v378; ++mm)
              {
                if (*(void *)v538 != v379) {
                  objc_enumerationMutation(v376);
                }
                v381 = BWPhotoEncoderAttachedMediaKeyForSemanticSegmentationMatteURN(*(void **)(*((void *)&v537 + 1)
                                                                                              + 8 * mm));
                if (v381)
                {
                  v382 = v381;
                  v383 = NSNumber;
                  [v25 portraitEffectsMatteMainImageDownscalingFactor];
                  objc_msgSend(v373, "setObject:forKeyedSubscript:", objc_msgSend(v383, "numberWithFloat:"), v382);
                }
              }
              uint64_t v378 = [v376 countByEnumeratingWithState:&v537 objects:v641 count:16];
            }
            while (v378);
          }
        }
        unsigned int v384 = [v25 deviceHasFlash];
        if (v475 == 1) {
          uint64_t v385 = 1;
        }
        else {
          uint64_t v385 = v384;
        }
        uint64_t v536 = 0;
        uint64_t v535 = 0;
        if (v475 == 1) {
          int v386 = 1;
        }
        else {
          int v386 = v467;
        }
        v387 = v451;
        unsigned int v637 = -[FigCaptureStillImageUnifiedBracketingSinkPipeline _buildScaleAndEncodeSubPipelineWithPipelineStage:graph:nodeConfiguration:stillImageSinkPipelineWithConfiguration:sensorConfigurationsByPortType:supportsScaling:provideMeteorHeadroom:providePostEncodeInferences:semanticDevelopmentVersion:constituentPhotoDeliveryEnabled:demosaicedRawEnabled:nonPropagatedMainImageDownscalingFactorByAttachedMediaKey:propagatedMainImageDownscalingFactorByAttachedMediaKey:inferenceScheduler:subPipelineInputOut:subPipelineOutputOut:cameraSupportsFlash:cinematicFramingStatesProvider:](v487, (uint64_t)v451, a11, (uint64_t)v480, v25, (uint64_t)v521, 1, v386, v429, v455, v452, v361, v373, a9, &v536, &v535, v385, a10);
        if (v637 || ([a11 connectOutput:objg toInput:v536 pipelineStage:v451] & 1) == 0) {
          goto LABEL_681;
        }
        uint64_t v388 = v535;
        if ([v472 optimizesImagesForOfflineVideoStabilization])
        {
          v389 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          long long v531 = 0u;
          long long v532 = 0u;
          long long v533 = 0u;
          long long v534 = 0u;
          uint64_t v390 = [v521 countByEnumeratingWithState:&v531 objects:v640 count:16];
          if (v390)
          {
            uint64_t v391 = v390;
            uint64_t v392 = *(void *)v532;
            do
            {
              for (nuint64_t n = 0; nn != v391; ++nn)
              {
                if (*(void *)v532 != v392) {
                  objc_enumerationMutation(v521);
                }
                objc_msgSend(v389, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v521, "objectForKeyedSubscript:", *(void *)(*((void *)&v531 + 1) + 8 * nn)), "sensorIDDictionary"), *(void *)(*((void *)&v531 + 1) + 8 * nn));
              }
              uint64_t v391 = [v521 countByEnumeratingWithState:&v531 objects:v640 count:16];
            }
            while (v391);
          }
          unsigned int v394 = [v25 horizontalSensorBinningFactor];
          unsigned int v395 = [v25 verticalSensorBinningFactor];
          [v25 maxSupportedFrameRate];
          uint64_t v397 = FigCaptureBuildMotionAttachmentsNode((void *)v487, v388, v394, v395, v513, [v25 motionAttachmentsSource], (uint64_t)v389, objc_msgSend(v25, "cameraInfoByPortType"), v396, v422, 0, 1, 1, 0, &v637);
          if (v637) {
            goto LABEL_681;
          }
          uint64_t v388 = v397;
          v387 = v451;
        }
        v398 = -[BWStillImageSampleBufferSinkNode initWithSinkID:]([BWStillImageSampleBufferSinkNode alloc], "initWithSinkID:", [(id)v487 sinkID]);
        [(BWNode *)v398 setName:@"Still Image Sink"];
        -[BWStillImageSampleBufferSinkNode setPropagatedAttachedMediaKeys:](v398, "setPropagatedAttachedMediaKeys:", [v373 allKeys]);
        [(BWStillImageSampleBufferSinkNode *)v398 setCameraSupportsFlash:v385];
        v530.receiver = (id)v487;
        v530.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
        if (objc_msgSendSuper2(&v530, sel_addNode_error_, v398, &v636))
        {
          *(void *)(v487 + 72) = v398;
          if (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v388, -[BWNode input](v398, "input"), v387))
          {
            long long v528 = 0u;
            long long v529 = 0u;
            long long v526 = 0u;
            long long v527 = 0u;
            v399 = (void *)[(id)v487 nodes];
            uint64_t v400 = [v399 countByEnumeratingWithState:&v526 objects:v639 count:16];
            if (v400)
            {
              uint64_t v401 = v400;
              uint64_t v402 = *(void *)v527;
              do
              {
                for (uint64_t i1 = 0; i1 != v401; ++i1)
                {
                  if (*(void *)v527 != v402) {
                    objc_enumerationMutation(v399);
                  }
                  v404 = *(void **)(*((void *)&v526 + 1) + 8 * i1);
                  [v404 setDeferredPreparePriority:1];
                  long long v524 = 0u;
                  long long v525 = 0u;
                  long long v522 = 0u;
                  long long v523 = 0u;
                  v405 = (void *)[v404 inputs];
                  uint64_t v406 = [v405 countByEnumeratingWithState:&v522 objects:v638 count:16];
                  if (v406)
                  {
                    uint64_t v407 = v406;
                    uint64_t v408 = *(void *)v523;
                    do
                    {
                      for (uint64_t i2 = 0; i2 != v407; ++i2)
                      {
                        if (*(void *)v523 != v408) {
                          objc_enumerationMutation(v405);
                        }
                        objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v522 + 1) + 8 * i2), "connection"), "setWantsMessageCachingWhileSuspended:", 1);
                      }
                      uint64_t v407 = [v405 countByEnumeratingWithState:&v522 objects:v638 count:16];
                    }
                    while (v407);
                  }
                }
                uint64_t v401 = [v399 countByEnumeratingWithState:&v526 objects:v639 count:16];
              }
              while (v401);
            }
            [*(id *)(v487 + 56) setDeferredPreparePriority:4];
            goto LABEL_682;
          }
        }
        goto LABEL_681;
      }
      if (v494) {
        goto LABEL_583;
      }
      v347 = [[BWInferenceNode alloc] initWithScheduler:a9 priority:*(unsigned int *)(v207 + 52)];
      if (!-[FigCapturePhotonicEngineSinkPipeline _addLandmarksInferenceToNode:](v207, v347))
      {
        v555.receiver = (id)v207;
        v555.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
        if ((objc_msgSendSuper2(&v555, sel_addNode_error_, v347, &v636) & 1) == 0
          || (objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", v262, -[BWNode input](v347, "input"), v290) & 1) == 0)
        {
          goto LABEL_681;
        }
        uint64_t v262 = [(BWNode *)v347 output];
LABEL_583:
        if (v431 > 0) {
          char v348 = v445;
        }
        else {
          char v348 = 0;
        }
        if (v348)
        {
          if ([(FigCaptureCameraParameters *)v264 complementMatteSuppressionDecisionWithISPDetectedFaces])
          {
            int v349 = 4;
          }
          else
          {
            int v349 = 2;
          }
          v350 = [[BWMatteMediaSuppressionNode alloc] initWithBehavior:v349 | v453];
          [(BWNode *)v350 setName:@"Matting Media Suppression Node"];
          v551.receiver = (id)v207;
          v551.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
          if ((objc_msgSendSuper2(&v551, sel_addNode_error_, v350, &v636) & 1) == 0
            || (objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", v262, -[BWNode input](v350, "input"), v290) & 1) == 0)
          {
            goto LABEL_681;
          }
LABEL_603:
          uint64_t v262 = [(BWNode *)v350 output];
          v298 = v472;
          goto LABEL_604;
        }
        id objf = (id)v262;
        id v351 = +[BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration personSegmentationAndMattingConfiguration];
        v352 = [[BWStillImageConditionalRouterNode alloc] initWithRoutingConfiguration:v351];
        [(BWNode *)v352 setName:@"Matting Conditional Router"];
        v554.receiver = (id)v207;
        v554.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
        if ((objc_msgSendSuper2(&v554, sel_addNode_error_, v352, &v636) & 1) == 0) {
          goto LABEL_681;
        }
        v353 = [[BWInferenceNode alloc] initWithScheduler:a9 priority:*(unsigned int *)(v207 + 52)];
        v354 = v353;
        if ((v445 & 1) == 0)
        {
          [(BWInferenceNode *)v353 addInferenceOfType:104 version:(unsigned __int16)Major | ((unint64_t)v427 << 16) configuration:v439];
          [(BWNode *)v354 setName:@"PersonSemantics"];
        }
        [v25 portraitEffectsMatteMainImageDownscalingFactor];
        if (!-[FigCaptureStillImageUnifiedBracketingSinkPipeline _addMattingInferenceToNode:mattingVersion:refinedDepthEnabled:mainImageDownscalingFactor:enabledSemantics:metalCommandQueue:mattingsensorConfigurationsByPortType:clientIsCameraOrDerivative:requiredAdditionalInferenceOutputBuffers:zoomFactorForPortrait:](v207, v354, v418, v428, -[BWPersonSemanticsConfiguration enabledSemantics](v439, "enabledSemantics"), (uint64_t)-[BWStillImageNodeConfiguration metalCommandQueue](v480, "metalCommandQueue"), v299, [v25 clientIsCameraOrDerivative], v355, v78, v417))
        {
          v553.receiver = (id)v207;
          v553.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
          v290 = v513;
          if ((objc_msgSendSuper2(&v553, sel_addNode_error_, v354, &v636) & 1) == 0) {
            goto LABEL_681;
          }
          v350 = [[BWFunnelNode alloc] initWithNumberOfInputs:2 mediaType:1986618469];
          [(BWNode *)v350 setName:@"Matting Funnel"];
          v552.receiver = (id)v207;
          v552.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
          if ((objc_msgSendSuper2(&v552, sel_addNode_error_, v350, &v636) & 1) == 0) {
            goto LABEL_681;
          }
          if ((objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", objf, -[BWNode input](v352, "input"), v513) & 1) == 0) {
            goto LABEL_681;
          }
          if ((objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v352, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v351, "defaultOutputIndex")), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v350, "inputs"), "objectAtIndexedSubscript:", 0), v513) & 1) == 0)goto LABEL_681; {
          if ((objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v352, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v351, "personSegmentationAndMattingOuputIndex")), -[BWNode input](v354, "input"), v513) & 1) == 0)goto LABEL_681;
          }
          v299 = v450;
          if ((objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", -[BWNode output](v354, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v350, "inputs"), "objectAtIndexedSubscript:", 1), v513) & 1) == 0)goto LABEL_681; {
          goto LABEL_603;
          }
        }
      }
LABEL_679:
      int v410 = -12780;
LABEL_680:
      unsigned int v637 = v410;
      goto LABEL_682;
    }
    obje = +[BWStillImageConditionalRouterUBConfiguration configurationWithPortTypes:v484];
    v326 = [[BWStillImageConditionalRouterNode alloc] initWithRoutingConfiguration:obje];
    v566.receiver = (id)v207;
    v566.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v566, sel_addNode_error_, v326, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    [(BWNode *)v326 setName:@"UB Router for ConstituentPhoto without Depth"];
    if ((objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", v262, -[BWNode input](v326, "input"), v513) & 1) == 0) {
      goto LABEL_681;
    }
    v327 = -[BWStillImageMultiCameraDoserNode initWithPortTypes:]([BWStillImageMultiCameraDoserNode alloc], "initWithPortTypes:", [v52 allKeys]);
    v565.receiver = (id)v207;
    v565.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v565, sel_addNode_error_, v327, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    v328 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWFunnelNode alloc], "initWithNumberOfInputs:mediaType:", [v484 count], 1986618469);
    v564.receiver = (id)v207;
    v564.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v564, sel_addNode_error_, v328, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    v516 = v328;
    [(BWNode *)v328 setName:@"Camera Calibration Data"];
    long long v563 = 0u;
    long long v562 = 0u;
    long long v561 = 0u;
    long long v560 = 0u;
    uint64_t v329 = [v484 countByEnumeratingWithState:&v560 objects:v644 count:16];
    if (v329)
    {
      uint64_t v330 = v329;
      uint64_t v331 = *(void *)v561;
LABEL_536:
      uint64_t v332 = 0;
      while (1)
      {
        if (*(void *)v561 != v331) {
          objc_enumerationMutation(v484);
        }
        uint64_t v333 = [(BWStillImageConditionalRouterUBConfiguration *)obje outputIndexForPortType:*(void *)(*((void *)&v560 + 1) + 8 * v332)];
        if (v333 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_679;
        }
        uint64_t v334 = v333;
        if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v326, "outputs"), "objectAtIndexedSubscript:", v333), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v327, "inputs"), "objectAtIndexedSubscript:", v333), v513) & 1) == 0|| (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v327, "outputs"), "objectAtIndexedSubscript:", v334), -[NSArray objectAtIndexedSubscript:](
                  [(BWNode *)v516 inputs],
                  "objectAtIndexedSubscript:",
                  v334),
                v513) & 1) == 0)
        {
          goto LABEL_681;
        }
        if (v330 == ++v332)
        {
          uint64_t v330 = [v484 countByEnumeratingWithState:&v560 objects:v644 count:16];
          if (v330) {
            goto LABEL_536;
          }
          break;
        }
      }
    }
    v288 = [[BWStillImageCameraCalibrationDataNode alloc] initWithSensorConfigurationsByPortType:v521];
    [(BWInferenceSynchronizerNode *)v288 setPropagatesDetectedObjects:1];
    -[BWInferenceSynchronizerNode setBaseZoomFactorsByPortType:](v288, "setBaseZoomFactorsByPortType:", [v25 baseZoomFactorsByPortType]);
    [(BWNode *)v288 setName:@"Still Image Camera Calibration Data"];
    v559.receiver = (id)v487;
    v559.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v559, sel_addNode_error_, v288, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    v260 = a11;
    v290 = v513;
    v298 = v472;
    v299 = v450;
    v264 = v518;
    v300 = newValuea;
    if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", -[BWNode output](v516, "output"), -[BWNode input](v288, "input"), v513) & 1) == 0)goto LABEL_681; {
    goto LABEL_560;
    }
  }
LABEL_487:
  if (v420)
  {
    v301 = objc_alloc_init(BWStillImageDisparitySplitterNode);
    [(BWNode *)v301 setName:@"Disparity/UB Splitter"];
    v572.receiver = (id)v207;
    v572.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    uint64_t v302 = v477;
    if ((objc_msgSendSuper2(&v572, sel_addNode_error_, v301, &v636) & 1) == 0
      || (objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", v247, -[BWNode input](v301, "input"), v457) & 1) == 0)
    {
      goto LABEL_681;
    }
    uint64_t v303 = v262;
    uint64_t v247 = [(BWStillImageDisparitySplitterNode *)v301 disparityOutput];
  }
  else
  {
    uint64_t v303 = v262;
    v301 = 0;
    uint64_t v302 = v477;
  }
  v645[0] = v302;
  v645[1] = v444;
  v304 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v645 count:2];
  v305 = [[BWStillImageMultiCameraDoserNode alloc] initWithPortTypes:v304];
  v571.receiver = (id)v207;
  v571.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
  if (objc_msgSendSuper2(&v571, sel_addNode_error_, v305, &v636))
  {
    uint64_t v306 = [v304 indexOfObject:v302];
    if (v306 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_679;
    }
    uint64_t v307 = v306;
    uint64_t v308 = [v304 indexOfObject:v444];
    if (v308 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_679;
    }
    uint64_t v309 = v308;
    if ((objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", v303, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v305, "inputs"), "objectAtIndexedSubscript:", v307), v457) & 1) == 0)goto LABEL_681; {
    v310 = (void *)v487;
    }
    if ((objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", v247, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v305, "inputs"), "objectAtIndexedSubscript:", v309), v457) & 1) == 0)goto LABEL_681; {
    uint64_t v311 = [(BWStillImageMultiCameraDoserNode *)v305 outputIndexForPortType:v477];
    }
    if (v311 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_679;
    }
    uint64_t v312 = v311;
    uint64_t v313 = [(BWStillImageMultiCameraDoserNode *)v305 outputIndexForPortType:v444];
    if (v313 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_679;
    }
    uint64_t v314 = v313;
    uint64_t v315 = [(NSArray *)[(BWNode *)v305 outputs] objectAtIndexedSubscript:v312];
    uint64_t v316 = [(NSArray *)[(BWNode *)v305 outputs] objectAtIndexedSubscript:v314];
    v317 = v439;
    if (v452)
    {
      v318 = -[BWStillImageDualPhotoFacePropagatorNode initWithBaseZoomFactors:]([BWStillImageDualPhotoFacePropagatorNode alloc], "initWithBaseZoomFactors:", objc_msgSend((id)objc_msgSend(v25, "baseZoomFactorsByPortType"), "allValues"));
      v570.receiver = (id)v487;
      v570.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
      if ((objc_msgSendSuper2(&v570, sel_addNode_error_, v318, &v636) & 1) == 0
        || (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v315, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v318, "inputs"), "objectAtIndexedSubscript:", 0), v457) & 1) == 0|| (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v316, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v318, "inputs"), "objectAtIndexedSubscript:", 1), v457) & 1) == 0)
      {
        goto LABEL_681;
      }
      uint64_t v315 = [(NSArray *)[(BWNode *)v318 outputs] objectAtIndexedSubscript:0];
      uint64_t v316 = [(NSArray *)[(BWNode *)v318 outputs] objectAtIndexedSubscript:1];
      v317 = v439;
    }
    if (v420)
    {
      v319 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.inference.bravo" priority:*(unsigned int *)(v487 + 48)];
      v320 = [[BWInferenceNode alloc] initWithScheduler:a9 priority:*(unsigned int *)(v487 + 52)];
      [(BWNode *)v320 setName:@"Disparity"];
      if ((v494 & 1) == 0
        && -[FigCapturePhotonicEngineSinkPipeline _addLandmarksInferenceToNode:](v487, v320))
      {
        goto LABEL_679;
      }
      if (v445)
      {
        v321 = [(BWNode *)v320 name];
        if ([(NSString *)v321 length]) {
          [(NSString *)v321 stringByAppendingFormat:@" + %@", @"Person Semantics"];
        }
        [(BWInferenceNode *)v320 addInferenceOfType:104 version:(unsigned __int16)Major | ((unint64_t)v427 << 16) configuration:v317];
        v310 = (void *)v487;
      }
      v569.receiver = v310;
      v569.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
      if ((objc_msgSendSuper2(&v569, sel_addNode_error_, v320, &v636) & 1) == 0
        || (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", -[BWStillImageDisparitySplitterNode processedOutput](v301, "processedOutput"), -[BWNode input](v320, "input"), v319) & 1) == 0)
      {
        goto LABEL_681;
      }
      char v494 = 1;
    }
    else
    {
      v320 = 0;
    }
    uint64_t v322 = [v25 depthDataDimensions];
    if ([v25 clientIsCameraOrDerivative]) {
      uint64_t v323 = 0;
    }
    else {
      uint64_t v323 = 8;
    }
    v324 = [[BWStillImageBravoDisparityNode alloc] initWithNodeConfiguration:v480 sensorConfigurationsByPortType:v521 disparityMapWidth:(int)v322 disparityMapHeight:v322 >> 32 outputDisparityBufferCount:v323];
    v568.receiver = v310;
    v568.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v568, sel_addNode_error_, v324, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    v310[10] = v324;
    [(BWStillImageBravoDisparityNode *)v324 setShouldComputeDisparityWhenCalibrationFails:v469];
    v290 = v513;
    if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v315, -[BWStillImageBravoDisparityNode wideInput](v324, "wideInput"), v457) & 1) == 0|| (objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v316, -[BWStillImageBravoDisparityNode telephotoInput](v324, "telephotoInput"), v457) & 1) == 0)
    {
      goto LABEL_681;
    }
    v260 = a11;
    uint64_t v262 = [(BWNode *)v324 output];
    v264 = v518;
    if (!v420)
    {
      uint64_t v207 = v487;
      v298 = v472;
      v299 = v450;
      v300 = newValuea;
LABEL_561:
      unsigned int v265 = v462;
LABEL_562:
      int v341 = v470;
      if (v265 == 6) {
        int v341 = 1;
      }
      if ((v486 & v341) == 1)
      {
        LOBYTE(v412) = 0;
        v342 = -[BWDepthConverterNode initWithStillImageNodeConfiguration:cameraInfoByPortType:sensorIDDictionary:rgbPersonSegmentationEnabled:depthIsAlwaysHighQuality:depthOriginatesFromNeuralNetwork:backPressureDrivenPipelining:]([BWDepthConverterNode alloc], "initWithStillImageNodeConfiguration:cameraInfoByPortType:sensorIDDictionary:rgbPersonSegmentationEnabled:depthIsAlwaysHighQuality:depthOriginatesFromNeuralNetwork:backPressureDrivenPipelining:", v480, v514, [v473 sensorIDDictionary], v489, objc_msgSend(v25, "clientIsCameraOrDerivative"), v265 == 6, v412);
        v558.receiver = (id)v207;
        v558.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
        if ((objc_msgSendSuper2(&v558, sel_addNode_error_, v342, &v636) & 1) == 0) {
          goto LABEL_681;
        }
        [(BWNode *)v342 setName:@"Still Image Depth Converter"];
        -[BWDepthConverterNode setHorizontalSensorBinningFactor:](v342, "setHorizontalSensorBinningFactor:", [v25 horizontalSensorBinningFactor]);
        -[BWDepthConverterNode setVerticalSensorBinningFactor:](v342, "setVerticalSensorBinningFactor:", [v25 verticalSensorBinningFactor]);
        [(BWDepthConverterNode *)v342 setStillGDRFilteringSupportEnabled:1];
        [(BWDepthConverterNode *)v342 setOutputFormat:1751411059];
        -[BWDepthConverterNode setOutputDimensions:](v342, "setOutputDimensions:", [v25 depthDataDimensions]);
        [(BWDepthConverterNode *)v342 setBaseRotationDegrees:90];
        v290 = v513;
        v264 = v518;
        if ((objc_msgSend(v260, "connectOutput:toInput:pipelineStage:", v262, -[BWNode input](v342, "input"), v513) & 1) == 0) {
          goto LABEL_681;
        }
        *(void *)(v207 + 88) = v342;
        uint64_t v262 = [(BWNode *)v342 output];
      }
      goto LABEL_568;
    }
    v288 = [[BWInferenceSynchronizerNode alloc] initWithIndexOfInputProvidingOutputSampleBuffer:1 indexOfInputProvidingPreferredInferences:1 errorHandlingModel:0];
    [(BWNode *)v288 setName:@"Disparity/Landmarks Sync"];
    [(BWInferenceSynchronizerNode *)v288 setSynchronizesTopLevelAttachments:1];
    v567.receiver = (id)v487;
    v567.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v567, sel_addNode_error_, v288, &v636) & 1) == 0) {
      goto LABEL_681;
    }
    if ((objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", v262, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v288, "inputs"), "objectAtIndexedSubscript:", 0), v457) & 1) == 0)goto LABEL_681; {
    char v325 = objc_msgSend(a11, "connectOutput:toInput:pipelineStage:", -[BWNode output](v320, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v288, "inputs"), "objectAtIndexedSubscript:", 1), v457);
    }
    v298 = v472;
    v299 = v450;
    v300 = newValuea;
    if ((v325 & 1) == 0) {
      goto LABEL_681;
    }
LABEL_560:
    uint64_t v262 = [(BWNode *)v288 output];
    uint64_t v207 = v487;
    goto LABEL_561;
  }
LABEL_681:
  FigDebugAssert3();
LABEL_682:
  uint64_t result = v637;
  if (!v637)
  {
    if (v636) {
      return [v636 code];
    }
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
  [(FigCaptureSinkPipeline *)&v3 dealloc];
}

+ (NSString)pipelineBaseName
{
  return (NSString *)@"UB Still Image Sink Pipeline";
}

- (BWStillImageCoordinatorNode)stillImageCoordinatorNode
{
  return self->_stillImageCoordinatorNode;
}

- (BWCompressedShotBufferNode)compressedShotBufferNode
{
  return self->_compressedShotBufferNode;
}

- (BWStillImageSampleBufferSinkNode)stillImageSinkNode
{
  return self->_stillImageSinkNode;
}

- (BWPortraitHDRStagingNode)portraitHDRStagingNode
{
  return self->_portraitHDRStagingNode;
}

- (uint64_t)_buildRedEyeReductionSubPipelineWithName:(uint64_t)a3 pipelineStage:(void *)a4 graph:(uint64_t)a5 sensorConfigurationsByPortType:(uint64_t)a6 inferenceScheduler:(uint64_t *)a7 subPipelineInputOut:(uint64_t *)a8 subPipelineOutputOut:
{
  if (result)
  {
    uint64_t v11 = (unsigned int *)result;
    uint64_t v30 = 0;
    id v12 = +[BWLandmarksInferenceConfiguration configuration];
    [v12 setDetectLandmarksInFullSizeInput:1];
    id v13 = +[BWStillImageConditionalRouterLandmarksConfiguration landmarksConfiguration];
    v14 = [[BWStillImageConditionalRouterNode alloc] initWithRoutingConfiguration:v13];
    -[BWNode setName:](v14, "setName:", [NSString stringWithFormat:@"%@ Landmarks Input Routing Node", a2]);
    v29.receiver = v11;
    v29.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v29, sel_addNode_error_, v14, &v30) & 1) == 0) {
      goto LABEL_14;
    }
    uint64_t v15 = [[BWInferenceNode alloc] initWithScheduler:a6 priority:v11[13]];
    uint64_t v23 = a2;
    -[BWNode setName:](v15, "setName:", [NSString stringWithFormat:@"%@ Landmarks Node", a2]);
    -[BWInferenceNode addInferenceOfType:version:configuration:](v15, "addInferenceOfType:version:configuration:", 801, [v12 landmarksInferenceVersion] & 0xFFFFFFFFFFFFLL, v12);
    v28.receiver = v11;
    v28.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v28, sel_addNode_error_, v15, &v30) & 1) == 0) {
      goto LABEL_14;
    }
    v16 = [[BWFunnelNode alloc] initWithNumberOfInputs:2 mediaType:1986618469 holdMessages:1];
    v27.receiver = v11;
    v27.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v27, sel_addNode_error_, v16, &v30) & 1) == 0) {
      goto LABEL_14;
    }
    uint64_t v17 = [(BWNode *)v14 input];
    if ((objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v14, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v13, "defaultOutputIndex")), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v16, "inputs"), "objectAtIndexedSubscript:", 0), a3) & 1) == 0)goto LABEL_14; {
    if ((objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v14, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v13, "landmarksOutputIndex")), -[BWNode input](v15, "input"), a3) & 1) != 0&& (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", -[BWNode output](v15, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v16, "inputs"), "objectAtIndexedSubscript:", 1), a3) & 1) != 0&& (uint64_t v18 = -[BWNode output](v16, "output"), v19 = objc_autorelease(-[BWRedEyeReducerNode initWithVersion:sensorConfigurationsByPortType:]([BWRedEyeReducerNode alloc], "initWithVersion:sensorConfigurationsByPortType:",
    }
                    1,
                    a5)),
          -[BWNode setName:](v19, "setName:", [NSString stringWithFormat:@"%@ Red Eye Reducer", v23]), -[BWRedEyeReducerNode setInferenceType:](v19, "setInferenceType:", 801), -[BWRedEyeReducerNode setInferenceAttachmentKey:](v19, "setInferenceAttachmentKey:", 0x1EFA6A0A0), v26.receiver = v11, v26.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline, (objc_msgSendSuper2(&v26, sel_addNode_error_, v19, &v30) & 1) != 0)&& (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v18, -[BWNode input](v19, "input"), a3) & 1) != 0)
    {
      uint64_t v20 = [(BWNode *)v19 output];
      uint64_t result = 4294954516;
      if (v17)
      {
        if (v20)
        {
          uint64_t result = 0;
          *a7 = v17;
          *a8 = v20;
        }
      }
    }
    else
    {
LABEL_14:
      FigDebugAssert3();
      return 4294954516;
    }
  }
  return result;
}

- (uint64_t)_addMattingInferenceToNode:(unsigned int)a3 mattingVersion:(uint64_t)a4 refinedDepthEnabled:(unsigned int)a5 mainImageDownscalingFactor:(uint64_t)a6 enabledSemantics:(void *)a7 metalCommandQueue:(char)a8 mattingsensorConfigurationsByPortType:(float)a9 clientIsCameraOrDerivative:(float)a10 requiredAdditionalInferenceOutputBuffers:(unsigned int)a11 zoomFactorForPortrait:
{
  if (!a1) {
    return 0;
  }
  uint64_t v20 = (void *)[a2 name];
  uint64_t v21 = [v20 length];
  objc_super v22 = @"Matting";
  uint64_t v46 = a6;
  if (v21) {
    objc_super v22 = (__CFString *)[v20 stringByAppendingFormat:@" + %@", @"Matting"];
  }
  [a2 setName:v22];
  uint64_t v23 = objc_msgSend((id)objc_msgSend(a7, "allKeys"), "firstObject");
  uint64_t v24 = objc_msgSend((id)objc_msgSend(a7, "objectForKeyedSubscript:", v23), "sensorIDDictionary");
  v25 = +[FigCaptureCameraParameters sharedInstance];
  uint64_t v26 = objc_msgSend((id)objc_msgSend(a7, "objectForKeyedSubscript:", v23), "sensorIDString");
  *(float *)&double v27 = a10;
  if ([(FigCaptureCameraParameters *)v25 sdofRenderingVersionForPortType:v23 sensorIDString:v26 zoomFactor:v27])
  {
    *(float *)&double v28 = a10;
    id v29 = +[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:v24 zoomFactor:v28];
  }
  else
  {
    id v29 = 0;
  }
  if (a3 == 1)
  {
    uint64_t v30 = [(BWInferenceConfiguration *)[BWMattingInferenceConfiguration alloc] initWithInferenceType:201];
    [(BWInferenceConfiguration *)v30 setPriority:*(unsigned int *)(a1 + 52)];
    [(BWInferenceConfiguration *)v30 setTuningParameters:v24];
    [(BWMattingInferenceConfiguration *)v30 setSdofRenderingTuningParameters:v29];
    *(float *)&double v31 = a9;
    [(BWMattingInferenceConfiguration *)v30 setMainImageDownscalingFactor:v31];
    [(BWMattingInferenceConfiguration *)v30 setRefinedDepthDeliveryEnabled:a4];
    [(BWMattingInferenceConfiguration *)v30 setMetalCommandQueue:a6];
    uint64_t v32 = [a2 addInferenceOfType:201 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:v30];
LABEL_27:
    if ((a8 & 1) == 0) {
      [a2 setAwaitAsynchronousOutputs:1];
    }
    if (a11) {
      [a2 setAdditionalOutputPoolRetainedBufferCount:a11];
    }
    return v32;
  }
  char v45 = a8;
  if ([(FigCaptureCameraParameters *)v25 learnedMattingVersion] < 1) {
    int v33 = 1;
  }
  else {
    int v33 = a4;
  }
  int v34 = a4 | 2;
  if (!v33) {
    int v34 = a4;
  }
  if ((a5 & 1) == 0) {
    int v34 = a4;
  }
  uint64_t v35 = a5 & 0x78 | (4 * ((a5 >> 1) & 1)) | v34;
  if (!v35) {
    goto LABEL_18;
  }
  uint64_t v36 = [(BWInferenceConfiguration *)[BWMattingV2InferenceConfiguration alloc] initWithInferenceType:201];
  [(BWMattingV2InferenceConfiguration *)v36 setSensorConfigurationsByPortType:a7];
  [(BWMattingV2InferenceConfiguration *)v36 setEnabledMattes:v35];
  [(BWMattingV2InferenceConfiguration *)v36 setTuningConfiguration:2];
  [(BWInferenceConfiguration *)v36 setPriority:*(unsigned int *)(a1 + 52)];
  [(BWMattingV2InferenceConfiguration *)v36 setSdofRenderingTuningParameters:v29];
  *(float *)&double v37 = a9;
  [(BWMattingV2InferenceConfiguration *)v36 setMainImageDownscalingFactor:v37];
  [(BWMattingV2InferenceConfiguration *)v36 setDepthDataDeliveryEnabled:a4];
  [(BWMattingV2InferenceConfiguration *)v36 setMetalCommandQueue:v46];
  uint64_t v32 = [a2 addInferenceOfType:201 version:BWInferenceVersionMakeMajor(a3) & 0xFFFFFFFFFFFFLL configuration:v36];
  if (!v32)
  {
LABEL_18:
    if (a5) {
      char v38 = v33;
    }
    else {
      char v38 = 1;
    }
    if (v38)
    {
      uint64_t v32 = 0;
LABEL_26:
      a8 = v45;
      goto LABEL_27;
    }
    v39 = (void *)[a2 name];
    uint64_t v40 = [v39 length];
    v41 = @"Learned Matting";
    if (v40) {
      v41 = (__CFString *)[v39 stringByAppendingFormat:@" + %@", @"Learned Matting"];
    }
    [a2 setName:v41];
    uint64_t v42 = [(BWInferenceConfiguration *)[BWLearnedMattingInferenceConfiguration alloc] initWithInferenceType:107];
    [(BWTiledEspressoInferenceConfiguration *)v42 setMetalCommandQueue:0];
    *(float *)&double v43 = a9;
    [(BWLearnedMattingInferenceConfiguration *)v42 setMainImageDownscalingFactor:v43];
    uint64_t v32 = objc_msgSend(a2, "addInferenceOfType:version:configuration:", 107, BWInferenceVersionMakeMajor(-[FigCaptureCameraParameters learnedMattingVersion](v25, "learnedMattingVersion")) & 0xFFFFFFFFFFFFLL, v42);
    if (!v32) {
      goto LABEL_26;
    }
  }
  return v32;
}

- (uint64_t)_buildScaleAndEncodeSubPipelineWithPipelineStage:(uint64_t)result graph:(uint64_t)a2 nodeConfiguration:(void *)a3 stillImageSinkPipelineWithConfiguration:(uint64_t)a4 sensorConfigurationsByPortType:(void *)a5 supportsScaling:(uint64_t)a6 provideMeteorHeadroom:(int)a7 providePostEncodeInferences:(int)a8 semanticDevelopmentVersion:(char)a9 constituentPhotoDeliveryEnabled:(unsigned int)a10 demosaicedRawEnabled:(unsigned __int8)a11 nonPropagatedMainImageDownscalingFactorByAttachedMediaKey:(void *)a12 propagatedMainImageDownscalingFactorByAttachedMediaKey:(void *)a13 inferenceScheduler:(uint64_t)a14 subPipelineInputOut:(uint64_t *)a15 subPipelineOutputOut:(uint64_t *)a16 cameraSupportsFlash:(unsigned __int8)a17 cinematicFramingStatesProvider:(void *)a18
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  uint64_t v56 = (void *)result;
  if (!result) {
    return result;
  }
  uint64_t v70 = 0;
  if (!a15 || !a16) {
    return FigSignalErrorAt();
  }
  [a5 sinkConfiguration];
  objc_opt_class();
  uint64_t v54 = a2;
  if (objc_opt_isKindOfClass()) {
    objc_super v22 = (void *)[a5 sinkConfiguration];
  }
  else {
    objc_super v22 = 0;
  }
  if ([a5 cinematicFramingWarpingRequired])
  {
    uint64_t v23 = [BWCinematicFramingWarpingNode alloc];
    uint64_t v24 = [a5 cinematicFramingWarpingOutputDimensions];
    [a5 maxLossyCompressionLevel];
    v25 = -[BWCinematicFramingWarpingNode initWithFramingStatesProvider:outputDimensions:maxLossyCompressionLevel:](v23, a18, v24);
    [v25 setName:@"CinematicFramingWarper"];
    v69.receiver = v56;
    v69.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if (!objc_msgSendSuper2(&v69, (SEL)&selRef_binned + 5, v25, &v70)) {
      goto LABEL_59;
    }
    uint64_t v26 = [v25 input];
    uint64_t v57 = [v25 output];
  }
  else
  {
    uint64_t v57 = 0;
    uint64_t v26 = 0;
  }
  if (a7)
  {
    uint64_t v27 = v26;
    double v28 = [[BWStillImageScalerNode alloc] initWithBasePoolCapacity:1 nodeConfiguration:a4];
    [(BWNode *)v28 setName:@"Scaler"];
    [(BWStillImageScalerNode *)v28 setBlackFillingRequired:a11];
    id v29 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    [v29 addEntriesFromDictionary:a12];
    [v29 addEntriesFromDictionary:a13];
    [(BWStillImageScalerNode *)v28 setMainImageDownscalingFactorByAttachedMediaKey:v29];
    v68.receiver = v56;
    v68.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
    if ((objc_msgSendSuper2(&v68, sel_addNode_error_, v28, &v70) & 1) == 0) {
      goto LABEL_59;
    }
    if (v57
      && (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", v57, -[BWNode input](v28, "input"), v54) & 1) == 0)
    {
      goto LABEL_60;
    }
    uint64_t v26 = v27;
    if (!v27) {
      uint64_t v26 = [(BWNode *)v28 input];
    }
    uint64_t v57 = [(BWNode *)v28 output];
  }
  if (!a8)
  {
    uint64_t v51 = v26;
    goto LABEL_26;
  }
  uint64_t v30 = [[BWMeteorHeadroomNode alloc] initWithNodeConfiguration:a4 sensorConfigurationsByPortType:a6];
  [(BWNode *)v30 setName:@"Meteor Headroom"];
  [(BWMeteorHeadroomNode *)v30 setHeadroomProcessingType:[+[FigCaptureCameraParameters sharedInstance] meteorHeadroomProcessingType]];
  [a5 gainMapMainImageDownscalingFactor];
  -[BWMeteorHeadroomNode setGainMapMainImageDownscalingFactor:](v30, "setGainMapMainImageDownscalingFactor:");
  v67.receiver = v56;
  v67.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
  if ((objc_msgSendSuper2(&v67, sel_addNode_error_, v30, &v70) & 1) == 0)
  {
LABEL_59:
    FigDebugAssert3();
    return 4294954510;
  }
  if (v57
    && (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", v57, -[BWNode input](v30, "input"), v54) & 1) == 0)
  {
    goto LABEL_60;
  }
  if (!v26) {
    uint64_t v26 = [(BWNode *)v30 input];
  }
  uint64_t v51 = v26;
  uint64_t v57 = [(BWNode *)v30 output];
LABEL_26:
  if ([v22 previewQualityAdjustedPhotoFilterRenderingEnabled]) {
    uint64_t v32 = 2;
  }
  else {
    uint64_t v32 = 0;
  }
  int v33 = [BWPhotoEncoderNode alloc];
  if (!a9) {
    a14 = 0;
  }
  LOBYTE(v50) = [a5 stillImageSinkPipelineProcessingMode] == 1;
  int v34 = [(BWPhotoEncoderNode *)v33 initWithNodeConfiguration:a4 sensorConfigurationsByPortType:a6 semanticDevelopmentVersion:a10 inferenceScheduler:a14 alwaysAwaitInference:(int)a10 > 0 portraitRenderQuality:v32 deferredPhotoProcessorEnabled:v50];
  [(BWNode *)v34 setName:@"Encoder"];
  [(BWPhotoEncoderNode *)v34 setCameraSupportsFlash:a17];
  -[BWPhotoEncoderNode setUsesHighEncodingPriority:](v34, "setUsesHighEncodingPriority:", [a5 usesHighEncodingPriority]);
  uint64_t v35 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v36 = [a12 countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v64 != v38) {
          objc_enumerationMutation(a12);
        }
        uint64_t v40 = *(void *)(*((void *)&v63 + 1) + 8 * i);
        v41 = [BWPhotoEncoderNodeAttachedMediaConfiguration alloc];
        objc_msgSend((id)objc_msgSend(a12, "objectForKeyedSubscript:", v40), "floatValue");
        objc_msgSend(v35, "setObject:forKeyedSubscript:", -[BWPhotoEncoderNodeAttachedMediaConfiguration initWithMainImageDownscalingFactor:propagationMode:](v41, "initWithMainImageDownscalingFactor:propagationMode:", 1), v40);
      }
      uint64_t v37 = [a12 countByEnumeratingWithState:&v63 objects:v72 count:16];
    }
    while (v37);
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v42 = [a13 countByEnumeratingWithState:&v59 objects:v71 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v60 != v44) {
          objc_enumerationMutation(a13);
        }
        uint64_t v46 = *(void *)(*((void *)&v59 + 1) + 8 * j);
        uint64_t v47 = [BWPhotoEncoderNodeAttachedMediaConfiguration alloc];
        objc_msgSend((id)objc_msgSend(a13, "objectForKeyedSubscript:", v46), "floatValue");
        objc_msgSend(v35, "setObject:forKeyedSubscript:", -[BWPhotoEncoderNodeAttachedMediaConfiguration initWithMainImageDownscalingFactor:propagationMode:](v47, "initWithMainImageDownscalingFactor:propagationMode:", 0), v46);
      }
      uint64_t v43 = [a13 countByEnumeratingWithState:&v59 objects:v71 count:16];
    }
    while (v43);
  }
  if ([v35 count]) {
    [(BWPhotoEncoderNode *)v34 setAttachedMediaConfigurationByAttachedMediaKey:v35];
  }
  v58.receiver = v56;
  v58.super_class = (Class)FigCaptureStillImageUnifiedBracketingSinkPipeline;
  uint64_t v48 = v51;
  if ((objc_msgSendSuper2(&v58, sel_addNode_error_, v34, &v70) & 1) == 0) {
    goto LABEL_59;
  }
  if (v57
    && (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", v57, -[BWNode input](v34, "input"), v54) & 1) == 0)
  {
LABEL_60:
    FigDebugAssert3();
    return 4294954516;
  }
  if (!v51) {
    uint64_t v48 = [(BWNode *)v34 input];
  }
  uint64_t v49 = [(BWNode *)v34 output];
  uint64_t result = 4294954516;
  if (v48)
  {
    if (v49)
    {
      uint64_t result = 0;
      *a15 = v48;
      *a16 = v49;
    }
  }
  return result;
}

@end