@interface FigCaptureCinematographyPipeline
+ (void)initialize;
- (double)simulatedAperture;
- (uint64_t)_buildCinematographyPipeline:(uint64_t)a3 videoSourceCaptureOutput:(uint64_t)a4 sourceSemanticMasksOutput:(uint64_t)a5 previewOutput:(uint64_t)a6 auxiliaryOutput:(void *)a7 sourceID:(void *)a8 graph:(void *)a9 captureDevice:(uint64_t)a10 inferenceScheduler:;
- (uint64_t)cinematicVideoFocusDetectionsProvider;
- (uint64_t)depthOutputDimensions;
- (uint64_t)detectedObjectsOutput;
- (uint64_t)getSmartStyle;
- (uint64_t)globalMetadata;
- (uint64_t)previewOutput;
- (uint64_t)semanticStyleSceneObserver;
- (uint64_t)setSimulatedAperture:(uint64_t)result;
- (uint64_t)setSmartStyle:(uint64_t)result;
- (uint64_t)sourceID;
- (uint64_t)videoCaptureOutput;
- (void)dealloc;
- (void)initWithConfiguration:(uint64_t)a3 videoSourceCaptureOutput:(uint64_t)a4 sourceSemanticMasksOutput:(uint64_t)a5 previewOutput:(uint64_t)a6 auxiliaryOutput:(void *)a7 graph:(uint64_t)a8 name:(void *)a9 sourceID:(void *)a10 captureDevice:(uint64_t)a11 inferenceScheduler:(_DWORD *)a12 errorOut:;
@end

@implementation FigCaptureCinematographyPipeline

- (uint64_t)setSmartStyle:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 56) setSmartStyle:a2];
  }
  return result;
}

- (uint64_t)cinematicVideoFocusDetectionsProvider
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

+ (void)initialize
{
}

- (void)initWithConfiguration:(uint64_t)a3 videoSourceCaptureOutput:(uint64_t)a4 sourceSemanticMasksOutput:(uint64_t)a5 previewOutput:(uint64_t)a6 auxiliaryOutput:(void *)a7 graph:(uint64_t)a8 name:(void *)a9 sourceID:(void *)a10 captureDevice:(uint64_t)a11 inferenceScheduler:(_DWORD *)a12 errorOut:
{
  if (!a1) {
    return 0;
  }
  v23.receiver = a1;
  v23.super_class = (Class)FigCaptureCinematographyPipeline;
  id v18 = objc_msgSendSuper2(&v23, sel_initWithGraph_name_, a7, a8);
  v19 = v18;
  if (v18)
  {
    int v20 = -[FigCaptureCinematographyPipeline _buildCinematographyPipeline:videoSourceCaptureOutput:sourceSemanticMasksOutput:previewOutput:auxiliaryOutput:sourceID:graph:captureDevice:inferenceScheduler:]((uint64_t)v18, a2, a3, a4, a5, a6, a9, a7, a10, a11);
    if (v20)
    {
      int v22 = v20;
      fig_log_get_emitter();
      FigDebugAssert3();
      if (a12) {
        *a12 = v22;
      }

      return 0;
    }
  }
  return v19;
}

- (uint64_t)_buildCinematographyPipeline:(uint64_t)a3 videoSourceCaptureOutput:(uint64_t)a4 sourceSemanticMasksOutput:(uint64_t)a5 previewOutput:(uint64_t)a6 auxiliaryOutput:(void *)a7 sourceID:(void *)a8 graph:(void *)a9 captureDevice:(uint64_t)a10 inferenceScheduler:
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v15 = result;
  unsigned int v74 = 0;
  id v73 = 0;
  if (a5) {
    uint64_t v16 = a5;
  }
  else {
    uint64_t v16 = a3;
  }
  v17 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.cinematic_video.color_inferences" priority:14];
  v54 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.cinematic_video.depth" priority:14];
  uint64_t v66 = a2;
  v67 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.cinematic_video.cinematography" priority:14];
  uint64_t v63 = a5;
  v64 = a7;
  if (a2 && *(_DWORD *)(a2 + 44) == 3)
  {
    v56 = v17;
    id v18 = objc_alloc_init(FigVideoCaptureConnectionConfiguration);
    -[FigCaptureConnectionConfiguration setSourceConfiguration:](v18, "setSourceConfiguration:", [*(id *)(a2 + 16) sourceConfiguration]);
    [(FigVideoCaptureConnectionConfiguration *)v18 setVideoStabilizationMethod:3];
    v19 = objc_autorelease(-[FigCaptureVISPipeline initWithUpstreamOutput:graph:name:parentPipeline:videoCaptureConnectionConfiguration:pipelineStage:sdofPipelineStage:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:captureDevice:outputDimensions:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:visProcessingSemaphore:]([FigCaptureVISPipeline alloc], v16, a8, 0.0, @"FSDNet REF RSC", (void *)v15, v18, 0, 0, 2u, 2u, 1, 0, 0, 0, 0, 5, 0x50u,
              a9,
              0,
              0,
              0,
              0,
              3u,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0,
              0));
    if (!v19
      || (uint64_t v20 = [(id)-[FigCaptureVISPipeline visNode]((uint64_t)v19) output],
          (v21 = objc_autorelease(-[FigCaptureVISPipeline initWithUpstreamOutput:graph:name:parentPipeline:videoCaptureConnectionConfiguration:pipelineStage:sdofPipelineStage:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:captureDevice:outputDimensions:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:visProcessingSemaphore:]([FigCaptureVISPipeline alloc], a6, a8, 0.0, @"FSDNet AUX RSC", (void *)v15, v18, 0, 0, 2u, 2u, 1, 0, 0, 0, 0, 5, 0x50u,
                     a9,
                     0,
                     0,
                     0,
                     0,
                     3u,
                     0,
                     0,
                     0,
                     0,
                     0,
                     0,
                     0,
                     0,
                     0))) == 0))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_73;
    }
    uint64_t v22 = [(id)-[FigCaptureVISPipeline visNode]((uint64_t)v21) output];
    if (*(unsigned char *)(a2 + 40)) {
      objc_super v23 = &unk_1EFB04928;
    }
    else {
      objc_super v23 = 0;
    }
    if (*(unsigned char *)(a2 + 41)) {
      v24 = &unk_1EFB04940;
    }
    else {
      v24 = 0;
    }
    BYTE12(v52) = 0;
    *(void *)((char *)&v52 + 4) = 1;
    LOBYTE(v52) = 1;
    v25 = -[BWSlaveFrameSynchronizerNode initWithDepthEnabled:numberOfInputs:syncSlaveForMasterPortTypes:separateDepthComponentsEnabled:preLTMThumbnailEnabledInputs:postColorProcessingThumbnailEnabledInputs:differentInputFormatsSupported:bufferSize:numberOfSlaveFramesToSkip:startEmittingMasterFramesBeforeSlaveStreamStarts:]([BWSlaveFrameSynchronizerNode alloc], "initWithDepthEnabled:numberOfInputs:syncSlaveForMasterPortTypes:separateDepthComponentsEnabled:preLTMThumbnailEnabledInputs:postColorProcessingThumbnailEnabledInputs:differentInputFormatsSupported:bufferSize:numberOfSlaveFramesToSkip:startEmittingMasterFramesBeforeSlaveStreamStarts:", 0, 2, 0, 0, v23, v24, v52);
    [(BWNode *)v25 setName:@"REF/AUX sync node"];
    if (([(id)v15 addNode:v25 error:&v73] & 1) == 0
      || (objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", v20, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v25, "inputs"), "objectAtIndexedSubscript:", 1), 0) & 1) == 0|| (objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", v22, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v25, "inputs"), "objectAtIndexedSubscript:", 0), 0) & 1) == 0)
    {
      fig_log_get_emitter();
LABEL_79:
      FigDebugAssert3();
      goto LABEL_63;
    }
    uint64_t v16 = [(BWNode *)v25 output];
    uint64_t v60 = v22;
    if (*(unsigned char *)(a2 + 24))
    {
      v26 = [[BWSmartStyleLearningNode alloc] initWithOutputs:1 masksRefinerEnabled:0 propagateMasks:0];
      v17 = v56;
      if (!v26) {
        goto LABEL_63;
      }
      v27 = v26;
      [(BWNode *)v26 setName:@"Cinematic SmartStyle Learning"];
      [(BWSmartStyleLearningNode *)v27 setDisableWaitForCoefficientsOnFirstFrame:0];
      [(BWSmartStyleLearningNode *)v27 setSubjectRelightingEnabled:0];
      -[BWSmartStyleLearningNode setCameraInfoByPortType:](v27, "setCameraInfoByPortType:", [a9 cameraInfoByPortType]);
      [(BWSmartStyleLearningNode *)v27 setSmartStyle:*(void *)(a2 + 32)];
      v72.receiver = (id)v15;
      v72.super_class = (Class)FigCaptureCinematographyPipeline;
      if ((objc_msgSendSuper2(&v72, sel_addNode_error_, v27, &v73) & 1) == 0
        || (objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", v16, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v27, "inputs"), "objectAtIndexedSubscript:", 0), 0) & 1) == 0|| a4&& (objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", a4, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v27, "inputs"), "objectAtIndexedSubscript:", 1), 0) & 1) == 0)
      {
        goto LABEL_78;
      }
      uint64_t v16 = [(BWNode *)v27 output];
      *(void *)(v15 + 56) = v27;
      uint64_t v28 = 1;
    }
    else
    {
      uint64_t v28 = 1;
      v17 = v56;
    }
  }
  else
  {
    uint64_t v60 = a6;
    uint64_t v28 = 0;
  }
  *(void *)(v15 + 64) = v64;
  *(void *)(v15 + 40) = [[BWCinematicPerceptionNode alloc] initWithConvEngineSupportWithCaptureDevice:a9 scheduler:a10 priority:6 depthInferenceEnabled:v28];
  [*(id *)(v15 + 40) setName:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@", objc_msgSend((id)v15, "name"), @"FusionTracker"];
  if (([(id)v15 addNode:*(void *)(v15 + 40) error:&v73] & 1) == 0)
  {
LABEL_78:
    fig_log_get_emitter();
    goto LABEL_79;
  }
  if ((objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", v16, objc_msgSend(*(id *)(v15 + 40), "input"), v17) & 1) == 0)
  {
    fig_log_get_emitter();
LABEL_71:
    FigDebugAssert3();
LABEL_73:
    unsigned int v74 = FigSignalErrorAt();
    goto LABEL_63;
  }
  uint64_t v29 = [*(id *)(v15 + 40) output];
  uint64_t v30 = v29;
  v62 = (id *)v15;
  if ((v28 & 1) == 0)
  {
    id v31 = [[BWDepthSynchronizerNode alloc] initForStreaming:1 separateDepthComponentsEnabled:0];
    [v31 setName:@"Cinematography Depth Synchronizer"];
    [v31 setFlushOnDepthEOD:1];
    if (([(id)v15 addNode:v31 error:&v73] & 1) != 0
      && (objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", v30, objc_msgSend(v31, "imageInput"), 0) & 1) != 0
      && (objc_msgSend(a8, "connectOutput:toInput:pipelineStage:", v60, objc_msgSend(v31, "depthInput"), 0) & 1) != 0)
    {
      uint64_t v57 = [v31 output];
      goto LABEL_35;
    }
    goto LABEL_78;
  }
  uint64_t v57 = v29;
LABEL_35:
  char v61 = v28;
  v65 = a8;
  v59 = +[FigCaptureCameraParameters sharedInstance];
  v32 = (void *)*MEMORY[0x1E4F52DD8];
  uint64_t v33 = objc_msgSend((id)objc_msgSend(a9, "captureStream"), "sensorIDString");
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  v34 = (void *)[a9 activePortTypes];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v68 objects:v75 count:16];
  uint64_t v36 = *MEMORY[0x1E4F52E00];
  v53 = v32;
  if (!v35) {
    goto LABEL_47;
  }
  uint64_t v37 = v35;
  uint64_t v38 = *(void *)v69;
  uint64_t v39 = *MEMORY[0x1E4F52DF0];
  do
  {
    for (uint64_t i = 0; i != v37; ++i)
    {
      if (*(void *)v69 != v38) {
        objc_enumerationMutation(v34);
      }
      v41 = *(void **)(*((void *)&v68 + 1) + 8 * i);
      if ([v41 isEqualToString:v39])
      {
        v42 = (void *)[a9 bravoTelephotoCaptureStream];
      }
      else
      {
        if (![v41 isEqualToString:v36]) {
          continue;
        }
        v42 = (void *)[a9 pearlInfraredCaptureStream];
      }
      uint64_t v33 = [v42 sensorIDString];
      v32 = v41;
    }
    uint64_t v37 = [v34 countByEnumeratingWithState:&v68 objects:v75 count:16];
  }
  while (v37);
LABEL_47:
  char v43 = [v32 isEqualToString:v36];
  LODWORD(v44) = 1.0;
  if ((v43 & 1) == 0) {
    objc_msgSend(a9, "requestedZoomFactorRelativeToPortType:", v53, v44);
  }
  uint64_t v45 = [(FigCaptureCameraParameters *)v59 portraitSceneMonitoringParametersForPortType:v32 sensorIDString:v33 zoomFactorRelativeToWidePortType:v44];
  uint64_t v46 = [v62[5] videoDepthConfiguration];
  v47 = [BWRealtimeCinematographyNode alloc];
  if (v66)
  {
    uint64_t v49 = *(void *)(v66 + 8);
    v48 = *(void **)(v66 + 16);
  }
  else
  {
    uint64_t v49 = 0;
    v48 = 0;
  }
  objc_msgSend((id)objc_msgSend(v48, "videoPreviewSinkConfiguration"), "simulatedAperture");
  if (v66) {
    BOOL v50 = *(unsigned char *)(v66 + 24) != 0;
  }
  else {
    BOOL v50 = 0;
  }
  v62[6] = -[BWRealtimeCinematographyNode initWithObjectMetadataIdentifiers:cachedSimulatedAperture:captureDevice:tuningParameters:videoDepthConfiguration:smartStyleLearningEnabled:captureInputEnabled:](v47, "initWithObjectMetadataIdentifiers:cachedSimulatedAperture:captureDevice:tuningParameters:videoDepthConfiguration:smartStyleLearningEnabled:captureInputEnabled:", v49, a9, v45, v46, v50, v63 != 0);
  [v62[6] setName:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@", objc_msgSend(v62, "name"), @"Cinematography"];
  if (([v62 addNode:v62[6] error:&v73] & 1) == 0)
  {
LABEL_77:
    fig_log_get_emitter();
    goto LABEL_79;
  }
  if ((v61 & 1) == 0)
  {
    v62[4] = [[BWVideoDepthNode alloc] initWithInferenceScheduler:a10 captureDevice:a9 videoDepthConfiguration:v46 extraDepthOutputRetainedBufferCount:0 error:&v74];
    if (!v74)
    {
      [v62[4] setName:objc_msgSend(NSString, "stringWithFormat:", @"%@ %@", objc_msgSend(v62, "name"), @"Video Depth Node"];
      if (([v62 addNode:v62[4] error:&v73] & 1) != 0
        && (objc_msgSend(v65, "connectOutput:toInput:pipelineStage:", v57, objc_msgSend(v62[4], "input"), v54) & 1) != 0)
      {
        uint64_t v51 = [v62[4] output];
        goto LABEL_60;
      }
    }
    goto LABEL_77;
  }
  uint64_t v51 = v57;
LABEL_60:
  if ((objc_msgSend(v65, "connectOutput:toInput:pipelineStage:", v51, objc_msgSend(v62[6], "input"), v67) & 1) == 0
    || v63
    && (objc_msgSend(v65, "connectOutput:toInput:pipelineStage:", a3, objc_msgSend((id)objc_msgSend(v62[6], "inputs"), "objectAtIndexedSubscript:", 1), v67) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_71;
  }
LABEL_63:
  result = v74;
  if (!v74)
  {
    if (v73) {
      return [v73 code];
    }
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureCinematographyPipeline;
  [(FigCapturePipeline *)&v3 dealloc];
}

- (uint64_t)previewOutput
{
  if (result) {
    return [*(id *)(result + 48) previewOutput];
  }
  return result;
}

- (uint64_t)videoCaptureOutput
{
  if (result) {
    return [*(id *)(result + 48) movieFileOutput];
  }
  return result;
}

- (uint64_t)depthOutputDimensions
{
  if (result)
  {
    v1 = (void *)[*(id *)(result + 40) videoDepthConfiguration];
    return [v1 outputDimensions];
  }
  return result;
}

- (uint64_t)detectedObjectsOutput
{
  if (result) {
    return [*(id *)(result + 48) detectedObjectsOutput];
  }
  return result;
}

- (uint64_t)setSimulatedAperture:(uint64_t)result
{
  if (result) {
    return objc_msgSend(*(id *)(result + 48), "setSimulatedAperture:");
  }
  return result;
}

- (double)simulatedAperture
{
  if (!a1) {
    return 0.0;
  }
  [*(id *)(a1 + 48) simulatedAperture];
  return result;
}

- (uint64_t)globalMetadata
{
  if (result) {
    return [*(id *)(result + 48) globalMetadata];
  }
  return result;
}

- (uint64_t)getSmartStyle
{
  if (result) {
    return [*(id *)(result + 56) smartStyle];
  }
  return result;
}

- (uint64_t)semanticStyleSceneObserver
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)sourceID
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

@end