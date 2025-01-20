@interface FigCaptureMetadataSinkPipeline
+ (void)initialize;
- (id)_buildMetadataDetectorSinkPipeline:(void *)a3 graph:(void *)a4 mrcSourceOutput:(void *)a5 captureDevice:(void *)a6 mrcOutputsOut:(uint64_t)a7 inferenceScheduler:;
- (id)_buildMetadataObjectRemoteQueueSinkPipeline:(void *)a3 graph:(void *)a4 metadataNodeOutputs:(uint64_t)a5 videoPreviewEnabled:(int)a6 deferredPrepareEnabled:(uint64_t)a7 delegate:(_OWORD *)a8 clientAuditToken:;
- (id)_buildSceneClassificationPipeline:(uint64_t)a3 graph:(void *)a4 upstreamOutput:(uint64_t)a5 metadataGatingNode:(uint64_t)a6 captureDevice:(uint64_t)a7 inferenceScheduler:(void *)a8 outputOut:;
- (id)_buildVisualIntelligencePipeline:(void *)a3 graph:(uint64_t)a4 upstreamOutput:(uint64_t)a5 captureDevice:(uint64_t)a6 inferenceScheduler:(void *)a7 outputOut:;
- (uint64_t)_buildFaceTrackingPipeline:(void *)a3 graph:(void *)a4 videoCaptureOutput:(void *)a5 pipelineStage:;
- (uint64_t)_buildMetadataSinkPipeline:(void *)a3 graph:(id)a4 videoPreviewOutput:(void *)a5 offlineVISMotionDataSourceOutput:(uint64_t)a6 objectDetectionSourceOutput:(void *)a7 faceTrackingSourceOutput:(uint64_t)a8 eyeReliefStatusSourceOutput:(void *)a9 captureDevice:(BWPipelineStage *)a10 faceTrackingPipelineStage:(_OWORD *)a11 clientAuditToken:(uint64_t)a12 inferenceScheduler:(uint64_t)a13 delegate:;
- (uint64_t)detectedObjectBoxedMetadataOutputs;
- (uint64_t)mrcLowPowerModeEnabled;
- (uint64_t)mrcSceneObserver;
- (uint64_t)setDiscardsFaceDetectionSampleData:(uint64_t)result;
- (uint64_t)setDiscardsFaceTrackingSampleData:(uint64_t)result;
- (uint64_t)setDiscardsMRCSampleData:(uint64_t)result;
- (uint64_t)setMrcSuspended:(uint64_t)result;
- (uint64_t)setRectOfInterest:(double)a3;
- (uint64_t)setSemanticStyleSceneObserver:(uint64_t)result;
- (uint64_t)smartCameraInferenceOutput;
- (uint64_t)sourceDeviceType;
- (uint64_t)sourceID;
- (void)_buildPreviewHistogramSinkPipeline:(void *)a3 graph:(void *)a4 videoPreviewHistogramOutput:;
- (void)dealloc;
- (void)initWithConfiguration:(void *)a3 graph:(uint64_t)a4 name:(void *)a5 videoPreviewOutput:(void *)a6 offlineVISMotionDataSourceOutput:(uint64_t)a7 objectDetectionSourceOutput:(void *)a8 faceTrackingSourceOutput:(uint64_t)a9 eyeReliefStatusSourceOutput:(void *)a10 captureDevice:(BWPipelineStage *)a11 faceTrackingPipelineStage:(_OWORD *)a12 clientAuditToken:(uint64_t)a13 inferenceScheduler:(uint64_t)a14 delegate:;
- (void)setSceneClassifierSuspended:(void *)result;
@end

@implementation FigCaptureMetadataSinkPipeline

- (uint64_t)setDiscardsFaceDetectionSampleData:(uint64_t)result
{
  if (result)
  {
    v3 = (void *)[*(id *)(result + 120) metadataObjectOutput];
    return [v3 setDiscardsSampleData:a2];
  }
  return result;
}

- (uint64_t)setDiscardsMRCSampleData:(uint64_t)result
{
  if (result)
  {
    v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 64), "input"), "connection"), "output");
    return [v3 setDiscardsSampleData:a2];
  }
  return result;
}

- (uint64_t)setDiscardsFaceTrackingSampleData:(uint64_t)result
{
  if (result)
  {
    v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 112), "input"), "connection"), "output");
    return [v3 setDiscardsSampleData:a2];
  }
  return result;
}

- (void)_buildPreviewHistogramSinkPipeline:(void *)a3 graph:(void *)a4 videoPreviewHistogramOutput:
{
  if (result)
  {
    v6 = result;
    v12 = 0;
    if (a2) {
      v7 = *(void **)(a2 + 8);
    }
    else {
      v7 = 0;
    }
    v8 = +[BWPipelineStage pipelineStageWithName:priority:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:discardsLateSampleData:", FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.video-preview-histogram", (void *)[v7 sourceConfiguration]), 0, 1);
    [a4 setName:@"Preview Histogram"];
    v9 = objc_alloc_init(BWPreviewHistogramNode);
    [(BWPreviewHistogramNode *)v9 setMsrHistogramsEnabled:FigCaptureSessionIsLaunchPrewarmingEnabled()];
    [(BWPreviewHistogramNode *)v9 setIspHistogramsEnabled:FigCaptureMetadataUtilitiesShouldIncludeDiagnosticMetadata()];
    v11.receiver = v6;
    v11.super_class = (Class)FigCaptureMetadataSinkPipeline;
    if ((objc_msgSendSuper2(&v11, sel_addNode_error_, v9, &v12) & 1) == 0
      || (v10 = v9,
          v6[13] = v10,
          (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a4, -[BWNode input](v10, "input"), v8) & 1) == 0))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    result = v12;
    if (v12) {
      return (void *)[v12 code];
    }
  }
  return result;
}

- (id)_buildMetadataObjectRemoteQueueSinkPipeline:(void *)a3 graph:(void *)a4 metadataNodeOutputs:(uint64_t)a5 videoPreviewEnabled:(int)a6 deferredPrepareEnabled:(uint64_t)a7 delegate:(_OWORD *)a8 clientAuditToken:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v14 = result;
    id v44 = 0;
    uint64_t v15 = [a4 count];
    v16 = &classRef_BWColorConstancyProcessorController;
    if ((int)v15 < 2)
    {
      uint64_t v24 = [a4 firstObject];
    }
    else
    {
      v17 = [[BWFunnelNode alloc] initWithNumberOfInputs:v15 mediaType:1836016234];
      [(BWNode *)v17 setName:@"Metadata Funnel"];
      v43.receiver = v14;
      v43.super_class = (Class)FigCaptureMetadataSinkPipeline;
      if ((objc_msgSendSuper2(&v43, sel_addNode_error_, v17, &v44) & 1) == 0)
      {
        fig_log_get_emitter();
        goto LABEL_25;
      }
      v33 = a8;
      uint64_t v34 = a7;
      int v35 = a6;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v18 = [a4 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        int v20 = 0;
        uint64_t v21 = *(void *)v40;
        while (2)
        {
          uint64_t v22 = 0;
          uint64_t v23 = v20;
          do
          {
            if (*(void *)v40 != v21) {
              objc_enumerationMutation(a4);
            }
            if (!objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", *(void *)(*((void *)&v39 + 1) + 8 * v22), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v17, "inputs"), "objectAtIndexedSubscript:", v23 + v22), 0))
            {
              fig_log_get_emitter();
              goto LABEL_25;
            }
            ++v22;
          }
          while (v19 != v22);
          uint64_t v19 = [a4 countByEnumeratingWithState:&v39 objects:v45 count:16];
          int v20 = v23 + v22;
          if (v19) {
            continue;
          }
          break;
        }
      }
      uint64_t v24 = [(BWNode *)v17 output];
      a6 = v35;
      a8 = v33;
      a7 = v34;
      v16 = &classRef_BWColorConstancyProcessorController;
    }
    v25 = [BWRemoteQueueSinkNode alloc];
    uint64_t v26 = [v14 sinkID];
    long long v27 = a8[1];
    v38[0] = *a8;
    v38[1] = v27;
    v28 = [(BWRemoteQueueSinkNode *)v25 initWithMediaType:1836016234 clientAuditToken:v38 sinkID:v26];
    [(BWNode *)v28 setName:@"Metadata Remote Queue Sink"];
    [(BWRemoteQueueSinkNode *)v28 setDelegate:a7];
    v29 = (objc_class *)v16[442];
    v37.receiver = v14;
    v37.super_class = v29;
    if (objc_msgSendSuper2(&v37, sel_addNode_error_, v28, &v44))
    {
      v30 = (objc_class *)v16[442];
      v36.receiver = v14;
      v36.super_class = v30;
      objc_msgSendSuper2(&v36, sel_setSinkNode_, v28);
      if (a6)
      {
        if (a2) {
          v31 = *(void **)(a2 + 8);
        }
        else {
          v31 = 0;
        }
        v32 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.metadata-object-remote-queue", (void *)[v31 sourceConfiguration]), 0);
      }
      else
      {
        v32 = 0;
      }
      if (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", v24, -[BWNode input](v28, "input"), v32)) {
        goto LABEL_21;
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
LABEL_25:
    FigDebugAssert3();
LABEL_21:
    result = v44;
    if (v44) {
      return (id)[v44 code];
    }
  }
  return result;
}

- (uint64_t)_buildFaceTrackingPipeline:(void *)a3 graph:(void *)a4 videoCaptureOutput:(void *)a5 pipelineStage:
{
  if (result)
  {
    v9 = (void *)result;
    id v17 = 0;
    [a4 setName:@"FaceTracking"];
    v10 = [BWFaceTrackingNode alloc];
    uint64_t v11 = [a5 priority];
    if (a2) {
      uint64_t v12 = *(unsigned int *)(a2 + 52);
    }
    else {
      uint64_t v12 = 0;
    }
    v13 = [(BWFaceTrackingNode *)v10 initWithFigThreadPriority:v11 pearlModuleType:v12 useUnfilteredDepth:1 queueDepth:2 passthroughInputs:0 allowPixelTransfer:0];
    if (v13)
    {
      v14 = v13;
      if (a2)
      {
        uint64_t v15 = *(void **)(a2 + 8);
        a2 = *(void *)(a2 + 16);
      }
      else
      {
        uint64_t v15 = 0;
      }
      -[BWFaceTrackingNode setFrontCamera:](v13, "setFrontCamera:", objc_msgSend((id)objc_msgSend(v15, "sourceConfiguration"), "sourcePosition") == 2);
      -[BWFaceTrackingNode setMirrored:](v14, "setMirrored:", [(id)a2 mirroringEnabled]);
      -[BWFaceTrackingNode setOrientation:](v14, "setOrientation:", [(id)a2 orientation]);
      -[BWFaceTrackingNode setMaxFaces:](v14, "setMaxFaces:", [v15 faceTrackingMaxFaces]);
      -[BWFaceTrackingNode setUsesFaceRecognition:](v14, "setUsesFaceRecognition:", [v15 faceTrackingUsesFaceRecognition]);
      -[BWFaceTrackingNode setFaceTrackingPlusEnabled:](v14, "setFaceTrackingPlusEnabled:", [v15 faceTrackingPlusEnabled]);
      [v15 faceTrackingNetworkFailureThresholdMultiplier];
      -[BWFaceTrackingNode setNetworkFailureThresholdMultiplier:](v14, "setNetworkFailureThresholdMultiplier:");
      [v15 faceTrackingFailureFieldOfViewModifier];
      -[BWFaceTrackingNode setTrackingFailureFieldOfViewModifier:](v14, "setTrackingFailureFieldOfViewModifier:");
      v16.receiver = v9;
      v16.super_class = (Class)FigCaptureMetadataSinkPipeline;
      if ((objc_msgSendSuper2(&v16, sel_addNode_error_, v14, &v17) & 1) == 0
        || (v9[14] = v14,
            (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a4, -[BWNode input](v14, "input"), a5) & 1) == 0))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
      result = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      result = FigSignalErrorAt();
      if (result) {
        return result;
      }
    }
    if (v17) {
      return [v17 code];
    }
  }
  return result;
}

- (uint64_t)setRectOfInterest:(double)a3
{
  if (result)
  {
    uint64_t v9 = result;
    objc_msgSend(*(id *)(result + 64), "setRectOfInterest:");
    v10 = *(void **)(v9 + 120);
    return objc_msgSend(v10, "setRectOfInterest:", a2, a3, a4, a5);
  }
  return result;
}

- (uint64_t)mrcSceneObserver
{
  if (result)
  {
    if (*(void *)(result + 80)) {
      return 0;
    }
    else {
      return *(void *)(result + 56);
    }
  }
  return result;
}

- (uint64_t)sourceID
{
  if (result) {
    return *(void *)(result + 128);
  }
  return result;
}

- (uint64_t)sourceDeviceType
{
  if (result) {
    return *(unsigned int *)(result + 136);
  }
  return result;
}

- (uint64_t)smartCameraInferenceOutput
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

+ (void)initialize
{
}

- (void)initWithConfiguration:(void *)a3 graph:(uint64_t)a4 name:(void *)a5 videoPreviewOutput:(void *)a6 offlineVISMotionDataSourceOutput:(uint64_t)a7 objectDetectionSourceOutput:(void *)a8 faceTrackingSourceOutput:(uint64_t)a9 eyeReliefStatusSourceOutput:(void *)a10 captureDevice:(BWPipelineStage *)a11 faceTrackingPipelineStage:(_OWORD *)a12 clientAuditToken:(uint64_t)a13 inferenceScheduler:(uint64_t)a14 delegate:
{
  if (!a1) {
    return 0;
  }
  if (a2) {
    uint64_t v21 = *(void **)(a2 + 8);
  }
  else {
    uint64_t v21 = 0;
  }
  v28.receiver = a1;
  v28.super_class = (Class)FigCaptureMetadataSinkPipeline;
  uint64_t v22 = objc_msgSendSuper2(&v28, sel_initWithGraph_name_sinkID_, a3, a4, objc_msgSend((id)objc_msgSend(v21, "sinkConfiguration"), "sinkID"));
  if (v22)
  {
    if (a2)
    {
      v22[16] = (id)objc_msgSend((id)objc_msgSend(*(id *)(a2 + 8), "sourceConfiguration"), "sourceID");
      uint64_t v23 = *(void **)(a2 + 8);
    }
    else
    {
      id v26 = (id)objc_msgSend((id)objc_msgSend(0, "sourceConfiguration"), "sourceID");
      uint64_t v23 = 0;
      v22[16] = v26;
    }
    *((_DWORD *)v22 + 34) = [v23 underlyingDeviceType];
    long long v24 = a12[1];
    v27[0] = *a12;
    v27[1] = v24;
    if (-[FigCaptureMetadataSinkPipeline _buildMetadataSinkPipeline:graph:videoPreviewOutput:offlineVISMotionDataSourceOutput:objectDetectionSourceOutput:faceTrackingSourceOutput:eyeReliefStatusSourceOutput:captureDevice:faceTrackingPipelineStage:clientAuditToken:inferenceScheduler:delegate:]((uint64_t)v22, a2, a3, a5, a6, a7, a8, a9, a10, a11, v27, a13, a14))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v22;
}

- (uint64_t)_buildMetadataSinkPipeline:(void *)a3 graph:(id)a4 videoPreviewOutput:(void *)a5 offlineVISMotionDataSourceOutput:(uint64_t)a6 objectDetectionSourceOutput:(void *)a7 faceTrackingSourceOutput:(uint64_t)a8 eyeReliefStatusSourceOutput:(void *)a9 captureDevice:(BWPipelineStage *)a10 faceTrackingPipelineStage:(_OWORD *)a11 clientAuditToken:(uint64_t)a12 inferenceScheduler:(uint64_t)a13 delegate:
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v19 = result;
  unsigned int v99 = 0;
  id v98 = 0;
  int v20 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v21 = (void *)[MEMORY[0x1E4F1CA48] array];
  v85 = v20;
  v86 = (void *)v19;
  uint64_t v83 = (uint64_t)a5;
  if (!a4) {
    goto LABEL_51;
  }
  uint64_t v82 = a8;
  if (a2)
  {
    unsigned int v22 = FigCaptureMetadataObjectConfigurationRequiresMetadataDetectorPipeline(*(void **)(a2 + 8));
    if (FigCaptureMetadataObjectConfigurationRequiresSceneClassification(*(void **)(a2 + 8)))
    {
LABEL_5:
      unsigned int v23 = v22 + 1;
      unsigned int v24 = -1;
      unsigned int v25 = v22;
      goto LABEL_11;
    }
    id v26 = *(void **)(a2 + 8);
  }
  else
  {
    unsigned int v22 = FigCaptureMetadataObjectConfigurationRequiresMetadataDetectorPipeline(0);
    char v76 = FigCaptureMetadataObjectConfigurationRequiresSceneClassification(0);
    id v26 = 0;
    if (v76) {
      goto LABEL_5;
    }
  }
  int v27 = FigCaptureMetadataObjectConfigurationRequiresVisualIntelligenceObjectDetection(v26);
  if (v27) {
    unsigned int v24 = v22;
  }
  else {
    unsigned int v24 = -1;
  }
  unsigned int v23 = v22 + v27;
  unsigned int v25 = -1;
LABEL_11:
  if (a2) {
    objc_super v28 = *(void **)(a2 + 8);
  }
  else {
    objc_super v28 = 0;
  }
  int v29 = FigCaptureMetadataObjectConfigurationRequiresVideoPreviewHistogramPipeline(v28);
  if (v29) {
    uint64_t v31 = v23;
  }
  else {
    uint64_t v31 = 0xFFFFFFFFLL;
  }
  uint64_t v81 = v31;
  uint64_t v32 = v23 + v29;
  if (v32 >= 2)
  {
    if (a2) {
      v33 = *(void **)(a2 + 8);
    }
    else {
      v33 = 0;
    }
    uint64_t v34 = +[BWPipelineStage pipelineStageWithName:priority:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:discardsLateSampleData:", FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.video-preview-metadata-fanout", (void *)[v33 sourceConfiguration]), 0, 1);
    int v35 = [[BWFanOutNode alloc] initWithFanOutCount:v32 mediaType:1986618469];
    [(BWNode *)v35 setName:@"Video Preview Metadata Fan Out"];
    v97.receiver = v86;
    v97.super_class = (Class)FigCaptureMetadataSinkPipeline;
    if ((objc_msgSendSuper2(&v97, sel_addNode_error_, v35, &v98) & 1) == 0
      || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a4, -[BWNode input](v35, "input"), v34) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_105;
    }
    if (v22) {
      a4 = [(NSArray *)[(BWNode *)v35 outputs] objectAtIndexedSubscript:0];
    }
    else {
      a4 = 0;
    }
    if ((v25 & 0x80000000) != 0) {
      uint64_t v36 = 0;
    }
    else {
      uint64_t v36 = [(NSArray *)[(BWNode *)v35 outputs] objectAtIndexedSubscript:v25];
    }
    uint64_t v19 = (uint64_t)v86;
    if ((v24 & 0x80000000) != 0)
    {
      uint64_t v37 = 0;
      if ((v81 & 0x80000000) == 0) {
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v37 = [(NSArray *)[(BWNode *)v35 outputs] objectAtIndexedSubscript:v24];
      if ((v81 & 0x80000000) == 0)
      {
LABEL_33:
        uint64_t v38 = [(NSArray *)[(BWNode *)v35 outputs] objectAtIndexedSubscript:v81];
        goto LABEL_36;
      }
    }
    uint64_t v38 = 0;
LABEL_36:
    long long v39 = a9;
    if (!a4) {
      goto LABEL_40;
    }
    goto LABEL_37;
  }
  if (v22)
  {
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    uint64_t v19 = (uint64_t)v86;
    long long v39 = a9;
LABEL_37:
    *(void *)&v87[0] = 0;
    unsigned int v99 = -[FigCaptureMetadataSinkPipeline _buildMetadataDetectorSinkPipeline:graph:mrcSourceOutput:captureDevice:mrcOutputsOut:inferenceScheduler:]((id *)v19, a2, a3, a4, v39, v87, a12);
    if (v99) {
      goto LABEL_104;
    }
    uint64_t v30 = *(void *)&v87[0];
    if (*(void *)&v87[0]) {
      objc_msgSend(v85, "addObjectsFromArray:");
    }
LABEL_40:
    a4 = (id)v36;
    if (!v36) {
      goto LABEL_44;
    }
    goto LABEL_41;
  }
  long long v39 = a9;
  if ((v25 & 0x80000000) == 0)
  {
    uint64_t v38 = 0;
    uint64_t v37 = 0;
    uint64_t v19 = (uint64_t)v86;
LABEL_41:
    *(void *)&v87[0] = 0;
    unsigned int v99 = -[FigCaptureMetadataSinkPipeline _buildSceneClassificationPipeline:graph:upstreamOutput:metadataGatingNode:captureDevice:inferenceScheduler:outputOut:]((void *)v19, a2, v30, a4, *(void *)(v19 + 56), (uint64_t)v39, a12, v87);
    if (v99) {
      goto LABEL_104;
    }
    if (*(void *)&v87[0]) {
      objc_msgSend(v21, "addObject:");
    }
LABEL_44:
    a4 = (id)v37;
    a5 = (void *)v83;
    if (!v37) {
      goto LABEL_48;
    }
    goto LABEL_45;
  }
  if ((v24 & 0x80000000) != 0)
  {
    int v20 = v85;
    uint64_t v19 = (uint64_t)v86;
    a8 = v82;
    if ((v31 & 0x80000000) != 0) {
      goto LABEL_51;
    }
    goto LABEL_49;
  }
  uint64_t v38 = 0;
  uint64_t v19 = (uint64_t)v86;
LABEL_45:
  *(void *)&v87[0] = 0;
  unsigned int v99 = -[FigCaptureMetadataSinkPipeline _buildVisualIntelligencePipeline:graph:upstreamOutput:captureDevice:inferenceScheduler:outputOut:]((id)v19, a2, a3, (uint64_t)a4, (uint64_t)v39, a12, v87);
  if (v99) {
    goto LABEL_104;
  }
  if (*(void *)&v87[0]) {
    objc_msgSend(v21, "addObject:");
  }
LABEL_48:
  a4 = (id)v38;
  int v20 = v85;
  a8 = v82;
  if (!v38) {
    goto LABEL_51;
  }
LABEL_49:
  unsigned int v99 = -[FigCaptureMetadataSinkPipeline _buildPreviewHistogramSinkPipeline:graph:videoPreviewHistogramOutput:]((void *)v19, a2, a3, a4);
  if (v99) {
    goto LABEL_104;
  }
  objc_msgSend(v20, "addObject:", objc_msgSend(*(id *)(v19 + 104), "output"));
LABEL_51:
  if ([a7 mediaType] == 1986618469)
  {
    long long v40 = a10;
    if (!a10)
    {
      if (a2) {
        long long v41 = *(void **)(a2 + 8);
      }
      else {
        long long v41 = 0;
      }
      long long v40 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.facetracking", (void *)[v41 sourceConfiguration]), 13);
    }
    unsigned int v99 = -[FigCaptureMetadataSinkPipeline _buildFaceTrackingPipeline:graph:videoCaptureOutput:pipelineStage:](v19, a2, a3, a7, v40);
    if (v99) {
      goto LABEL_104;
    }
    a7 = (void *)[*(id *)(v19 + 112) output];
    goto LABEL_59;
  }
  if ([a7 mediaType] == 1835365473) {
LABEL_59:
  }
    [v20 addObject:a7];
  if (a8) {
    [v20 addObject:a8];
  }
  if (a5)
  {
    [a5 setName:@"OfflineVISMotionData"];
    if (a2) {
      long long v42 = *(void **)(a2 + 16);
    }
    else {
      long long v42 = 0;
    }
    objc_super v43 = objc_msgSend((id)objc_msgSend(v42, "sourceConfiguration"), "requiredFormat");
    int v44 = objc_msgSend((id)objc_msgSend(v42, "sourceConfiguration"), "imageControlMode");
    unsigned int v45 = [v43 horizontalSensorBinningFactor];
    unsigned int v46 = [v43 verticalSensorBinningFactor];
    [v43 maxSupportedFrameRate];
    if (a2) {
      unsigned int v48 = *(_DWORD *)(a2 + 44);
    }
    else {
      unsigned int v48 = 0;
    }
    uint64_t v19 = (uint64_t)v86;
    uint64_t v49 = FigCaptureBuildMotionAttachmentsNode(v86, v83, v45, v46, 0, v48, [a9 sensorIDDictionaryByPortType], objc_msgSend(a9, "cameraInfoByPortType"), v47, objc_msgSend(a9, "activePortTypes"), v44 == 4, objc_msgSend((id)objc_msgSend(v42, "irisSinkConfiguration"), "optimizesImagesForOfflineVideoStabilization"), 0, 1, &v99);
    if (v99) {
      goto LABEL_104;
    }
    int v20 = v85;
    [v85 addObject:v49];
  }
  if (a6)
  {
    if (a2)
    {
      v50 = (void *)[*(id *)(a2 + 8) metadataIdentifiers];
      if ([*(id *)(a2 + 56) count] && *(unsigned char *)(a2 + 48))
      {
        v51 = (void *)[MEMORY[0x1E4F1CA48] array];
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        v52 = *(void **)(a2 + 56);
        uint64_t v53 = [v52 countByEnumeratingWithState:&v93 objects:v101 count:16];
        if (v53)
        {
          uint64_t v54 = v53;
          uint64_t v55 = *(void *)v94;
          do
          {
            for (uint64_t i = 0; i != v54; ++i)
            {
              if (*(void *)v94 != v55) {
                objc_enumerationMutation(v52);
              }
              objc_msgSend(v51, "addObject:", CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)objc_msgSend(*(id *)(*((void *)&v93 + 1)+ 8 * i), "formatDescription")));
            }
            uint64_t v54 = [v52 countByEnumeratingWithState:&v93 objects:v101 count:16];
          }
          while (v54);
          uint64_t v19 = (uint64_t)v86;
        }
      }
      else
      {
        v51 = 0;
      }
      *(void *)&v87[0] = 0;
      [*(id *)(a2 + 8) metadataRectOfInterest];
      double v58 = v57;
      double v60 = v59;
      double v62 = v61;
      double v64 = v63;
      v65 = *(void **)(a2 + 8);
    }
    else
    {
      v50 = (void *)[0 metadataIdentifiers];
      [0 count];
      *(void *)&v87[0] = 0;
      [0 metadataRectOfInterest];
      double v58 = v77;
      double v60 = v78;
      double v62 = v79;
      double v64 = v80;
      v51 = 0;
      v65 = 0;
    }
    unsigned int v99 = FigCaptureBuildObjectDetectionPipeline((void *)v19, v50, v51, [v65 emitsEmptyObjectDetectionMetadata], a6, (BWFaceDetectionNode **)v87, v58, v60, v62, v64);
    if (v99) {
      goto LABEL_104;
    }
    id v66 = *(id *)&v87[0];
    *(void *)(v19 + 120) = v66;
    if ([v66 metadataObjectOutputEnabled]) {
      objc_msgSend(v20, "addObject:", objc_msgSend(*(id *)(v19 + 120), "output"));
    }
  }
  if (![v21 count]) {
    goto LABEL_97;
  }
  v67 = -[BWFunnelNode initWithNumberOfInputs:mediaType:]([BWMetadataPropagatorNode alloc], "initWithNumberOfInputs:mediaType:", [v21 count], 1836016234);
  v92.receiver = (id)v19;
  v92.super_class = (Class)FigCaptureMetadataSinkPipeline;
  if (objc_msgSendSuper2(&v92, sel_addNode_error_, v67, &v98))
  {
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    uint64_t v68 = [v21 countByEnumeratingWithState:&v88 objects:v100 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      int v70 = 0;
      uint64_t v71 = *(void *)v89;
LABEL_90:
      uint64_t v72 = 0;
      uint64_t v73 = v70;
      while (1)
      {
        if (*(void *)v89 != v71) {
          objc_enumerationMutation(v21);
        }
        if (!objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", *(void *)(*((void *)&v88 + 1) + 8 * v72), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v67, "inputs"), "objectAtIndexedSubscript:", v73 + v72), 0))goto LABEL_104; {
        if (v69 == ++v72)
        }
        {
          uint64_t v69 = [v21 countByEnumeratingWithState:&v88 objects:v100 count:16];
          int v70 = v73 + v72;
          if (v69) {
            goto LABEL_90;
          }
          break;
        }
      }
    }
    int v20 = v85;
    objc_msgSend(v85, "addObject:", -[BWNode output](v67, "output"));
    uint64_t v19 = (uint64_t)v86;
LABEL_97:
    if (a2) {
      BOOL v74 = *(unsigned char *)(a2 + 41) != 0;
    }
    else {
      BOOL v74 = 0;
    }
    long long v75 = a11[1];
    v87[0] = *a11;
    v87[1] = v75;
    unsigned int v99 = -[FigCaptureMetadataSinkPipeline _buildMetadataObjectRemoteQueueSinkPipeline:graph:metadataNodeOutputs:videoPreviewEnabled:deferredPrepareEnabled:delegate:clientAuditToken:]((id)v19, a2, a3, v20, 0, v74, a13, v87);
    goto LABEL_100;
  }
LABEL_104:
  fig_log_get_emitter();
LABEL_105:
  FigDebugAssert3();
LABEL_100:
  result = v99;
  if (!v99)
  {
    if (v98) {
      return [v98 code];
    }
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMetadataSinkPipeline;
  [(FigCaptureRemoteQueueSinkPipeline *)&v3 dealloc];
}

- (uint64_t)setSemanticStyleSceneObserver:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 80) setSemanticStyleSceneObserver:a2];
  }
  return result;
}

- (uint64_t)detectedObjectBoxedMetadataOutputs
{
  if (result) {
    return [*(id *)(result + 120) boxedMetadataOutputs];
  }
  return result;
}

- (uint64_t)mrcLowPowerModeEnabled
{
  if (result) {
    return [*(id *)(result + 64) lowPowerModeEnabled];
  }
  return result;
}

- (void)setSceneClassifierSuspended:(void *)result
{
  if (result)
  {
    objc_super v3 = result;
    result = (void *)result[10];
    if (result)
    {
      v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "input"), "connection"), "output");
      if (!v5)
      {
        fig_log_get_emitter();
        uint64_t v8 = v2;
        LODWORD(v7) = 0;
        FigDebugAssert3();
      }
      objc_msgSend(v5, "setDiscardsSampleData:", a2, v7, v8);
      v6 = (void *)v3[11];
      if (!v6)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v6 = (void *)v3[11];
      }
      return (void *)[v6 setDiscardsSampleData:a2];
    }
  }
  return result;
}

- (id)_buildMetadataDetectorSinkPipeline:(void *)a3 graph:(void *)a4 mrcSourceOutput:(void *)a5 captureDevice:(void *)a6 mrcOutputsOut:(uint64_t)a7 inferenceScheduler:
{
  if (result)
  {
    uint64_t v9 = result;
    unsigned int v45 = 0;
    if (a2) {
      v10 = *(void **)(a2 + 8);
    }
    else {
      v10 = 0;
    }
    long long v39 = +[BWPipelineStage pipelineStageWithName:priority:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:discardsLateSampleData:", FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.mrc", (void *)[v10 sourceConfiguration]), 0, 1);
    [a4 setName:@"MRC"];
    LODWORD(v11) = 30.0;
    [a4 setMaxSampleDataOutputRate:v11];
    if (a2)
    {
      uint64_t v12 = FigCaptureMetadataObjectConfigurationRequiresMRCNode(*(void **)(a2 + 8));
      uint64_t v13 = FigCaptureMetadataObjectConfigurationRequiresAppClipCodeNode(*(void **)(a2 + 8));
      uint64_t v14 = FigCaptureMetadataObjectConfigurationRequiresTextLocalization(*(void **)(a2 + 8));
      int v15 = *(unsigned __int8 *)(a2 + 49);
      BOOL v16 = *(unsigned char *)(a2 + 49) != 0;
      int v17 = *(unsigned __int8 *)(a2 + 33);
      uint64_t v18 = [BWMetadataDetectorGatingNode alloc];
      if (v17)
      {
        uint64_t v19 = [(BWMetadataDetectorGatingNode *)v18 initWithSceneClassifierVersion:*(unsigned int *)(a2 + 34) | ((unint64_t)*(unsigned __int16 *)(a2 + 38) << 32) mrcEnabled:v12 appClipCodeEnabled:v13 textLocalizationEnabled:v14 lowPowerModeEnabled:*(unsigned __int8 *)(a2 + 32) compressed8BitInputEnabled:v15 != 0];
LABEL_9:
        uint64_t v21 = v19;
        v44.receiver = v9;
        v44.super_class = (Class)FigCaptureMetadataSinkPipeline;
        if ((objc_msgSendSuper2(&v44, sel_addNode_error_, v21, &v45) & 1) == 0
          || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a4, -[BWNode input](v21, "input"), v39) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_51;
        }
        v9[7] = v21;
        uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](-[BWNode outputs](v21, "outputs"), "count"));
        unsigned int v23 = (void *)v22;
        if (v12)
        {
          int v35 = (void *)v22;
          unsigned int v24 = objc_alloc_init(BWMRCNode);
          if (a2)
          {
            unsigned int v25 = *(void **)(a2 + 8);
            BOOL v26 = *(unsigned char *)(a2 + 32) != 0;
          }
          else
          {
            unsigned int v25 = 0;
            BOOL v26 = 0;
          }
          -[BWMRCNode setMrcIdentifiers:](v24, "setMrcIdentifiers:", [v25 metadataIdentifiers]);
          [v25 metadataRectOfInterest];
          -[BWMRCNode setRectOfInterest:](v24, "setRectOfInterest:");
          [(BWMRCNode *)v24 setLowPowerModeEnabled:v26];
          [(BWMRCNode *)v24 setDetectedResultsObserver:[(BWMetadataDetectorGatingNode *)v21 mrcResultsObserver]];
          v43.receiver = v9;
          v43.super_class = (Class)FigCaptureMetadataSinkPipeline;
          if ((objc_msgSendSuper2(&v43, sel_addNode_error_, v24, &v45) & 1) == 0
            || (v9[8] = v24,
                (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", -[BWMetadataDetectorGatingNode mrcOutput](v21, "mrcOutput"), objc_msgSend(v9[8], "input"), +[BWPipelineStage pipelineStageWithName:priority:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:discardsLateSampleData:", @"com.apple.coremedia.capture.mrc.barcode", 0, 0)) & 1) == 0))
          {
            fig_log_get_emitter();
            goto LABEL_51;
          }
          unsigned int v23 = v35;
          objc_msgSend(v35, "addObject:", -[BWNode output](v24, "output"));
        }
        int v27 = a5;
        if (v13)
        {
          objc_super v28 = [[BWAppClipCodeNode alloc] initWithProcessingQueuePriority:[(BWPipelineStage *)v39 priority]];
          [(BWAppClipCodeNode *)v28 setDetectedResultsObserver:[(BWMetadataDetectorGatingNode *)v21 appClipCodeResultsObserver]];
          v42.receiver = v9;
          v42.super_class = (Class)FigCaptureMetadataSinkPipeline;
          if ((objc_msgSendSuper2(&v42, sel_addNode_error_, v28, &v45) & 1) == 0
            || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", -[BWMetadataDetectorGatingNode appClipCodeOutput](v21, "appClipCodeOutput"), -[BWNode input](v28, "input"), +[BWPipelineStage pipelineStageWithName:priority:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:discardsLateSampleData:", @"com.apple.coremedia.capture.mrc.app-clip-code", 0, 0)) & 1) == 0)
          {
            fig_log_get_emitter();
            goto LABEL_51;
          }
          objc_msgSend(v23, "addObject:", -[BWNode output](v28, "output"));
        }
        if (!v14)
        {
LABEL_44:
          if (a6) {
            *a6 = v23;
          }
          [v27 registerForAEMatrixMetadata];
          goto LABEL_47;
        }
        int v29 = [[BWInferenceNode alloc] initWithConvEngineSupportWithCaptureDevice:a5 scheduler:a7 priority:6];
        [(BWNode *)v29 setName:@"Text Localization"];
        if (a2)
        {
          int v30 = *(_DWORD *)(a2 + 64);
          if (v30 >= 0) {
            int v31 = *(_DWORD *)(a2 + 64);
          }
          else {
            int v31 = -v30;
          }
          if (v31 == 90)
          {
            BOOL v32 = 1;
LABEL_41:
            v33 = [(BWMetadataDetectorGatingNode *)v21 textLocalizationResultsObserver];
            [(BWInferenceNode *)v29 setPassthroughInputSampleBuffer:0];
            objc_initWeak(location, v29);
            objc_initWeak(&from, v33);
            v49[0] = 0;
            v49[1] = v49;
            v49[2] = 0x2020000000;
            v49[3] = 0;
            v46[0] = MEMORY[0x1E4F143A8];
            v46[1] = 3221225472;
            v46[2] = __msp_configureTextLocalizationNode_block_invoke;
            v46[3] = &unk_1E5C2C1D0;
            objc_copyWeak(&v47, &from);
            v46[4] = v49;
            objc_copyWeak(&v48, location);
            [(BWInferenceNode *)v29 setPostprocessFilter:v46];
            id v34 = +[BWTextLocalizationInferenceConfiguration configuration];
            objc_msgSend(v34, "setLogger:", objc_msgSend(objc_loadWeak(&from), "logger"));
            [v34 setInferenceInputUsesPortraitOrientation:v32];
            -[BWInferenceNode addInferenceOfType:version:configuration:](v29, "addInferenceOfType:version:configuration:", 116, [v34 version] & 0xFFFFFFFFFFFFLL, v34);
            objc_destroyWeak(&v48);
            objc_destroyWeak(&v47);
            _Block_object_dispose(v49, 8);
            objc_destroyWeak(&from);
            objc_destroyWeak(location);
            v41.receiver = v9;
            v41.super_class = (Class)FigCaptureMetadataSinkPipeline;
            if ((objc_msgSendSuper2(&v41, sel_addNode_error_, v29, &v45) & 1) != 0
              && (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", -[BWMetadataDetectorGatingNode textLocalizationOutput](v21, "textLocalizationOutput"), -[BWNode input](v29, "input"), +[BWPipelineStage pipelineStageWithName:priority:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:discardsLateSampleData:", @"com.apple.coremedia.capture.mrc.text-localization", 0, 0)) & 1) != 0)
            {
              objc_msgSend(v23, "addObject:", -[BWNode output](v29, "output"));
              int v27 = a5;
              goto LABEL_44;
            }
            fig_log_get_emitter();
LABEL_51:
            FigDebugAssert3();
LABEL_47:
            result = v45;
            if (v45) {
              return (id *)[v45 code];
            }
            return result;
          }
        }
        else
        {
          int v30 = 0;
        }
        if (v30 < 0) {
          int v30 = -v30;
        }
        BOOL v32 = v30 == 270;
        goto LABEL_41;
      }
      BOOL v20 = *(unsigned char *)(a2 + 32) != 0;
    }
    else
    {
      uint64_t v12 = FigCaptureMetadataObjectConfigurationRequiresMRCNode(0);
      uint64_t v13 = FigCaptureMetadataObjectConfigurationRequiresAppClipCodeNode(0);
      uint64_t v14 = FigCaptureMetadataObjectConfigurationRequiresTextLocalization(0);
      uint64_t v18 = [BWMetadataDetectorGatingNode alloc];
      BOOL v16 = 0;
      BOOL v20 = 0;
    }
    uint64_t v19 = [(BWMetadataDetectorGatingNode *)v18 initWithMRCEnabled:v12 appClipCodeEnabled:v13 textLocalizationEnabled:v14 lowPowerModeEnabled:v20 compressed8BitInputEnabled:v16];
    goto LABEL_9;
  }
  return result;
}

- (id)_buildSceneClassificationPipeline:(uint64_t)a3 graph:(void *)a4 upstreamOutput:(uint64_t)a5 metadataGatingNode:(uint64_t)a6 captureDevice:(uint64_t)a7 inferenceScheduler:(void *)a8 outputOut:
{
  if (!a1) {
    return 0;
  }
  if (a2) {
    uint64_t v14 = *(void **)(a2 + 8);
  }
  else {
    uint64_t v14 = 0;
  }
  int v15 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.scene-classification", (void *)[v14 sourceConfiguration]), 13);
  if (a2)
  {
    BOOL v16 = *(unsigned char *)(a2 + 40) != 0;
    if (*(unsigned char *)(a2 + 40)) {
      int v17 = 2;
    }
    else {
      int v17 = 1;
    }
    unint64_t v18 = *(unsigned int *)(a2 + 34) | ((unint64_t)*(unsigned __int16 *)(a2 + 38) << 32);
    uint64_t v19 = *(void **)(a2 + 8);
  }
  else
  {
    unint64_t v18 = 0;
    BOOL v16 = 0;
    uint64_t v19 = 0;
    int v17 = 1;
  }
  unsigned int v24 = 0;
  id v25 = 0;
  int v20 = FigCaptureMetadataObjectConfigurationRequiresVisualIntelligenceObjectDetection(v19);
  id v21 = FigCaptureBuildSceneClassifierPipeline(a1, a4, v18, 13, (uint64_t)v15, v17, v20, a6, a7, 0, &v25, &v24);
  if (v21)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    a1[10] = v24;
    a1[11] = a4;
    if (v16) {
      a1[12] = (id)[v25 lastObject];
    }
    if (a2 && *(unsigned char *)(a2 + 33)) {
      [(BWSceneClassifierSinkNode *)v24 setMrcSceneObserver:a5];
    }
    if (a8) {
      *a8 = [v25 firstObject];
    }
  }
  return v21;
}

- (id)_buildVisualIntelligencePipeline:(void *)a3 graph:(uint64_t)a4 upstreamOutput:(uint64_t)a5 captureDevice:(uint64_t)a6 inferenceScheduler:(void *)a7 outputOut:
{
  if (result)
  {
    uint64_t v13 = result;
    id v19 = 0;
    uint64_t v14 = [[BWInferenceConfiguration alloc] initWithInferenceType:130];
    [(BWInferenceConfiguration *)v14 setPriority:13];
    LODWORD(v15) = 5.0;
    [(BWInferenceConfiguration *)v14 setMaximumFramesPerSecond:v15];
    BOOL v16 = [[BWInferenceNode alloc] initWithConvEngineSupportWithCaptureDevice:a5 scheduler:a6 priority:6];
    [(BWNode *)v16 setName:@"Visual Intelligence Object Detection"];
    if (![(BWInferenceNode *)v16 addInferenceOfType:[(BWInferenceConfiguration *)v14 inferenceType] version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:v14])
    {
      v18.receiver = v13;
      v18.super_class = (Class)FigCaptureMetadataSinkPipeline;
      if ((objc_msgSendSuper2(&v18, sel_addNode_error_, v16, &v19) & 1) != 0
        && (!a2 ? (int v17 = 0) : (int v17 = *(void **)(a2 + 8)),
            ([a3 connectOutput:a4, -[BWNode input](v16, "input"), +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.visual-intelligence-object-detection", objc_msgSend(v17, "sourceConfiguration")), 13) toInput pipelineStage] & 1) != 0))
      {
        if (a7) {
          *a7 = [(BWNode *)v16 output];
        }
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
    result = v19;
    if (v19) {
      return (id)[v19 code];
    }
  }
  return result;
}

- (uint64_t)setMrcSuspended:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 72) = a2;
  }
  return result;
}

@end