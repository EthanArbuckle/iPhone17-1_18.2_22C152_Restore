@interface FigCapturePreviewSinkPipeline
+ (void)initialize;
- (BOOL)depthFilterRenderingEnabled;
- (BOOL)discardsImageQueueSampleData;
- (BOOL)displaysWidestCameraOnly;
- (BOOL)sceneClassifierSuspended;
- (BWImageQueueSinkNode)imageQueueSinkNode;
- (BWMRCSceneObserver)mrcSceneObserver;
- (BWNodeOutput)depthDataSinkOutput;
- (BWNodeOutput)metadataSinkOutput;
- (BWNodeOutput)videoThumbnailSinkOutput;
- (BWPixelTransferNode)scalerNode;
- (BWPreviewStitcherNode)previewStitcherNode;
- (BWPreviewTimeMachineSinkNode)timeMachineSinkNode;
- (BWSemanticStyleSceneObserver)semanticStyleSceneObserver;
- (BWStreamingFilterNode)filterNode;
- (CGPoint)primaryCaptureRectCenter;
- (FigCapturePreviewSinkPipeline)initWithConfiguration:(id)a3 sourcePreviewOutput:(id)a4 imageQueueSinkNode:(id)a5 graph:(id)a6 name:(id)a7 inferenceScheduler:(id)a8 captureDevice:(id)a9 previewTapDelegate:(id)a10 zoomPIPOverlayDelegate:(id)a11;
- (FigCaptureSemanticStyle)semanticStyle;
- (FigCaptureVideoTransform)outputTransform;
- (FigCaptureVideoTransform)videoThumbnailSinkOutputTransform;
- (NSArray)filters;
- (NSDictionary)imageQueueUpdatedPayloadToBeSentAfterCommitConfiguration;
- (NSString)sourceID;
- (double)primaryCaptureRectAspectRatio;
- (float)portraitLightingEffectStrength;
- (float)simulatedAperture;
- (id)_buildImageQueuePreviewSinkPipeline:(BWPipelineStage *)a3 previewPipelineStage:(void *)a4 videoPreviewSinkConnectionConfiguration:(int)a5 previewScalerOutputBuffersAreShared:(int)a6 zoomPIPOverlayEnabled:(uint64_t)a7 zoomPIPSmartStyleRenderingEnabled:(uint64_t)a8 zoomPIPSlaveStreamingEnabled:(float)a9 zoomPIPSlaveStreamingFrameRate:(unsigned __int8)a10 debugOverlayEnabled:(char)a11 deferredPrepareEnabled:(unsigned __int8)a12 parallelGraphRebuildEnabled:(uint64_t)a13 transform:(uint64_t)a14 remoteVideoPreview:(unsigned __int8)a15 maxLossyCompressionLevel:(unsigned int)a16 clientAuditToken:(_OWORD *)a17 graph:(void *)a18 captureDevice:(void *)a19 previewTapDelegate:(uint64_t)a20 videoHDRImageStatisticsEnabled:(unsigned __int8)a21 zoomPIPOverlayDelegate:(uint64_t)a22 metalCommandQueue:(uint64_t)a23;
- (id)_buildPreviewSmartStyleCoefficientsTimeMachineSinkPipeline:(uint64_t)a3 upstreamPipelineStageForPreviewTimeMachine:(uint64_t)a4 previewTimeMachineConnectionConfiguration:(int)a5 deferredPrepareEnabled:(void *)a6 graph:(void *)a7 captureDevice:;
- (id)_stashPreviewImageQueueUpdatedNotificationPayload:(unint64_t)a3 previewDimensions:(int)a4 remoteVideoPreview:;
- (int)sourceDeviceType;
- (int64_t)primaryCaptureRectUniqueID;
- (uint64_t)_appendFilteredPreviewPipeline:(BWPipelineStage *)a3 desiredPipelineStage:(BWPipelineStage *)a4 desiredStreamingFilterPipelineStage:(uint64_t)a5 previewSinkPipelineConfiguration:(void *)a6 videoPreviewSinkConnectionConfiguration:(void *)a7 graph:(uint64_t)a8 inferenceScheduler:(void *)a9 captureDevice:(unsigned __int8)a10 focusBlurMapForDepthFiltersEnabled:(unsigned __int8)a11 depthFromMonocularNetworkEnabled:(unsigned int)a12 maxLossyCompressionLevel:(unsigned __int8)a13 deferredPrepareEnabled:(uint64_t)a14 metalCommandQueue:(unsigned __int8)a15 depthFilterRenderingIsAfterPreviewStitcher:(unsigned __int8)a16 portraitAutoSuggestEnabled:;
- (uint64_t)_buildVideoPreviewSinkPipeline:(uint64_t)a3 sourcePreviewOutput:(void *)a4 graph:(uint64_t)a5 inferenceScheduler:(void *)a6 captureDevice:(uint64_t)a7 previewTapDelegate:(uint64_t)a8 zoomPIPOverlayDelegate:;
- (uint64_t)_metalSubmissionAndCompletionQueue;
- (uint64_t)_setPortraitRenderingInferencesNeededForFilters:(uint64_t)result;
- (uint64_t)toggleDepthDensificationAccordingToFilters:(uint64_t)result;
- (void)_buildPreviewTimeMachineSinkPipeline:(uint64_t)a3 upstreamPipelineStageForPreviewTimeMachine:(uint64_t)a4 upstreamTransform:(uint64_t)a5 previewTimeMachineConnectionConfiguration:(uint64_t)a6 videoPreviewEnabled:(uint64_t)a7 deferredPrepareEnabled:(int)a8 smartCameraMotionDetectionEnabled:(unsigned __int8)a9 graph:(void *)a10 captureDevice:(void *)a11;
- (void)dealloc;
- (void)prepareForRenderingWithPreparedPixelBufferPool;
- (void)setDiscardsImageQueueSampleData:(BOOL)a3;
- (void)setDisplaysWidestCameraOnly:(BOOL)a3;
- (void)setFilters:(id)a3;
- (void)setMrcSceneObserver:(id)a3;
- (void)setPortraitLightingEffectStrength:(float)a3;
- (void)setPreviewTapRegistered:(BOOL)a3;
- (void)setPrimaryCaptureRectAspectRatio:(double)a3 center:(CGPoint)a4 trueVideoTransitionPercentComplete:(double)a5 fencePortSendRight:(id)a6 uniqueID:(int64_t)a7;
- (void)setSceneClassifierSuspended:(BOOL)a3;
- (void)setSemanticStyle:(id)a3;
- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4;
- (void)setSemanticStyleRenderingSuspended:(BOOL)a3 animated:(BOOL)a4;
- (void)setSemanticStyleSceneObserver:(id)a3;
- (void)setSemanticStyleSet:(id)a3 fencePortSendRight:(id)a4;
- (void)setSimulatedAperture:(float)a3;
- (void)setStoppingForClientBackgrounded:(BOOL)a3;
- (void)setStoppingForModeSwitch:(BOOL)a3 parallelGraphRebuildEnabled:(BOOL)a4 ispFastSwitchEnabled:(BOOL)a5 smartStyleRenderingEnabledInTrueVideoGraph:(BOOL)a6;
- (void)setVideoStabilizationOverscanCropEnabled:(BOOL)a3 momentMovieRecordingEnabled:(BOOL)a4;
- (void)updateClientAuditToken:(id *)a3;
@end

@implementation FigCapturePreviewSinkPipeline

- (NSDictionary)imageQueueUpdatedPayloadToBeSentAfterCommitConfiguration
{
  return self->_imageQueueUpdatedPayloadToBeSentAfterCommitConfiguration;
}

- (void)setPreviewTapRegistered:(BOOL)a3
{
  previewStitcher = self->_previewStitcher;
  if (previewStitcher) {
    [(BWPreviewStitcherNode *)previewStitcher setPreviewTapRegistered:a3];
  }
}

- (void)setDiscardsImageQueueSampleData:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(BWNodeConnection *)[(BWNodeInput *)[(BWNode *)self->_imageQueueSinkNode input] connection] output];
  [(BWNodeOutput *)v4 setDiscardsSampleData:v3];
}

- (uint64_t)_appendFilteredPreviewPipeline:(BWPipelineStage *)a3 desiredPipelineStage:(BWPipelineStage *)a4 desiredStreamingFilterPipelineStage:(uint64_t)a5 previewSinkPipelineConfiguration:(void *)a6 videoPreviewSinkConnectionConfiguration:(void *)a7 graph:(uint64_t)a8 inferenceScheduler:(void *)a9 captureDevice:(unsigned __int8)a10 focusBlurMapForDepthFiltersEnabled:(unsigned __int8)a11 depthFromMonocularNetworkEnabled:(unsigned int)a12 maxLossyCompressionLevel:(unsigned __int8)a13 deferredPrepareEnabled:(uint64_t)a14 metalCommandQueue:(unsigned __int8)a15 depthFilterRenderingIsAfterPreviewStitcher:(unsigned __int8)a16 portraitAutoSuggestEnabled:
{
  if (!result) {
    return result;
  }
  v20 = a2;
  uint64_t v21 = result;
  v93[0] = 0;
  uint64_t v92 = 0;
  if (a2) {
    uint64_t v22 = *a2;
  }
  else {
    uint64_t v22 = 0;
  }
  unsigned int v23 = [a6 previewDepthDataDeliveryEnabled];
  unsigned int v24 = v23;
  if (!a3)
  {
    if (v23) {
      v25 = @"com.apple.coremedia.capture.streaming-disparity+filter";
    }
    else {
      v25 = @"com.apple.coremedia.capture.streaming-filter";
    }
    a3 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName((uint64_t)v25, (void *)[a6 sourceConfiguration]), 13);
  }
  if (a4) {
    v26 = a4;
  }
  else {
    v26 = a3;
  }
  v82 = v26;
  v71 = objc_msgSend((id)objc_msgSend(a6, "sourceConfiguration"), "requiredFormat");
  [v71 defaultPortraitLightingEffectStrength];
  if (*(unsigned char *)(v21 + 288)) {
    unsigned int v80 = [a9 portraitPreviewForegroundBlurEnabled];
  }
  else {
    unsigned int v80 = 0;
  }
  v84 = a7;
  unsigned int v74 = v24;
  unsigned int v27 = objc_msgSend((id)objc_msgSend(a6, "videoPreviewSinkConfiguration"), "semanticStyleRenderingEnabled");
  v85 = a6;
  v77 = objc_msgSend((id)objc_msgSend(a6, "videoPreviewSinkConfiguration"), "semanticStyle");
  unsigned int v81 = v27;
  if (v27) {
    unsigned int v27 = *(unsigned __int8 *)(v21 + 288) == a16;
  }
  unsigned int v83 = a15 | a16;
  v79 = objc_msgSend((id)objc_msgSend(a6, "videoPreviewSinkConfiguration"), "filters");
  int v72 = a13 & (BWCIFilterArrayContainsPortraitEffectFilters(v79) ^ 1);
  v28 = [[BWInferenceNode alloc] initWithConvEngineSupportWithCaptureDevice:a9 scheduler:a8 priority:6];
  [(BWNode *)v28 setName:@"Segmentation Node"];
  v70 = v20;
  v29 = v84;
  uint64_t v30 = v22;
  if (v72) {
    [v84 enableBypassUntilPreparedForNode:v28 deferredPreparePriority:2];
  }
  uint64_t v31 = v21;
  v91.receiver = (id)v21;
  v91.super_class = (Class)FigCapturePreviewSinkPipeline;
  if ((objc_msgSendSuper2(&v91, sel_addNode_error_, v28, &v92) & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_88;
  }
  *(void *)(v21 + 104) = v28;
  v32 = [(BWInferenceConfiguration *)[BWStreamingPersonSegmentationConfiguration alloc] initWithInferenceType:105];
  if (v27)
  {
    *(void *)(v21 + 112) = v28;
    uint64_t v69 = v30;
    if ([v77 isIdentity]) {
      uint64_t v75 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EFB00CF8, &unk_1EFB00CE0, 0);
    }
    else {
      uint64_t v75 = 0;
    }
    -[BWStreamingPersonSegmentationConfiguration setInputRotationAngle:](v32, "setInputRotationAngle:", -((unint64_t)[v85 transform] >> 32));
    [(BWStreamingPersonSegmentationConfiguration *)v32 setPropagateColorInput:0];
    [(BWStreamingPersonSegmentationConfiguration *)v32 setCropColorInputToPrimaryCaptureRect:0];
    [(BWInferenceConfiguration *)v32 setPropagatesFrameRatePrevention:1];
    LODWORD(v33) = 10.0;
    [(BWInferenceConfiguration *)v32 setMaximumFramesPerSecond:v33];
    [(BWStreamingPersonSegmentationConfiguration *)v32 setUseLowFrameRateOptimizedNetwork:1];
    [(BWInferenceNode *)v28 addInferenceOfType:105 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:v32];
    v34 = [(BWInferenceConfiguration *)[BWOpticalFlowInferenceConfiguration alloc] initWithInferenceType:117];
    [(BWOpticalFlowInferenceConfiguration *)v34 setInputDimensions:0xC000000100];
    [(BWOpticalFlowInferenceConfiguration *)v34 setOutputDimensions:0xC000000100];
    [(BWOpticalFlowInferenceConfiguration *)v34 setConcurrencyWidth:2];
    -[BWOpticalFlowInferenceConfiguration setInputRotationAngle:](v34, "setInputRotationAngle:", -((unint64_t)[v85 transform] >> 32));
    [(BWOpticalFlowInferenceConfiguration *)v34 setCropColorInputToPrimaryCaptureRect:0];
    [(BWOpticalFlowInferenceConfiguration *)v34 setAttachedMediaKeyForPropagatedColorInput:0x1EFA6A440];
    [(BWInferenceNode *)v28 addInferenceOfType:117 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:v34];
    v35 = [(BWNode *)v28 name];
    uint64_t v36 = [(NSString *)v35 length];
    v37 = @"Optical Flow";
    if (v36) {
      v37 = [(NSString *)v35 stringByAppendingFormat:@" + %@", @"Optical Flow"];
    }
    [(BWNode *)v28 setName:v37];

    [*(id *)(v31 + 112) setInferencesToSkip:v75];
    unsigned int v76 = 1;
    uint64_t v30 = v69;
  }
  else if (v83)
  {
    unsigned int v76 = 0;
  }
  else
  {
    unsigned int v76 = 1;
    [(BWInferenceNode *)v28 addInferenceOfType:105 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:v32];
    if (v80)
    {
      *(void *)(v21 + 120) = v28;
      -[FigCapturePreviewSinkPipeline _setPortraitRenderingInferencesNeededForFilters:](v21, v79);
      unsigned int v76 = 1;
    }
  }
  if (a11)
  {
    [(BWInferenceNode *)v28 addInferenceOfType:106 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:[[BWMonocularDepthConfiguration alloc] initWithInferenceType:106 monocularDepthType:1]];
    v38 = [(BWNode *)v28 name];
    uint64_t v39 = [(NSString *)v38 length];
    v40 = @"Monocular Depth";
    if (v39) {
      v40 = [(NSString *)v38 stringByAppendingFormat:@" + %@", @"Monocular Depth"];
    }
    [(BWNode *)v28 setName:v40];
  }
  if ((objc_msgSend(v84, "connectOutput:toInput:pipelineStage:", v30, -[BWNode input](v28, "input"), a3) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_101;
  }
  uint64_t v30 = [(BWNode *)v28 output];
  if (v27)
  {
    v41 = -[BWPersonSegmentationFilteringNode initWithGPUPriority:frameRateUpsamplingEnabled:metalCommandQueue:]([BWPersonSegmentationFilteringNode alloc], "initWithGPUPriority:frameRateUpsamplingEnabled:metalCommandQueue:", 0, 1, -[FigCaptureMovieFileSinkTailPipeline _metalCommandQueueWithName:priority:](v31));
    v90.receiver = (id)v31;
    v90.super_class = (Class)FigCapturePreviewSinkPipeline;
    if ((objc_msgSendSuper2(&v90, sel_addNode_error_, v41, &v92) & 1) == 0) {
      goto LABEL_98;
    }
    -[BWPersonSegmentationFilteringNode setInputOrientationRelativeToSensor:](v41, "setInputOrientationRelativeToSensor:", (unint64_t)[v85 transform] >> 32);
    [(BWPersonSegmentationFilteringNode *)v41 setAlignsMaskWithPrimaryCaptureRect:[(BWStreamingPersonSegmentationConfiguration *)v32 cropColorInputToPrimaryCaptureRect]];
    if ((objc_msgSend(v84, "connectOutput:toInput:pipelineStage:", v30, -[BWNode input](v41, "input"), a3) & 1) == 0) {
      goto LABEL_98;
    }
    uint64_t v30 = [(BWNode *)v41 output];
  }
  v42 = a9;
  if (!v80) {
    goto LABEL_61;
  }
  v43 = [BWVideoDepthInferenceConfiguration alloc];
  int v44 = a15;
  if (a15)
  {
    [a9 isBravoVariant];
    int v44 = a15;
  }
  int v45 = v44;
  v46 = -[BWVideoDepthInferenceConfiguration initWithConcurrencyWidth:videoDepthLayout:captureDevice:requiresCroppingOfDepthBuffer:requiresVerticalFlipOfDepthBuffer:backpressureEvent:](v43, "initWithConcurrencyWidth:videoDepthLayout:captureDevice:requiresCroppingOfDepthBuffer:requiresVerticalFlipOfDepthBuffer:backpressureEvent:", 2, 1, a9);
  [(BWVideoDepthInferenceConfiguration *)v46 setRequiresAppleDepthPostProcessing:1];
  int v47 = FigVideoCaptureSourcePearlModuleType(objc_msgSend((id)objc_msgSend(v85, "sourceConfiguration"), "source"), v93);
  if (v93[0])
  {
LABEL_98:
    fig_log_get_emitter();
    goto LABEL_101;
  }
  [(BWVideoDepthInferenceConfiguration *)v46 setSourceIsNuri:v47 == 3];
  *(void *)(v31 + 272) = [[BWInferenceNode alloc] initWithConvEngineSupportWithCaptureDevice:a9 scheduler:a8 priority:6];
  v48 = [(BWInferenceConfiguration *)[BWOpticalFlowInferenceConfiguration alloc] initWithInferenceType:117];
  [(BWOpticalFlowInferenceConfiguration *)v48 setInputDimensions:[(BWVideoDepthInferenceConfiguration *)v46 outputDimensions]];
  [(BWOpticalFlowInferenceConfiguration *)v48 setOutputDimensions:[(BWVideoDepthInferenceConfiguration *)v46 outputDimensions]];
  [(BWOpticalFlowInferenceConfiguration *)v48 setConcurrencyWidth:2];
  if (v45) {
    unint64_t v49 = (unint64_t)[v85 transform] >> 32;
  }
  else {
    unint64_t v49 = 0;
  }
  [(BWOpticalFlowInferenceConfiguration *)v48 setInputRotationAngle:v49];
  [(BWOpticalFlowInferenceConfiguration *)v48 setCropColorInputToPrimaryCaptureRect:a15];
  [(BWOpticalFlowInferenceConfiguration *)v48 setAttachedMediaKeyForPropagatedColorInput:0x1EFA6A600];
  [*(id *)(v31 + 272) addInferenceOfType:117 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:v48];

  [*(id *)(v31 + 272) setName:@"Optical Flow Node"];
  v29 = v84;
  if (v72) {
    [v84 enableBypassUntilPreparedForNode:*(void *)(v31 + 272) deferredPreparePriority:2];
  }
  uint64_t v50 = *(void *)(v31 + 272);
  v89.receiver = (id)v31;
  v89.super_class = (Class)FigCapturePreviewSinkPipeline;
  if ((objc_msgSendSuper2(&v89, sel_addNode_error_, v50, &v92) & 1) == 0
    || (objc_msgSend(v84, "connectOutput:toInput:pipelineStage:", v30, objc_msgSend(*(id *)(v31 + 272), "input"), a3) & 1) == 0
    || ((uint64_t v30 = [*(id *)(v31 + 272) output], !a16) ? (v51 = 0) : (v51 = 4),
        v52 = [[BWVideoDepthNode alloc] initWithInferenceScheduler:a8 captureDevice:a9 videoDepthConfiguration:v46 extraDepthOutputRetainedBufferCount:v51 error:v93], *(void *)(v31 + 264) = v52, v93[0]))
  {
    fig_log_get_emitter();
    goto LABEL_101;
  }
  v88.receiver = (id)v31;
  v88.super_class = (Class)FigCapturePreviewSinkPipeline;
  if ((objc_msgSendSuper2(&v88, sel_addNode_error_, v52, &v92) & 1) == 0
    || (objc_msgSend(v84, "connectOutput:toInput:pipelineStage:", v30, objc_msgSend(*(id *)(v31 + 264), "input"), a3) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_101;
  }
  uint64_t v30 = [*(id *)(v31 + 264) output];
  v42 = a9;
  if (v72)
  {
    [a9 setPreviewVideoDepthNodeUnprepared:1];
    [v84 enableBypassUntilPreparedForNode:*(void *)(v31 + 264) deferredPreparePriority:2];
  }
  -[FigCapturePreviewSinkPipeline toggleDepthDensificationAccordingToFilters:](v31, objc_msgSend((id)objc_msgSend(v85, "videoPreviewSinkConfiguration"), "filters"));
LABEL_61:
  if (v83)
  {
    v53 = [[BWInferenceNode alloc] initWithConvEngineSupportWithCaptureDevice:v42 scheduler:a8 priority:6];
    [(BWNode *)v53 setName:@"Segmentation Node (secondary)"];
    if (v72) {
      [v29 enableBypassUntilPreparedForNode:v53 deferredPreparePriority:2];
    }
    v87.receiver = (id)v31;
    v87.super_class = (Class)FigCapturePreviewSinkPipeline;
    if ((objc_msgSendSuper2(&v87, sel_addNode_error_, v53, &v92) & 1) == 0
      || (*(void *)(v31 + 120) = v53,
          (objc_msgSend(v29, "connectOutput:toInput:pipelineStage:", v30, -[BWNode input](v53, "input"), a3) & 1) == 0))
    {
      fig_log_get_emitter();
      goto LABEL_101;
    }
    uint64_t v30 = [(BWNode *)v53 output];
    v54 = [(BWInferenceConfiguration *)[BWStreamingPersonSegmentationConfiguration alloc] initWithInferenceType:105];
    unint64_t v55 = (unint64_t)[v85 transform] >> 32;
    if ([v85 transform]) {
      uint64_t v56 = -(int)v55;
    }
    else {
      uint64_t v56 = v55;
    }
    [(BWStreamingPersonSegmentationConfiguration *)v54 setInputRotationAngle:v56];
    [(BWStreamingPersonSegmentationConfiguration *)v54 setCropColorInputToPrimaryCaptureRect:1];
    [(BWStreamingPersonSegmentationConfiguration *)v54 setAlternativeStreamingPersonSegmentationMaskKey:0x1EFA74480];
    [(BWStreamingPersonSegmentationConfiguration *)v54 setAlternativeStreamingSkinSegmentationMaskKey:0x1EFA744C0];
    [(BWInferenceNode *)v53 addInferenceOfType:105 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:v54];
    -[FigCapturePreviewSinkPipeline _setPortraitRenderingInferencesNeededForFilters:](v31, v79);
  }
  uint64_t v57 = v30;
  if (a15)
  {
    char v58 = [v85 transform] & 1;
    unint64_t v59 = (unint64_t)[v85 transform] >> 32;
  }
  else
  {
    char v58 = 0;
    LODWORD(v59) = 0;
  }
  v60 = [BWStreamingFilterNode alloc];
  uint64_t v61 = *(unsigned __int8 *)(v31 + 236);
  uint64_t v62 = *(unsigned __int8 *)(v31 + 257);
  LODWORD(v68) = v59;
  BYTE4(v67) = v58;
  LODWORD(v67) = [(BWPipelineStage *)v82 priority];
  LOBYTE(v66) = a15;
  v63 = -[BWStreamingFilterNode initWithCaptureDevice:maxLossyCompressionLevel:semanticStyleRenderingEnabled:cinematicVideoEnabled:smartStyleRenderingEnabled:portraitPreviewForegroundBlurEnabled:depthFilterRenderingIsAfterPreviewStitcher:metalCommandQueue:priority:mirroredForMetadataAdjustment:rotationDegreesForMetadataAdjustment:](v60, "initWithCaptureDevice:maxLossyCompressionLevel:semanticStyleRenderingEnabled:cinematicVideoEnabled:smartStyleRenderingEnabled:portraitPreviewForegroundBlurEnabled:depthFilterRenderingIsAfterPreviewStitcher:metalCommandQueue:priority:mirroredForMetadataAdjustment:rotationDegreesForMetadataAdjustment:", a9, a12, v81, v61, v62, v80, v66, a14, v67, v68);
  v86.receiver = (id)v31;
  v86.super_class = (Class)FigCapturePreviewSinkPipeline;
  if ((objc_msgSendSuper2(&v86, sel_addNode_error_, v63, &v92) & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v20 = v70;
    uint64_t v30 = v57;
    goto LABEL_88;
  }
  *(void *)(v31 + 72) = v63;
  v20 = v70;
  uint64_t v30 = v57;
  if (*(unsigned char *)(v31 + 288))
  {
    [(BWStreamingFilterNode *)v63 setMetadataProcessingEnabled:1];
    -[BWStreamingFilterNode setStudioAndContourRenderingEnabled:](v63, "setStudioAndContourRenderingEnabled:", [v71 isStudioAndContourPreviewRenderingSupported]);
    -[BWStreamingFilterNode setStageRenderingEnabled:](v63, "setStageRenderingEnabled:", [v71 isStagePreviewRenderingSupported]);
    [(BWStreamingFilterNode *)v63 setFocusBlurMapDeliveryEnabled:a10];
    [(BWStreamingFilterNode *)v63 setDepthFromMonocularNetworkEnabled:a11];
    [(BWStreamingFilterNode *)v63 setPortraitAutoSuggestEnabled:a16];
  }
  [(BWStreamingFilterNode *)v63 setPrimaryStreamingPersonSegmentationEnabled:v76];
  [(BWStreamingFilterNode *)v63 setSecondaryStreamingPersonSegmentationEnabled:v83];
  [(BWStreamingFilterNode *)v63 setStreamingSegmentationFromInferenceEngine:1];
  BOOL v64 = a5;
  if (a5) {
    BOOL v64 = *(unsigned __int8 *)(a5 + 171) != 0;
  }
  if (v64 | v81 ^ 1) {
    v65 = 0;
  }
  else {
    v65 = v77;
  }
  if ([v79 count] || v65) {
    [(BWStreamingFilterNode *)v63 changeToFilters:v79 semanticStyle:v65 animated:0];
  }
  if ([v79 count])
  {
    objc_msgSend((id)objc_msgSend(v85, "videoPreviewSinkConfiguration"), "simulatedAperture");
    -[BWStreamingFilterNode setSimulatedAperture:](v63, "setSimulatedAperture:");
    objc_msgSend((id)objc_msgSend(v85, "videoPreviewSinkConfiguration"), "portraitLightingEffectStrength");
    -[BWStreamingFilterNode setPortraitLightingEffectStrength:](v63, "setPortraitLightingEffectStrength:");
  }
  [(BWStreamingFilterNode *)v63 setDepthDataDeliveryEnabled:v74];
  [(BWStreamingFilterNode *)v63 setAttachesInputPixelBufferAfterRendering:0];
  if ((objc_msgSend(v84, "connectOutput:toInput:pipelineStage:", v57, -[BWNode input](v63, "input"), v82) & 1) == 0)
  {
    fig_log_get_emitter();
LABEL_101:
    FigDebugAssert3();
    goto LABEL_88;
  }
  uint64_t v30 = [(BWNode *)v63 output];
LABEL_88:
  if (v20) {
    uint64_t *v20 = v30;
  }
  return v93[0];
}

- (uint64_t)_setPortraitRenderingInferencesNeededForFilters:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    int v3 = BWCIFilterArrayContainsFiltersRequiringSegmentation(a2);
    v4 = *(void **)(v2 + 120);
    if (v3) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1EFB00CF8];
    }
    [v4 setInferencesToSkip:v5];
    v6 = *(void **)(v2 + 144);
    return [v6 setSkipProcessing:v3 ^ 1u];
  }
  return result;
}

- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4
{
  if (!self->_smartStyleRenderingEnabled)
  {
    BOOL v4 = a4;
    if ([a3 isIdentity]) {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EFB00CF8, &unk_1EFB00CE0, 0);
    }
    else {
      uint64_t v7 = 0;
    }
    [(BWInferenceNode *)self->_semanticStylePersonSegmentationNode setInferencesToSkip:v7];
    filterNode = self->_filterNode;
    [(BWStreamingFilterNode *)filterNode changeToSemanticStyle:a3 animated:v4];
  }
}

- (id)_buildImageQueuePreviewSinkPipeline:(BWPipelineStage *)a3 previewPipelineStage:(void *)a4 videoPreviewSinkConnectionConfiguration:(int)a5 previewScalerOutputBuffersAreShared:(int)a6 zoomPIPOverlayEnabled:(uint64_t)a7 zoomPIPSmartStyleRenderingEnabled:(uint64_t)a8 zoomPIPSlaveStreamingEnabled:(float)a9 zoomPIPSlaveStreamingFrameRate:(unsigned __int8)a10 debugOverlayEnabled:(char)a11 deferredPrepareEnabled:(unsigned __int8)a12 parallelGraphRebuildEnabled:(uint64_t)a13 transform:(uint64_t)a14 remoteVideoPreview:(unsigned __int8)a15 maxLossyCompressionLevel:(unsigned int)a16 clientAuditToken:(_OWORD *)a17 graph:(void *)a18 captureDevice:(void *)a19 previewTapDelegate:(uint64_t)a20 videoHDRImageStatisticsEnabled:(unsigned __int8)a21 zoomPIPOverlayDelegate:(uint64_t)a22 metalCommandQueue:(uint64_t)a23
{
  if (result)
  {
    v29 = result;
    uint64_t v30 = a3;
    v79[0] = 0;
    if (a6) {
      uint64_t v30 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.preview.zoomPIP" priority:6];
    }
    if ((a6 | a10) == 1 && a5)
    {
      uint64_t v31 = objc_alloc_init(BWPixelTransferNode);
      v32 = v31;
      if (a6) {
        double v33 = @"Zoom PIP Overlay Buffer Copier";
      }
      else {
        double v33 = @"Debug Overlay Buffer Copier";
      }
      [(BWNode *)v31 setName:v33];
      if (a6)
      {
        [(BWPixelTransferNode *)v32 setMaxInputLossyCompressionLevel:a16];
        [(BWPixelTransferNode *)v32 setMaxOutputLossyCompressionLevel:a16];
      }
      v78.receiver = v29;
      v78.super_class = (Class)FigCapturePreviewSinkPipeline;
      if ((objc_msgSendSuper2(&v78, sel_addNode_error_, v32, v79) & 1) == 0
        || (objc_msgSend(a18, "connectOutput:toInput:pipelineStage:", a2, -[BWNode input](v32, "input"), v30) & 1) == 0)
      {
        fig_log_get_emitter();
        goto LABEL_75;
      }
      a2 = [(BWNode *)v32 output];
    }
    int v72 = a3;
    if (a6)
    {
      v34 = [BWVideoPIPOverlayNode alloc];
      uint64_t v35 = [a19 isBravoVariant];
      uint64_t v36 = [a19 baseZoomFactorsByPortType];
      *(float *)&double v37 = a9;
      v38 = [(BWVideoPIPOverlayNode *)v34 initWithDelegate:a22 metalCommandQueue:a23 secondaryCameraStreamingEnabled:a8 secondaryCameraFrameRate:a16 maxLossyCompressionLevel:v35 isDeviceBravoVariant:v36 baseZoomFactorsByPortType:v37];
      [(BWNode *)v38 setName:@"PIP Overlay"];
      if (a11) {
        [a18 enableBypassUntilPreparedForNode:v38 deferredPreparePriority:3];
      }
      v77.receiver = v29;
      v77.super_class = (Class)FigCapturePreviewSinkPipeline;
      if ((objc_msgSendSuper2(&v77, sel_addNode_error_, v38, v79) & 1) == 0
        || (uint64_t v39 = v38,
            v29[11] = v39,
            [(BWVideoPIPOverlayNode *)v39 setSmartStyleRenderingEnabled:a7],
            (objc_msgSend(a18, "connectOutput:toInput:pipelineStage:", a2, -[BWNode input](v38, "input"), v30) & 1) == 0))
      {
        fig_log_get_emitter();
        goto LABEL_75;
      }
      a2 = [(BWNode *)v38 output];
    }
    v40 = a4;
    v41 = (void *)[a4 sourceConfiguration];
    if ((int)FigCapturePlatformIdentifier() <= 4)
    {
      unsigned int v43 = [v41 sourceDeviceType];
      if (v43 > 9)
      {
        unsigned int v71 = 0;
        goto LABEL_26;
      }
      unsigned int v42 = (0x310u >> v43) & 1;
    }
    else
    {
      unsigned int v42 = 1;
    }
    unsigned int v71 = v42;
LABEL_26:
    id v44 = v29[7];
    if (v44)
    {
      [v29[7] setPreviewTapDelegate:a20];
      int v45 = (BWImageQueueSinkNode *)v29[7];
    }
    else
    {
      v46 = [BWImageQueueSinkNode alloc];
      uint64_t v47 = [v29 sinkID];
      long long v48 = a17[1];
      v40 = a4;
      v76[0] = *a17;
      v76[1] = v48;
      int v45 = [(BWImageQueueSinkNode *)v46 initWithHFRSupport:1 ispJitterCompensationEnabled:v71 clientAuditToken:v76 sinkID:v47];
      [(BWImageQueueSinkNode *)v45 setPreviewTapDelegate:a20];
      v29[7] = v45;
    }
    [(BWImageQueueSinkNode *)v45 setCaptureDevice:a19];
    objc_msgSend(v29[7], "setTransform:", a13, a14);
    [v29[7] setVideoHDRImageStatisticsEnabled:a21];
    if (*((unsigned char *)v29 + 237)) {
      uint64_t v49 = 1;
    }
    else {
      uint64_t v49 = objc_msgSend((id)objc_msgSend(v40, "videoPreviewSinkConfiguration"), "primaryCaptureRectModificationEnabled");
    }
    id v50 = v29[7];
    uint64_t v51 = (void *)[v40 sourceConfiguration];
    objc_msgSend((id)objc_msgSend(v51, "requiredFormat"), "maxSupportedFrameRate");
    float v53 = v52;
    [v51 requiredMinFrameRate];
    float v55 = v54;
    [v51 requiredMaxFrameRate];
    float v57 = v56;
    int v58 = BWGetMaximumDisplayFrequency();
    int v59 = v58;
    BOOL v60 = v57 == v55 && fmod(v57, (double)v58) == 0.0;
    [v50 setFenceSupportEnabled:v49];
    [v50 setMaxLossyCompressionLevel:a16];
    if (objc_msgSend((id)objc_msgSend(v51, "requiredFormat"), "previewImageQueueSyncStrategy"))
    {
      uint64_t v61 = objc_msgSend((id)objc_msgSend(v51, "requiredFormat"), "previewImageQueueSyncStrategy");
    }
    else if (v71 && (v53 <= (float)v59 ? (char v62 = 1) : (char v62 = v60), (v62 & 1) != 0))
    {
      uint64_t v61 = 3;
    }
    else if (v53 <= 30.0)
    {
      uint64_t v61 = 1;
    }
    else
    {
      uint64_t v61 = 2;
    }
    [v50 setSyncStrategy:v61];
    id v63 = v29[7];
    v75.receiver = v29;
    v75.super_class = (Class)FigCapturePreviewSinkPipeline;
    if (objc_msgSendSuper2(&v75, sel_addNode_error_, v63, v79))
    {
      uint64_t v64 = v44 ? a12 : 0;
      if (objc_msgSend(a18, "connectOutput:toInput:pipelineStage:deferredAttach:", a2, objc_msgSend(v29[7], "input"), v72, v64))
      {
        if (a11) {
          [a18 enableDeferredPrepareForNodesNotInPathOfSinkNode:v29[7]];
        }
        if (!v44 || !v29[23])
        {
          uint64_t v65 = [v29[19] rotationDegrees];
          if (!v65) {
            uint64_t v65 = [v29[6] rotationDegrees];
          }
          int v66 = [a19 position];
          int v67 = FigCaptureCameraRequires180DegreesRotation(v66 == 2, [a19 isExternalVariant]);
          [a19 isExternalVariant];
          [a19 clientExpectsCameraMountedInLandscapeOrientation];
          if (FigCapturePlatformMountsCamerasInLandscapeOrientation())
          {
            if ([v40 mirroringEnabled]
              && (([a19 isExternalVariant] | v67) & 1) != 0
              || ([v40 mirroringEnabled] & 1) == 0
              && ((int v68 = [a19 isExternalVariant], v66 != 2) ? (v69 = 1) : (v69 = v68),
                  ((v69 | v67) & 1) == 0))
            {
              uint64_t v65 = FigCaptureNormalizeAngle((int)v65 + 180);
            }
          }
          [v40 transform];
          -[FigCapturePreviewSinkPipeline _stashPreviewImageQueueUpdatedNotificationPayload:previewDimensions:remoteVideoPreview:](v29, v65, v70, a15);
        }
        goto LABEL_67;
      }
    }
    fig_log_get_emitter();
LABEL_75:
    FigDebugAssert3();
LABEL_67:
    result = (id *)v79[0];
    if (v79[0]) {
      return (id *)[v79[0] code];
    }
  }
  return result;
}

- (id)_stashPreviewImageQueueUpdatedNotificationPayload:(unint64_t)a3 previewDimensions:(int)a4 remoteVideoPreview:
{
  v19[5] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = [result[7] imageQueueSlot];
    if (v8)
    {
      uint64_t v9 = v8;
      if (a4)
      {
        v18[0] = @"SectionID";
        v19[0] = [v7 sinkID];
        v18[1] = @"ImageQueueSlot";
        v19[1] = [NSNumber numberWithUnsignedInt:v9];
        v18[2] = @"RotationDegrees";
        v19[2] = [NSNumber numberWithInt:a2];
        v18[3] = @"ImageQueueWidth";
        v19[3] = [NSNumber numberWithInt:a3];
        v18[4] = @"ImageQueueHeight";
        v19[4] = [NSNumber numberWithInt:HIDWORD(a3)];
        v10 = (void *)MEMORY[0x1E4F1C9E8];
        v11 = v19;
        v12 = v18;
        uint64_t v13 = 5;
      }
      else
      {
        uint64_t v15 = [v7[7] imageQueue];
        v16[0] = @"SectionID";
        v17[0] = [v7 sinkID];
        v16[1] = @"ImageQueueSlot";
        v17[1] = [NSNumber numberWithUnsignedInt:v9];
        v17[2] = v15;
        v16[2] = @"ImageQueue";
        v16[3] = @"RotationDegrees";
        v17[3] = [NSNumber numberWithInt:a2];
        v16[4] = @"ImageQueueWidth";
        v17[4] = [NSNumber numberWithInt:a3];
        v16[5] = @"ImageQueueHeight";
        v17[5] = [NSNumber numberWithInt:HIDWORD(a3)];
        v10 = (void *)MEMORY[0x1E4F1C9E8];
        v11 = v17;
        v12 = v16;
        uint64_t v13 = 6;
      }
      v14 = (void *)[v10 dictionaryWithObjects:v11 forKeys:v12 count:v13];
    }
    else
    {
      v14 = 0;
    }
    result = v14;
    v7[23] = result;
  }
  return result;
}

- (BWImageQueueSinkNode)imageQueueSinkNode
{
  return self->_imageQueueSinkNode;
}

- (BOOL)depthFilterRenderingEnabled
{
  return self->_depthFilterRenderingEnabled;
}

- (void)prepareForRenderingWithPreparedPixelBufferPool
{
}

- (uint64_t)_buildVideoPreviewSinkPipeline:(uint64_t)a3 sourcePreviewOutput:(void *)a4 graph:(uint64_t)a5 inferenceScheduler:(void *)a6 captureDevice:(uint64_t)a7 previewTapDelegate:(uint64_t)a8 zoomPIPOverlayDelegate:
{
  v252[1] = *(BWSceneClassifierSinkNode **)MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v10 = result;
  unsigned int v248 = 0;
  id v247 = 0;
  v246 = (BWNodeOutput *)a3;
  if (a2)
  {
    int v11 = [*(id *)(a2 + 8) previewFilterRenderingEnabled];
    LODWORD(v205) = *(unsigned char *)(a2 + 169) != 0;
    BOOL v12 = *(unsigned char *)(a2 + 170) != 0;
    uint64_t v13 = *(void **)(a2 + 8);
  }
  else
  {
    int v11 = [0 previewFilterRenderingEnabled];
    BOOL v12 = 0;
    LODWORD(v205) = 0;
    uint64_t v13 = 0;
  }
  *(unsigned char *)(v10 + 288) = [v13 previewDepthFilterRenderingEnabled];
  uint64_t v223 = v10;
  if (a2)
  {
    *(unsigned char *)(v10 + 236) = *(unsigned char *)(a2 + 148);
    v14 = *(void **)(a2 + 8);
    if (v14)
    {
      uint64_t v15 = objc_msgSend((id)objc_msgSend(v14, "sourceConfiguration"), "requiredFormat");
      int v16 = objc_msgSend((id)objc_msgSend((id)FigCaptureDeviceCoreRepairStatusesByKeys(), "objectForKeyedSubscript:", @"FrontCameraAssembly"), "intValue");
      if (([v15 isPhotoFormat] & 1) == 0 && ((v11 ^ 1) & 1) == 0 && (v16 & 0xFFFFFFFE) == 2) {
        int v11 = 0;
      }
      [v15 maxContinuousZoomFactorForDepthDataDelivery];
      if (v17 == 0.0) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = [*(id *)(a2 + 8) previewDepthDataDeliveryEnabled];
      }
      unsigned __int8 v207 = [*(id *)(a2 + 8) portraitAutoSuggestEnabled];
      int v208 = v11;
      if ((v207 & 1) != 0 || *(unsigned char *)(v10 + 288))
      {
        uint64_t v19 = v18;
      }
      else
      {
        unsigned __int8 v207 = 0;
        uint64_t v19 = 0;
      }
    }
    else
    {
      unsigned __int8 v207 = 0;
      int v208 = v11;
      uint64_t v19 = 0;
      LODWORD(v18) = 0;
    }
    if (*(unsigned char *)(v10 + 288)) {
      BOOL v20 = v19;
    }
    else {
      BOOL v20 = 1;
    }
    uint64_t v21 = *(void **)(a2 + 8);
  }
  else
  {
    unsigned __int8 v207 = 0;
    int v208 = v11;
    LODWORD(v18) = 0;
    uint64_t v19 = 0;
    uint64_t v21 = 0;
    *(unsigned char *)(v10 + 236) = 0;
    BOOL v20 = *(unsigned char *)(v10 + 288) == 0;
  }
  unsigned int v213 = objc_msgSend((id)objc_msgSend(v21, "videoPreviewSinkConfiguration"), "zoomPIPOverlayEnabled");
  if ((v208 & 1) != 0 || *(unsigned char *)(v10 + 288))
  {
    BOOL v22 = 1;
    if (!a2)
    {
LABEL_32:
      BOOL v215 = 0;
      goto LABEL_33;
    }
  }
  else
  {
    if (!a2)
    {
      BOOL v22 = 0;
      goto LABEL_32;
    }
    BOOL v22 = *(unsigned char *)(a2 + 171) != 0;
  }
  if (!*(void *)(a2 + 40)) {
    goto LABEL_32;
  }
  BOOL v215 = *(unsigned char *)(a2 + 112) != 0;
LABEL_33:
  unsigned int v23 = (void *)[MEMORY[0x1E4F55F60] metalDevice];
  if (!v23
    || (id v217 = (id)[v23 newCommandQueue]) == 0
    || (v200 = v18, (uint64_t v24 = -[FigCapturePreviewSinkPipeline _metalSubmissionAndCompletionQueue](v10)) == 0))
  {
    fig_log_get_emitter();
    goto LABEL_353;
  }
  uint64_t v25 = v24;
  [v217 setCompletionQueue:v24];
  [v217 setSubmissionQueue:v25];
  [(id)v10 setUpstreamOutput:a3];
  v26 = (void *)[MEMORY[0x1E4F1CA48] array];
  unsigned int v27 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (a2)
  {
    if (*(void *)(a2 + 8)) {
      objc_msgSend(v26, "addObject:");
    }
    if (*(void *)(a2 + 40))
    {
      if (v22 && !v215) {
        v28 = v27;
      }
      else {
        v28 = v26;
      }
      objc_msgSend(v28, "addObject:");
    }
    if (*(void *)(a2 + 16)) {
      BOOL v29 = v20;
    }
    else {
      BOOL v29 = 0;
    }
    if (v29) {
      objc_msgSend(v26, "addObject:");
    }
    if (*(void *)(a2 + 24)) {
      objc_msgSend(v26, "addObject:");
    }
    if (*(void *)(a2 + 32)) {
      objc_msgSend(v26, "addObject:");
    }
    if (*(void *)(a2 + 192))
    {
      if (v22) {
        uint64_t v30 = v27;
      }
      else {
        uint64_t v30 = v26;
      }
      objc_msgSend(v30, "addObject:");
    }
    if (*(void *)(a2 + 48)) {
      objc_msgSend(v26, "addObject:");
    }
  }
  if ([v26 count]) {
    uint64_t v31 = v26;
  }
  else {
    uint64_t v31 = v27;
  }
  if (![v31 count])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    unsigned int v248 = FigSignalErrorAt();
    goto LABEL_347;
  }
  *(void *)(v10 + 224) = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v31, "firstObject"), "sourceConfiguration"), "sourceID");
  *(_DWORD *)(v10 + 232) = objc_msgSend((id)objc_msgSend(v31, "firstObject"), "underlyingDeviceType");
  v219 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.preview", objc_msgSend((id)objc_msgSend(v31, "firstObject"), "sourceConfiguration")), 6);
  v209 = v31;
  if (a2) {
    v32 = *(void **)(a2 + 56);
  }
  else {
    v32 = 0;
  }
  v220 = v26;
  if ((objc_msgSend((id)objc_msgSend(v32, "irisSinkConfiguration"), "irisFrameHarvestingEnabled") & 1) != 0
    || a2 && *(unsigned char *)(a2 + 174) && !*(unsigned char *)(a2 + 173))
  {
    double v33 = objc_alloc_init(BWFrameRateGovernorNode);
    [(BWNode *)v33 setName:@"Preview Governor"];
    if (a2)
    {
      -[BWFrameRateGovernorNode setDropsStillBracketFramesToMaintainConsistentFrameRate:](v33, "setDropsStillBracketFramesToMaintainConsistentFrameRate:", objc_msgSend((id)objc_msgSend(*(id *)(a2 + 56), "irisSinkConfiguration"), "irisFrameHarvestingEnabled"));
      if (*(unsigned char *)(a2 + 174) && !*(unsigned char *)(a2 + 173))
      {
        [(BWFrameRateGovernorNode *)v33 setDropsStartupFramesWithUnstableAE:1];
        [(BWFrameRateGovernorNode *)v33 setAeStabilityTuning:1];
      }
    }
    else
    {
      -[BWFrameRateGovernorNode setDropsStillBracketFramesToMaintainConsistentFrameRate:](v33, "setDropsStillBracketFramesToMaintainConsistentFrameRate:", objc_msgSend((id)objc_msgSend(0, "irisSinkConfiguration"), "irisFrameHarvestingEnabled"));
    }
    v245.receiver = (id)v10;
    v245.super_class = (Class)FigCapturePreviewSinkPipeline;
    if ((objc_msgSendSuper2(&v245, sel_addNode_error_, v33, &v247) & 1) == 0
      || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v246, -[BWNode input](v33, "input"), 0) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_353;
    }
    v246 = [(BWNode *)v33 output];
  }
  if ([v27 count])
  {
    v34 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", [v27 count] + 1, 1986618469);
    [(BWNode *)v34 setName:@"Preview Pre-Filter Splitter"];
    v244.receiver = (id)v10;
    v244.super_class = (Class)FigCapturePreviewSinkPipeline;
    if ((objc_msgSendSuper2(&v244, sel_addNode_error_, v34, &v247) & 1) == 0
      || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v246, -[BWNode input](v34, "input"), v219) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_353;
    }
    v246 = [(NSArray *)[(BWNode *)v34 outputs] objectAtIndexedSubscript:0];
    v218 = [(BWNode *)v34 outputs];
    if (a2) {
      goto LABEL_81;
    }
LABEL_95:
    uint64_t v35 = 0;
    goto LABEL_82;
  }
  v218 = 0;
  if (!a2) {
    goto LABEL_95;
  }
LABEL_81:
  uint64_t v35 = *(void **)(a2 + 8);
LABEL_82:
  v197 = (void *)[v35 sourceConfiguration];
  uint64_t v36 = [v197 requiredFormat];
  BOOL v204 = v20;
  id obj = v27;
  v202 = (void *)v36;
  if (!a2)
  {
    if (v20)
    {
      int v210 = 0;
      unsigned int v199 = 0;
      v41 = a6;
      LOBYTE(v39) = 1;
      if (!v12) {
        goto LABEL_131;
      }
      goto LABEL_125;
    }
    unsigned int v55 = 0;
    unsigned __int8 v53 = 0;
    unsigned int v199 = 0;
    int v210 = 0;
    float v52 = 0;
    unsigned __int8 v54 = 0;
    unsigned __int8 v56 = 0;
    v41 = a6;
    LOBYTE(v39) = 1;
    goto LABEL_123;
  }
  double v37 = (void *)v36;
  if (*(unsigned char *)(a2 + 115)) {
    goto LABEL_84;
  }
  if (!*(unsigned char *)(a2 + 116))
  {
    int v210 = 0;
LABEL_101:
    int v39 = 1;
    goto LABEL_102;
  }
  if (*(unsigned char *)(a2 + 78)
    && (objc_msgSend((id)objc_msgSend(*(id *)(a2 + 56), "irisSinkConfiguration"), "irisMovieCaptureEnabled") & 1) != 0)
  {
LABEL_84:
    BOOL v38 = 1;
  }
  else
  {
    BOOL v38 = *(unsigned char *)(a2 + 128) != 0;
  }
  int v39 = !v38;
  int v210 = 1;
  if (v38 && *(unsigned char *)(a2 + 128))
  {
    if ([a6 position] != 2
      || [v37 dimensions] != 3840
      || (unint64_t)[v37 dimensions] >> 32 != 2160)
    {
      LOBYTE(v39) = 0;
      unsigned int v199 = 1;
      goto LABEL_93;
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a2 + 8), "sourceConfiguration"), "requiredMaxFrameRate");
    if (v40 < 60.0)
    {
      unsigned int v199 = 1;
      LOBYTE(v39) = 0;
LABEL_93:
      int v210 = 1;
LABEL_110:
      v41 = a6;
      goto LABEL_111;
    }
    int v210 = 1;
    goto LABEL_101;
  }
LABEL_102:
  unsigned int v199 = v39 ^ 1;
  if (((v39 ^ 1) & 1) != 0 || !*(unsigned char *)(a2 + 171)) {
    goto LABEL_110;
  }
  v41 = a6;
  if (!*(unsigned char *)(v10 + 236))
  {
    unsigned int v42 = [[BWSmartStyleApplyNode alloc] initWithMetalCommandQueue:v217 renderingMethod:*(unsigned int *)(a2 + 188)];
    if (!v42)
    {
      fig_log_get_emitter();
      goto LABEL_248;
    }
    unsigned int v43 = v42;
    [(BWNode *)v42 setName:@"SmartStyle Preview Apply"];
    [(BWSmartStyleApplyNode *)v43 setMaxLossyCompressionLevel:*(unsigned int *)(a2 + 152)];
    v243.receiver = (id)v10;
    v243.super_class = (Class)FigCapturePreviewSinkPipeline;
    if ((objc_msgSendSuper2(&v243, sel_addNode_error_, v43, &v247) & 1) == 0
      || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v246, -[BWNode input](v43, "input"), v219) & 1) == 0)
    {
      goto LABEL_222;
    }
    v246 = [(BWNode *)v43 output];
  }
  LOBYTE(v39) = 1;
  *(unsigned char *)(v10 + 257) = 1;
LABEL_111:
  if (*(unsigned char *)(a2 + 184))
  {
    uint64_t v44 = FigVideoCaptureSourcePearlModuleType(objc_msgSend((id)objc_msgSend(*(id *)(a2 + 8), "sourceConfiguration"), "source"), &v248);
    if (!v248)
    {
      uint64_t v45 = v44;
      v46 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.previewfacetracking", objc_msgSend((id)objc_msgSend(v209, "firstObject"), "sourceConfiguration")), -[BWPipelineStage priority](v219, "priority"));
      uint64_t v47 = [[BWFaceTrackingNode alloc] initWithFigThreadPriority:[(BWPipelineStage *)v46 priority] pearlModuleType:v45 useUnfilteredDepth:0 queueDepth:0 passthroughInputs:1 allowPixelTransfer:1];
      if (!v47)
      {
        fig_log_get_emitter();
        goto LABEL_248;
      }
      long long v48 = v47;
      [(BWNode *)v47 setName:@"Face Tracking"];
      v242.receiver = (id)v10;
      v242.super_class = (Class)FigCapturePreviewSinkPipeline;
      if ((objc_msgSendSuper2(&v242, sel_addNode_error_, v48, &v247) & 1) == 0
        || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v246, -[BWNode input](v48, "input"), v46) & 1) == 0)
      {
        fig_log_get_emitter();
        goto LABEL_353;
      }
      uint64_t v49 = v48;
      *(void *)(v10 + 144) = v49;
      v246 = [(BWNode *)v49 output];
      [*(id *)(v10 + 144) setFrontCamera:0];
      [*(id *)(v10 + 144) setMirrored:0];
      [*(id *)(v10 + 144) setOrientation:0];
      [*(id *)(v10 + 144) setMaxFaces:1];
      [*(id *)(v10 + 144) setUsesFaceRecognition:0];
      [*(id *)(v10 + 144) setFaceTrackingPlusEnabled:0];
      [*(id *)(v10 + 144) setNetworkFailureThresholdMultiplier:0.0];
      LODWORD(v50) = -1.0;
      [*(id *)(v10 + 144) setTrackingFailureFieldOfViewModifier:v50];
      goto LABEL_117;
    }
LABEL_222:
    fig_log_get_emitter();
    goto LABEL_353;
  }
LABEL_117:
  if (v20) {
    goto LABEL_124;
  }
  if (*(void *)(a2 + 16))
  {
    uint64_t v51 = [[BWFanOutNode alloc] initWithFanOutCount:2 mediaType:1986618469];
    v241.receiver = (id)v10;
    v241.super_class = (Class)FigCapturePreviewSinkPipeline;
    if ((objc_msgSendSuper2(&v241, sel_addNode_error_, v51, &v247) & 1) == 0
      || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v246, -[BWNode input](v51, "input"), 0) & 1) == 0)
    {
      goto LABEL_229;
    }
    v246 = [(NSArray *)[(BWNode *)v51 outputs] objectAtIndexedSubscript:0];
    *(void *)(v10 + 168) = [(NSArray *)[(BWNode *)v51 outputs] objectAtIndexedSubscript:1];
  }
  float v52 = *(void **)(a2 + 8);
  unsigned __int8 v53 = *(unsigned char *)(a2 + 144) != 0;
  unsigned __int8 v54 = *(unsigned char *)(a2 + 145) != 0;
  unsigned int v55 = *(_DWORD *)(a2 + 152);
  unsigned __int8 v56 = *(unsigned char *)(a2 + 113) != 0;
LABEL_123:
  unsigned int v248 = -[FigCapturePreviewSinkPipeline _appendFilteredPreviewPipeline:desiredPipelineStage:desiredStreamingFilterPipelineStage:previewSinkPipelineConfiguration:videoPreviewSinkConnectionConfiguration:graph:inferenceScheduler:captureDevice:focusBlurMapForDepthFiltersEnabled:depthFromMonocularNetworkEnabled:maxLossyCompressionLevel:deferredPrepareEnabled:metalCommandQueue:depthFilterRenderingIsAfterPreviewStitcher:portraitAutoSuggestEnabled:](v10, (uint64_t *)&v246, 0, 0, a2, v52, a4, a5, v41, v53, v54, v55, v56, (uint64_t)v217, v19, v207);
  if (v248)
  {
LABEL_229:
    fig_log_get_emitter();
    goto LABEL_353;
  }
LABEL_124:
  if (!v12) {
    goto LABEL_131;
  }
LABEL_125:
  [(BWPipelineStage *)v219 priority];
  id v57 = -[FigCaptureMovieFileSinkTailPipeline _metalCommandQueueWithName:priority:](v10);
  int v58 = [BWPocketDetectionNode alloc];
  if (a2) {
    uint64_t v59 = *(void *)(a2 + 176);
  }
  else {
    uint64_t v59 = 0;
  }
  BOOL v60 = [(BWPocketDetectionNode *)v58 initWithMetalCommandQueue:v57 clientApplicationID:v59];
  if (!v60)
  {
    fig_log_get_emitter();
    goto LABEL_248;
  }
  uint64_t v61 = v60;
  [(BWNode *)v60 setName:@"Pocket Detection"];
  v240.receiver = (id)v10;
  v240.super_class = (Class)FigCapturePreviewSinkPipeline;
  if ((objc_msgSendSuper2(&v240, sel_addNode_error_, v61, &v247) & 1) == 0
    || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v246, -[BWNode input](v61, "input"), v219) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_353;
  }
  *(void *)(v10 + 136) = v61;
  v246 = [(BWNode *)v61 output];
LABEL_131:
  if (v205)
  {
    if (a2)
    {
      char v62 = v39;
      if (*(unsigned char *)(a2 + 115)) {
        BOOL v63 = 1;
      }
      else {
        BOOL v63 = *(unsigned char *)(a2 + 116) != 0;
      }
    }
    else
    {
      char v62 = v39;
      BOOL v63 = 0;
    }
    uint64_t v64 = -[BWPreviewStabilizationNode initWithCameraInfoByPortType:forStillImagePreview:updateFinalCropRectWithStabilizationShift:]([BWPreviewStabilizationNode alloc], "initWithCameraInfoByPortType:forStillImagePreview:updateFinalCropRectWithStabilizationShift:", [v41 cameraInfoByPortType], objc_msgSend(v41, "autoImageControlMode") == 0, !v63);
    if (!v64)
    {
      fig_log_get_emitter();
      goto LABEL_248;
    }
    uint64_t v65 = v64;
    [(BWNode *)v64 setName:@"Preview Stabilization"];
    v239.receiver = (id)v10;
    v239.super_class = (Class)FigCapturePreviewSinkPipeline;
    if ((objc_msgSendSuper2(&v239, sel_addNode_error_, v65, &v247) & 1) == 0
      || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v246, -[BWNode input](v65, "input"), v219) & 1) == 0)
    {
      goto LABEL_242;
    }
    *(void *)(v10 + 128) = v65;
    v246 = [(BWNode *)v65 output];
    LOBYTE(v39) = v62;
  }
  int v66 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
  unsigned __int8 v206 = v19;
  if (!v210) {
    goto LABEL_195;
  }
  char v196 = v39;
  if (a2)
  {
    int v67 = (void *)[*(id *)(a2 + 8) videoPreviewSinkConfiguration];
    int v68 = *(_DWORD *)(a2 + 160);
    int v69 = *(unsigned __int8 *)(a2 + 157);
    BOOL v70 = *(unsigned char *)(a2 + 157) != 0;
    if (*(unsigned char *)(a2 + 115))
    {
      uint64_t v71 = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 8), "sourceConfiguration"), "source");
      uint64_t v193 = *MEMORY[0x1E4F52DD8];
      int v72 = (void *)FigVideoCaptureSourceCopyUnderlyingSourceFormatForFormatAndPortType(v71, v202, *MEMORY[0x1E4F52DD8], &v248);
      if (!v248)
      {
        if (!v72)
        {
          fig_log_get_emitter();
          goto LABEL_244;
        }
        objc_msgSend(v72, "stabilizationOverscanFromSensorForFESCropDimensions:preferSIFRFormat:geometricDistortionCorrection:useFESCompanionIndex:", objc_msgSend(v72, "fesInputCropDimensions"), objc_msgSend(v72, "shouldPreferSIFRFormatWithHighlightRecoveryEnabled:", objc_msgSend(v197, "highlightRecoveryEnabled")), objc_msgSend(v197, "geometricDistortionCorrectionEnabled"), 1);
        BOOL v74 = v73 > 0.0;
        if (v75 != 0.0) {
          BOOL v74 = 0;
        }
        BOOL v198 = v74;
        unsigned int v195 = [v202 horizontalSensorBinningFactor];
        uint64_t v76 = [v202 verticalSensorBinningFactor];
        objc_super v77 = objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "commonSettings");
        uint64_t v78 = [v77 previewRegistrationType];
        v194 = v67;
        if (v78 == 1)
        {
          [(BWPipelineStage *)v219 priority];
          id v79 = -[FigCaptureMovieFileSinkTailPipeline _metalCommandQueueWithName:priority:](v10);
        }
        else
        {
          id v79 = 0;
        }
        uint64_t v91 = [v77 previewRegistrationExcludeStaticComponentFromAlignmentShiftsEnabled];
        if (*(unsigned char *)(a2 + 115))
        {
          uint64_t v92 = a6;
          uint64_t v93 = [a6 cameraInfoByPortType];
        }
        else
        {
          uint64_t v93 = 0;
          uint64_t v92 = a6;
        }
        BOOL v94 = v69 != 0;
        v95 = [BWPreviewStitcherNode alloc];
        if (*(unsigned char *)(a2 + 171)) {
          char v96 = v199;
        }
        else {
          char v96 = 0;
        }
        char v97 = [v92 parallaxMitigationBasedOnZoomFactorEnabled];
        BYTE5(v192) = *(unsigned char *)(a2 + 168);
        BYTE4(v192) = v94;
        BYTE3(v192) = v213;
        BYTE2(v192) = v97;
        BYTE1(v192) = v96;
        LOBYTE(v192) = v206;
        LODWORD(v98) = v68;
        v99 = -[BWPreviewStitcherNode initWithCameraInfoByPortType:sensorBinningFactor:inputBuffersHaveHorizontalOverscanOnly:registrationType:registrationMetalCommandQueue:excludeStaticComponentFromAlignmentShifts:propagateDepth:propagateStyles:parallaxMitigationBasedOnZoomFactorEnabled:zoomPIPOverlayEnabled:zoomPIPMinimumUIZoomFactor:zoomPIPSingleStreamModeEnabled:preallocateOutputBufferPool:](v95, "initWithCameraInfoByPortType:sensorBinningFactor:inputBuffersHaveHorizontalOverscanOnly:registrationType:registrationMetalCommandQueue:excludeStaticComponentFromAlignmentShifts:propagateDepth:propagateStyles:parallaxMitigationBasedOnZoomFactorEnabled:zoomPIPOverlayEnabled:zoomPIPMinimumUIZoomFactor:zoomPIPSingleStreamModeEnabled:preallocateOutputBufferPool:", v93, v195 | (unint64_t)(v76 << 32), v198, v78, v79, v91, v98, v192);
        if (v99)
        {
          objc_super v86 = v99;
          [(BWPreviewStitcherNode *)v99 setDelegate:a7];
          objc_msgSend((id)objc_msgSend(*(id *)(a2 + 8), "sourceConfiguration"), "videoZoomFactor");
          float v101 = v100;
          int v102 = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 8), "sourceConfiguration"), "sourceDeviceType");
          v103 = (void *)[v92 clientBaseZoomFactorsByPortType];
          v104 = v103;
          if (v102 == 8)
          {
            objc_msgSend((id)objc_msgSend(v103, "objectForKeyedSubscript:", v193), "floatValue");
            uint64_t v87 = v223;
            objc_super v88 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
            unsigned int v89 = v200;
            int v66 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
            int v67 = v194;
            if (v101 < v108) {
              goto LABEL_168;
            }
          }
          else
          {
            uint64_t v87 = v223;
            objc_super v88 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
            int v66 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
            int v67 = v194;
            if (v102 != 9)
            {
              uint64_t v107 = 0;
              unsigned int v89 = v200;
              goto LABEL_174;
            }
            objc_msgSend((id)objc_msgSend(v103, "objectForKeyedSubscript:", v193), "floatValue");
            unsigned int v89 = v200;
            if (v101 < v105
              || (objc_msgSend((id)objc_msgSend(v104, "objectForKeyedSubscript:", *MEMORY[0x1E4F52DF0]), "floatValue"),
                  v101 >= v106))
            {
LABEL_168:
              uint64_t v107 = 0;
LABEL_174:
              [(BWPreviewStitcherNode *)v86 setPreviewsWideBeforeSlaveStreamStarts:v107];
              -[BWPreviewStitcherNode setSuperWideFallbackForMacroSceneEnabled:](v86, "setSuperWideFallbackForMacroSceneEnabled:", objc_msgSend((id)objc_msgSend(a6, "bravoSuperWideCaptureStream"), "hasFocus"));
              goto LABEL_175;
            }
          }
          if ([a6 preferredMasterPortType]) {
            uint64_t v107 = objc_msgSend((id)objc_msgSend(a6, "preferredMasterPortType"), "isEqualToString:", v193);
          }
          else {
            uint64_t v107 = 1;
          }
          goto LABEL_174;
        }
LABEL_245:
        fig_log_get_emitter();
        goto LABEL_248;
      }
LABEL_242:
      fig_log_get_emitter();
      goto LABEL_353;
    }
    unsigned int v80 = [BWPreviewStitcherNode alloc];
    if (*(unsigned char *)(a2 + 171)) {
      uint64_t v81 = v199;
    }
    else {
      uint64_t v81 = 0;
    }
    uint64_t v82 = [v41 parallaxMitigationBasedOnZoomFactorEnabled];
    BOOL v84 = *(unsigned char *)(a2 + 168) != 0;
  }
  else
  {
    int v67 = (void *)[0 videoPreviewSinkConfiguration];
    unsigned int v80 = [BWPreviewStitcherNode alloc];
    uint64_t v82 = [v41 parallaxMitigationBasedOnZoomFactorEnabled];
    uint64_t v81 = 0;
    BOOL v70 = 0;
    BOOL v84 = 0;
    int v68 = 0;
  }
  LODWORD(v83) = v68;
  v85 = [(BWPreviewStitcherNode *)v80 initWithStitchingDisabledAndZoomPIPOverlayEnabled:v213 zoomPIPMinimumUIZoomFactor:v70 zoomPIPSingleStreamModeEnabled:v19 propagateDepth:v81 propagateStyles:v82 parallaxMitigationBasedOnZoomFactorEnabled:v84 preallocateOutputBufferPool:v83];
  if (!v85) {
    goto LABEL_245;
  }
  objc_super v86 = v85;
  [(BWPreviewStitcherNode *)v85 setDelegate:a7];
  uint64_t v87 = v10;
  objc_super v88 = &OBJC_IVAR___BWStreamStartStopSynchronizer__timeoutInSeconds;
  unsigned int v89 = v200;
  if (a2)
  {
LABEL_175:
    objc_super v90 = *(void **)(a2 + 8);
    goto LABEL_176;
  }
  objc_super v90 = 0;
LABEL_176:
  [v90 transform];
  [(BWPreviewStitcherNode *)v86 setOutputDimensions:v109];
  [v67 primaryCaptureRectAspectRatio];
  -[BWPreviewStitcherNode setPrimaryCameraAspectRatio:](v86, "setPrimaryCameraAspectRatio:");
  [v67 primaryCaptureRectCenter];
  -[BWPreviewStitcherNode setPrimaryCaptureRectCenterX:](v86, "setPrimaryCaptureRectCenterX:");
  if (a2) {
    uint64_t v110 = *(unsigned int *)(a2 + 152);
  }
  else {
    uint64_t v110 = 0;
  }
  [(BWPreviewStitcherNode *)v86 setMaxLossyCompressionLevel:v110];
  if (v208)
  {
    if (*(unsigned char *)(v87 + v88[215])) {
      uint64_t v111 = v89;
    }
    else {
      uint64_t v111 = 1;
    }
  }
  else
  {
    uint64_t v111 = 0;
  }
  [(BWPreviewStitcherNode *)v86 setForceBlackFillBorderEnabled:v111];
  if (a2)
  {
    -[BWPreviewStitcherNode setOverCaptureNotSupportedByDownstreamNodes:](v86, "setOverCaptureNotSupportedByDownstreamNodes:", BWCIFilterArrayContainsFiltersRequiringSegmentation(objc_msgSend((id)objc_msgSend(*(id *)(a2 + 8), "videoPreviewSinkConfiguration"), "filters")));
    v112 = *(void **)(a2 + 8);
    BOOL v113 = *(unsigned char *)(a2 + 147) != 0;
  }
  else
  {
    -[BWPreviewStitcherNode setOverCaptureNotSupportedByDownstreamNodes:](v86, "setOverCaptureNotSupportedByDownstreamNodes:", BWCIFilterArrayContainsFiltersRequiringSegmentation(objc_msgSend((id)objc_msgSend(0, "videoPreviewSinkConfiguration"), "filters")));
    v112 = 0;
    BOOL v113 = 0;
  }
  unint64_t v114 = [v112 transform];
  char v115 = v114;
  unint64_t v116 = HIDWORD(v114);
  [(BWPreviewStitcherNode *)v86 setRotationDegrees:HIDWORD(v114)];
  int v117 = FigCaptureTransformFlipAppliedBeforeRotationToAfter(v115 & 1, v116);
  [(BWPreviewStitcherNode *)v86 setFlipHorizontal:v117 == 1];
  [(BWPreviewStitcherNode *)v86 setFlipVertical:v117 == 2];
  [(BWPreviewStitcherNode *)v86 setGeneratesHistogram:v113];
  if (a2)
  {
    [(BWPreviewStitcherNode *)v86 setRebuildingGraphForTrueVideoTransition:*(unsigned __int8 *)(a2 + 174)];
    BOOL v118 = *(unsigned char *)(a2 + 128) != 0;
  }
  else
  {
    [(BWPreviewStitcherNode *)v86 setRebuildingGraphForTrueVideoTransition:0];
    BOOL v118 = 0;
  }
  LOBYTE(v39) = v196;
  [(BWPreviewStitcherNode *)v86 setTrueVideoCaptureEnabled:v118];
  uint64_t v10 = v223;
  BOOL v119 = [v202 dimensions] == 3840
      && (unint64_t)[v202 dimensions] >> 32 == 2160;
  [(BWPreviewStitcherNode *)v86 setTrueVideoCaptureFormatIs4K:v119];
  if (a2) {
    double v120 = *(double *)(a2 + 136);
  }
  else {
    double v120 = 0.0;
  }
  [(BWPreviewStitcherNode *)v86 setTrueVideoCaptureAdditionalZoomFactor:v120];
  -[BWPreviewStitcherNode setThermalPressureIsCritical:](v86, "setThermalPressureIsCritical:", (int)[a6 thermalSystemPressureLevel] > 2);
  v238.receiver = (id)v223;
  v238.super_class = (Class)FigCapturePreviewSinkPipeline;
  if ((objc_msgSendSuper2(&v238, sel_addNode_error_, v86, &v247) & 1) == 0
    || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v246, -[BWNode input](v86, "input"), v219) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_353;
  }
  *(void *)(v223 + v66[198]) = v86;
  v246 = [(BWNode *)v86 output];
  v41 = a6;
LABEL_195:
  if (a2)
  {
    char v121 = *(unsigned char *)(a2 + 171) ? v39 : 1;
    if ((v121 & 1) == 0)
    {
      v122 = [[BWOverCaptureSmartStyleApplyNode alloc] initWithMetalCommandQueue:v217];
      if (v122)
      {
        v123 = v122;
        [(BWNode *)v122 setName:@"SmartStyle Post Stitcher Preview Apply"];
        [(BWOverCaptureSmartStyleApplyNode *)v123 setMaxLossyCompressionLevel:*(unsigned int *)(a2 + 152)];
        v237.receiver = (id)v10;
        v237.super_class = (Class)FigCapturePreviewSinkPipeline;
        if ((objc_msgSendSuper2(&v237, sel_addNode_error_, v123, &v247) & 1) != 0
          && (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v246, -[BWNode input](v123, "input"), v219) & 1) != 0)
        {
          v246 = [(BWNode *)v123 output];
          *(unsigned char *)(v10 + 257) = 1;
          goto LABEL_204;
        }
        fig_log_get_emitter();
LABEL_353:
        FigDebugAssert3();
        goto LABEL_347;
      }
      fig_log_get_emitter();
LABEL_248:
      FigDebugAssert3();
      int v135 = -12786;
      goto LABEL_249;
    }
  }
LABEL_204:
  FigCapturePixelFormatIsTenBit(objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v209, "firstObject"), "sourceConfiguration"), "requiredFormat"), "format"));
  if (*(void *)(v10 + v66[198])) {
    uint64_t v124 = 0;
  }
  else {
    uint64_t v124 = v205 | [v41 parallaxMitigationBasedOnZoomFactorEnabled];
  }
  unint64_t v125 = [[BWPixelTransferNode alloc] initWithfractionalSourceRectEnabled:v124];
  [(id)v125 setName:@"Preview Scaler"];
  v126 = (void *)[v209 firstObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    fig_log_get_emitter();
LABEL_244:
    FigDebugAssert3();
    int v135 = -12780;
LABEL_249:
    unsigned int v248 = v135;
    goto LABEL_347;
  }
  if (!a2)
  {
    unint64_t v136 = [v126 transform];
    uint64_t v201 = v137;
    unint64_t v203 = v136;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    unint64_t v132 = HIDWORD(v136);
LABEL_257:
    if (objc_msgSend((id)objc_msgSend(v126, "sinkConfiguration"), "sinkType") == 6)
    {
      v252[0] = (BWSceneClassifierSinkNode *)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v126, "outputFormat"));
      uint64_t v133 = [MEMORY[0x1E4F1C978] arrayWithObjects:v252 count:1];
      uint64_t v134 = 0;
    }
    else
    {
      uint64_t v134 = 0;
      uint64_t v133 = 0;
    }
    goto LABEL_260;
  }
  if (*(unsigned char *)(a2 + 147)) {
    uint64_t v127 = v210 ^ 1u;
  }
  else {
    uint64_t v127 = 0;
  }
  int v128 = *(_DWORD *)(a2 + 72);
  uint64_t v129 = *(unsigned int *)(a2 + 152);
  unint64_t v130 = [v126 transform];
  uint64_t v201 = v131;
  unint64_t v203 = v130;
  unint64_t v132 = HIDWORD(v130);
  if (v128 != 5 || objc_msgSend((id)objc_msgSend(v126, "sinkConfiguration"), "sinkType") != 1) {
    goto LABEL_257;
  }
  uint64_t v133 = 0;
  uint64_t v134 = 5;
LABEL_260:
  [(id)v125 setPreferredOutputPixelFormats:v133];
  [(id)v125 setOutputColorSpaceProperties:v134];
  [(id)v125 setMaxLossyCompressionLevel:v129];
  if ((v210 & 1) == 0)
  {
    [(id)v125 setOutputWidth:(int)v201];
    [(id)v125 setOutputHeight:v201 >> 32];
    [(id)v125 setRotationDegrees:v132];
    int v138 = FigCaptureTransformFlipAppliedBeforeRotationToAfter(v203 & 1, v132);
    [(id)v125 setFlipHorizontal:v138 == 1];
    [(id)v125 setFlipVertical:v138 == 2];
  }
  [(id)v125 setCropMode:1];
  uint64_t v139 = v223;
  if (([(id)v125 flipHorizontal] & 1) == 0
    && ([(id)v125 flipVertical] & 1) == 0
    && ![(id)v125 rotationDegrees])
  {
    [(id)v125 setPassesBuffersThroughWhenPossible:1];
  }
  [(id)v125 setGeneratesHistogram:v127];
  [(id)v125 setAllows422To420Conversion:1];
  v236.receiver = (id)v223;
  v236.super_class = (Class)FigCapturePreviewSinkPipeline;
  if ((objc_msgSendSuper2(&v236, sel_addNode_error_, v125, &v247) & 1) == 0
    || (*(void *)(v223 + 48) = (id)v125,
        (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v246, objc_msgSend((id)v125, "input"), v219) & 1) == 0))
  {
    fig_log_get_emitter();
    goto LABEL_353;
  }
  v246 = (BWNodeOutput *)[(id)v125 output];
  v140 = v220;
  if ((unint64_t)[v220 count] < 2)
  {
    uint64_t v251 = (uint64_t)v246;
    v142 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v251 count:1];
  }
  else
  {
    v141 = -[BWFanOutNode initWithFanOutCount:mediaType:]([BWFanOutNode alloc], "initWithFanOutCount:mediaType:", [v220 count], 1986618469);
    [(BWNode *)v141 setName:@"Preview Splitter"];
    FigCaptureNameSplitterNodeOutputsCorrespondingToConnections([(BWNode *)v141 outputs], v220);
    v235.receiver = (id)v223;
    v235.super_class = (Class)FigCapturePreviewSinkPipeline;
    if ((objc_msgSendSuper2(&v235, sel_addNode_error_, v141, &v247) & 1) == 0
      || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v246, -[BWNode input](v141, "input"), v219) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_353;
    }
    v142 = [(BWNode *)v141 outputs];
    v140 = v220;
  }
  long long v233 = 0u;
  long long v234 = 0u;
  long long v231 = 0u;
  long long v232 = 0u;
  uint64_t v143 = [v140 countByEnumeratingWithState:&v231 objects:v250 count:16];
  if (v143)
  {
    uint64_t v144 = v143;
    uint64_t v145 = 0;
    unint64_t v125 = *(void *)v232;
    do
    {
      uint64_t v146 = 0;
      do
      {
        if (*(void *)v232 != v125) {
          objc_enumerationMutation(v140);
        }
        v147 = *(void **)(*((void *)&v231 + 1) + 8 * v146);
        v252[0] = 0;
        v148 = [(NSArray *)v142 objectAtIndexedSubscript:v145 + v146];
        v252[0] = v148;
        if (!a2)
        {
          if (v147) {
            goto LABEL_296;
          }
LABEL_298:
          v156 = v219;
          if ((v208 & v204) != 0)
          {
            if ((objc_msgSend((id)objc_msgSend(v147, "videoPreviewSinkConfiguration"), "semanticStyleRenderingEnabled") & 1) != 0
              || (v156 = v219, v157 = v219, *(unsigned char *)(v223 + 257)))
            {
              v157 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.preview.filtering", objc_msgSend((id)objc_msgSend(v220, "firstObject"), "sourceConfiguration")), 6);
              v156 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.separate-streaming-filter", (void *)[v147 sourceConfiguration]), 13);
            }
            if (a2)
            {
              v158 = *(void **)(a2 + 8);
              unsigned __int8 v159 = *(unsigned char *)(a2 + 144) != 0;
              unsigned __int8 v160 = *(unsigned char *)(a2 + 145) != 0;
              unsigned int v161 = *(_DWORD *)(a2 + 152);
              unsigned __int8 v162 = *(unsigned char *)(a2 + 113) != 0;
            }
            else
            {
              unsigned int v161 = 0;
              unsigned __int8 v159 = 0;
              v158 = 0;
              unsigned __int8 v160 = 0;
              unsigned __int8 v162 = 0;
            }
            unsigned int v248 = -[FigCapturePreviewSinkPipeline _appendFilteredPreviewPipeline:desiredPipelineStage:desiredStreamingFilterPipelineStage:previewSinkPipelineConfiguration:videoPreviewSinkConnectionConfiguration:graph:inferenceScheduler:captureDevice:focusBlurMapForDepthFiltersEnabled:depthFromMonocularNetworkEnabled:maxLossyCompressionLevel:deferredPrepareEnabled:metalCommandQueue:depthFilterRenderingIsAfterPreviewStitcher:portraitAutoSuggestEnabled:](v223, (uint64_t *)v252, v157, v156, a2, v158, a4, a5, a6, v159, v160, v161, v162, (uint64_t)v217, v206, v207);
            if (v248)
            {
LABEL_288:
              fig_log_get_emitter();
              goto LABEL_353;
            }
          }
          char v163 = objc_msgSend((id)objc_msgSend(v147, "videoPreviewSinkConfiguration"), "semanticStyleRenderingEnabled");
          if (v156) {
            char v164 = v163;
          }
          else {
            char v164 = 0;
          }
          if (!a2 || (v164 & 1) != 0)
          {
            v140 = v220;
            BOOL v165 = (unint64_t)[v220 count] > 1;
            v166 = v252[0];
            uint64_t v139 = v223;
            if (a2) {
              goto LABEL_314;
            }
            unsigned __int8 v173 = 0;
            char v171 = 0;
            v167 = 0;
            BOOL v168 = 0;
            unsigned __int8 v172 = 0;
            unsigned int v174 = 0;
            unsigned __int8 v176 = 0;
            long long v229 = 0u;
            long long v230 = 0u;
            float v170 = 0.0;
            BOOL v169 = 1;
          }
          else
          {
            uint64_t v139 = v223;
            v140 = v220;
            if (*(unsigned char *)(a2 + 172)) {
              v156 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.preview.image-queue", objc_msgSend((id)objc_msgSend(v220, "firstObject"), "sourceConfiguration")), 6);
            }
            BOOL v165 = (unint64_t)[v220 count] > 1;
            v166 = v252[0];
LABEL_314:
            v167 = *(void **)(a2 + 8);
            BOOL v168 = *(unsigned char *)(a2 + 171) != 0;
            BOOL v169 = *(unsigned char *)(a2 + 157) == 0;
            float v170 = *(float *)(a2 + 164);
            char v171 = *(unsigned char *)(a2 + 113) != 0;
            unsigned __int8 v172 = *(unsigned char *)(a2 + 172) != 0;
            unsigned __int8 v173 = *(unsigned char *)(a2 + 114) != 0;
            unsigned int v174 = *(_DWORD *)(a2 + 152);
            long long v175 = *(_OWORD *)(a2 + 96);
            long long v229 = *(_OWORD *)(a2 + 80);
            long long v230 = v175;
            unsigned __int8 v176 = *(unsigned char *)(a2 + 156) != 0;
          }
          unsigned int v248 = -[FigCapturePreviewSinkPipeline _buildImageQueuePreviewSinkPipeline:previewPipelineStage:videoPreviewSinkConnectionConfiguration:previewScalerOutputBuffersAreShared:zoomPIPOverlayEnabled:zoomPIPSmartStyleRenderingEnabled:zoomPIPSlaveStreamingEnabled:zoomPIPSlaveStreamingFrameRate:debugOverlayEnabled:deferredPrepareEnabled:parallelGraphRebuildEnabled:transform:remoteVideoPreview:maxLossyCompressionLevel:clientAuditToken:graph:captureDevice:previewTapDelegate:videoHDRImageStatisticsEnabled:zoomPIPOverlayDelegate:metalCommandQueue:]((id *)v139, (uint64_t)v166, v156, v167, v165, v213, v168, v169, v170, 0, v171, v172, 0, 0, v173, v174, &v229, a4, a6,
                                 a7,
                                 v176,
                                 a8,
                                 (uint64_t)v217);
          goto LABEL_316;
        }
        if (v147 == *(void **)(a2 + 8)) {
          goto LABEL_298;
        }
        if (v147 != *(void **)(a2 + 32))
        {
          if (v147 != *(void **)(a2 + 192))
          {
            if (v147 == *(void **)(a2 + 40))
            {
              if (v215) {
                goto LABEL_296;
              }
              v154 = +[BWPipelineStage pipelineStageWithName:priority:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:discardsLateSampleData:", FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.sceneclassifier", (void *)[v147 sourceConfiguration]), 0, 1);
              v228 = 0;
              unint64_t v155 = v205 & 0xFFFF000000000000 | *(unsigned int *)(a2 + 64) | ((unint64_t)*(unsigned __int16 *)(a2 + 68) << 32);
              unsigned int v248 = FigCaptureBuildSceneClassifierPipeline((void *)v139, v252[0], v155, 6, (uint64_t)v154, 0, 0, (uint64_t)a6, a5, 0, 0, &v228);
              if (v248) {
                goto LABEL_288;
              }
              unint64_t v205 = v155;
              *(void *)(v139 + 64) = v228;
              v152 = v252[0];
              uint64_t v153 = 96;
            }
            else if (v147 == *(void **)(a2 + 48))
            {
              v152 = v148;
              uint64_t v153 = 160;
            }
            else
            {
              if (v147 != *(void **)(a2 + 24))
              {
                if (v147 == *(void **)(a2 + 16))
                {
                  v152 = v148;
                  uint64_t v153 = 168;
                  goto LABEL_295;
                }
LABEL_296:
                v140 = v220;
                goto LABEL_316;
              }
              v152 = v148;
              uint64_t v153 = 176;
            }
LABEL_295:
            *(void *)(v139 + v153) = v152;
            goto LABEL_296;
          }
          unsigned int v248 = -[FigCapturePreviewSinkPipeline _buildPreviewSmartStyleCoefficientsTimeMachineSinkPipeline:upstreamPipelineStageForPreviewTimeMachine:previewTimeMachineConnectionConfiguration:deferredPrepareEnabled:graph:captureDevice:]((id)v139, (uint64_t)v148, (uint64_t)v219, v149, *(unsigned __int8 *)(a2 + 113), a4, a6);
          goto LABEL_296;
        }
        unsigned int v248 = [(FigCapturePreviewSinkPipeline *)(void *)v139 _buildPreviewTimeMachineSinkPipeline:(uint64_t)v219 upstreamPipelineStageForPreviewTimeMachine:v149 upstreamTransform:v150 previewTimeMachineConnectionConfiguration:v151 videoPreviewEnabled:0 deferredPrepareEnabled:*(unsigned __int8 *)(a2 + 113) smartCameraMotionDetectionEnabled:*(unsigned char *)(a2 + 146) graph:a4 captureDevice:a6];
        v140 = v220;
        if (v248) {
          goto LABEL_288;
        }
LABEL_316:
        ++v146;
      }
      while (v144 != v146);
      uint64_t v177 = [v140 countByEnumeratingWithState:&v231 objects:v250 count:16];
      uint64_t v144 = v177;
      v145 += v146;
    }
    while (v177);
  }
  long long v226 = 0u;
  long long v227 = 0u;
  long long v224 = 0u;
  long long v225 = 0u;
  uint64_t v178 = [obj countByEnumeratingWithState:&v224 objects:v249 count:16];
  v179 = a6;
  if (!v178) {
    goto LABEL_344;
  }
  uint64_t v180 = v178;
  uint64_t v181 = *(void *)v225;
  uint64_t v182 = 1;
  do
  {
    uint64_t v183 = 0;
    do
    {
      if (*(void *)v225 != v181) {
        objc_enumerationMutation(obj);
      }
      v184 = *(void **)(*((void *)&v224 + 1) + 8 * v183);
      id v186 = [(NSArray *)v218 objectAtIndexedSubscript:v182 + v183];
      if (a2)
      {
        if (v184 != *(void **)(a2 + 40))
        {
          if (v184 == *(void **)(a2 + 192))
          {
            uint64_t v139 = v223;
            unsigned int v248 = -[FigCapturePreviewSinkPipeline _buildPreviewSmartStyleCoefficientsTimeMachineSinkPipeline:upstreamPipelineStageForPreviewTimeMachine:previewTimeMachineConnectionConfiguration:deferredPrepareEnabled:graph:captureDevice:]((id)v223, (uint64_t)v186, (uint64_t)v219, v185, *(unsigned __int8 *)(a2 + 113), a4, v179);
            goto LABEL_340;
          }
LABEL_331:
          uint64_t v139 = v223;
          goto LABEL_340;
        }
        if (v215) {
          goto LABEL_331;
        }
      }
      else
      {
        if (v184) {
          char v187 = 1;
        }
        else {
          char v187 = v215;
        }
        if (v187) {
          goto LABEL_331;
        }
      }
      v188 = +[BWPipelineStage pipelineStageWithName:priority:discardsLateSampleData:](BWPipelineStage, "pipelineStageWithName:priority:discardsLateSampleData:", FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.sceneclassifier", (void *)[v184 sourceConfiguration]), 0, 1);
      v252[0] = 0;
      if (a2) {
        unint64_t v189 = *(unsigned int *)(a2 + 64) | ((unint64_t)*(unsigned __int16 *)(a2 + 68) << 32);
      }
      else {
        unint64_t v189 = 0;
      }
      uint64_t v139 = v223;
      unint64_t v125 = v125 & 0xFFFF000000000000 | v189;
      unsigned int v248 = FigCaptureBuildSceneClassifierPipeline((void *)v223, v186, v125, 6, (uint64_t)v188, 0, 0, (uint64_t)v179, a5, 0, 0, v252);
      if (v248)
      {
        fig_log_get_emitter();
        goto LABEL_353;
      }
      *(void *)(v223 + 64) = v252[0];
      *(void *)(v223 + 96) = v186;
      v179 = a6;
LABEL_340:
      ++v183;
    }
    while (v180 != v183);
    uint64_t v190 = [obj countByEnumeratingWithState:&v224 objects:v249 count:16];
    uint64_t v180 = v190;
    v182 += v183;
  }
  while (v190);
LABEL_344:
  v191 = (long long *)(v139 + 192);
  *(void *)(v139 + 192) = v203;
  *(void *)(v139 + 200) = v201;
  if (!v204) {
    v191 = &kFigCaptureVideoTransform_Identity;
  }
  *(_OWORD *)(v139 + 208) = *v191;
LABEL_347:
  result = v248;
  if (!v248)
  {
    if (v247) {
      return [v247 code];
    }
  }
  return result;
}

- (uint64_t)_metalSubmissionAndCompletionQueue
{
  if (result)
  {
    uint64_t v1 = result;
    result = *(void *)(result + 280);
    if (!result)
    {
      result = FigDispatchQueueCreateWithPriority();
      *(void *)(v1 + 280) = result;
    }
  }
  return result;
}

- (uint64_t)toggleDepthDensificationAccordingToFilters:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (BWCIFilterArrayContainsPortraitFilters(a2)) {
      uint64_t v4 = [MEMORY[0x1E4F1CAD0] set];
    }
    else {
      uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1EFB00CC8];
    }
    [*(id *)(v3 + 264) setInferencesToSkip:v4];
    if (BWCIFilterArrayContainsPortraitFilters(a2)) {
      uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
    }
    else {
      uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1EFB00CE0];
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void **)(v3 + 272);
    return [v7 setInferencesToSkip:v6];
  }
  return result;
}

- (void)setPrimaryCaptureRectAspectRatio:(double)a3 center:(CGPoint)a4 trueVideoTransitionPercentComplete:(double)a5 fencePortSendRight:(id)a6 uniqueID:(int64_t)a7
{
  if (self->_primaryCaptureRectUniqueID <= a7)
  {
    double y = a4.y;
    double x = a4.x;
    self->_primaryCaptureRectUniqueID = a7;
    uint64_t v13 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      [a6 port];
      kdebug_trace();
    }
    [(BWImageQueueSinkNode *)self->_imageQueueSinkNode fencePortGenerationIDWillChange];
    -[BWPreviewStitcherNode setPrimaryCaptureRectAspectRatio:center:trueVideoTransitionPercentComplete:trueVideoTransitionReferenceSampleBuffer:fencePortSendRight:](self->_previewStitcher, "setPrimaryCaptureRectAspectRatio:center:trueVideoTransitionPercentComplete:trueVideoTransitionReferenceSampleBuffer:fencePortSendRight:", 0, a6, a3, x, y, a5);
    if (*v13 == 1)
    {
      kdebug_trace();
    }
  }
}

- (float)simulatedAperture
{
  [(BWStreamingFilterNode *)self->_filterNode simulatedAperture];
  return result;
}

- (FigCaptureSemanticStyle)semanticStyle
{
  return [(BWStreamingFilterNode *)self->_filterNode semanticStyle];
}

- (int64_t)primaryCaptureRectUniqueID
{
  return self->_primaryCaptureRectUniqueID;
}

- (CGPoint)primaryCaptureRectCenter
{
  previewStitcher = self->_previewStitcher;
  if (previewStitcher) {
    [(BWPreviewStitcherNode *)previewStitcher primaryCaptureRectCenterX];
  }
  else {
    double v3 = 0.5;
  }
  double v4 = 0.5;
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (double)primaryCaptureRectAspectRatio
{
  [(BWPreviewStitcherNode *)self->_previewStitcher primaryCameraAspectRatio];
  return result;
}

- (float)portraitLightingEffectStrength
{
  filterNode = self->_filterNode;
  if (!filterNode) {
    return NAN;
  }
  [(BWStreamingFilterNode *)filterNode portraitLightingEffectStrength];
  return result;
}

- (NSArray)filters
{
  return [(BWStreamingFilterNode *)self->_filterNode filters];
}

- (int)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (BWNodeOutput)metadataSinkOutput
{
  return self->_metadataSinkOutput;
}

- (BWNodeOutput)videoThumbnailSinkOutput
{
  return self->_videoThumbnailSinkOutput;
}

- (FigCaptureVideoTransform)videoThumbnailSinkOutputTransform
{
  p_videoThumbnailSinkOutputTransform = &self->_videoThumbnailSinkOutputTransform;
  uint64_t v3 = *(void *)&self->_videoThumbnailSinkOutputTransform.mirrored;
  $470D365275581EF16070F5A11344F73E dimensions = p_videoThumbnailSinkOutputTransform->dimensions;
  result.$470D365275581EF16070F5A11344F73E dimensions = dimensions;
  result.mirrored = v3;
  result.rotationDegrees = HIDWORD(v3);
  return result;
}

- (BWPreviewTimeMachineSinkNode)timeMachineSinkNode
{
  return self->_timeMachineSinkNode;
}

- (void)setMrcSceneObserver:(id)a3
{
}

- (BWSemanticStyleSceneObserver)semanticStyleSceneObserver
{
  return (BWSemanticStyleSceneObserver *)self->_filterNode;
}

- (FigCaptureVideoTransform)outputTransform
{
  p_outputTransform = &self->_outputTransform;
  uint64_t v3 = *(void *)&self->_outputTransform.mirrored;
  $470D365275581EF16070F5A11344F73E dimensions = p_outputTransform->dimensions;
  result.$470D365275581EF16070F5A11344F73E dimensions = dimensions;
  result.mirrored = v3;
  result.rotationDegrees = HIDWORD(v3);
  return result;
}

- (FigCapturePreviewSinkPipeline)initWithConfiguration:(id)a3 sourcePreviewOutput:(id)a4 imageQueueSinkNode:(id)a5 graph:(id)a6 name:(id)a7 inferenceScheduler:(id)a8 captureDevice:(id)a9 previewTapDelegate:(id)a10 zoomPIPOverlayDelegate:(id)a11
{
  if (a3) {
    float v17 = (void *)*((void *)a3 + 1);
  }
  else {
    float v17 = 0;
  }
  v22.receiver = self;
  v22.super_class = (Class)FigCapturePreviewSinkPipeline;
  uint64_t v18 = -[FigCaptureSinkPipeline initWithGraph:name:sinkID:](&v22, sel_initWithGraph_name_sinkID_, a6, a7, objc_msgSend((id)objc_msgSend(v17, "sinkConfiguration"), "sinkID"));
  if (v18)
  {
    v18->_imageQueueSinkNode = (BWImageQueueSinkNode *)a5;
    if (a3)
    {
      v18->_overCaptureEnabled = *((unsigned char *)a3 + 115);
      v18->_videoStabilizationOverscan = *((double *)a3 + 15);
      uint64_t v19 = (void *)*((void *)a3 + 1);
    }
    else
    {
      uint64_t v19 = 0;
      v18->_overCaptureEnabled = 0;
      v18->_videoStabilizationOverscan = 0.0;
    }
    v18->_primaryCaptureRectUniqueID = objc_msgSend((id)objc_msgSend(v19, "videoPreviewSinkConfiguration"), "primaryCaptureRectUniqueID");
    if (a3) {
      BOOL v20 = (void *)*((void *)a3 + 7);
    }
    else {
      BOOL v20 = 0;
    }
    v18->_applyPreviewShiftToMomentCapture = objc_msgSend((id)objc_msgSend(v20, "irisSinkConfiguration"), "irisApplyPreviewShift");
    if (-[FigCapturePreviewSinkPipeline _buildVideoPreviewSinkPipeline:sourcePreviewOutput:graph:inferenceScheduler:captureDevice:previewTapDelegate:zoomPIPOverlayDelegate:]((uint64_t)v18, (uint64_t)a3, (uint64_t)a4, a6, (uint64_t)a8, a9, (uint64_t)a10, (uint64_t)a11))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v18;
}

- (BWStreamingFilterNode)filterNode
{
  return self->_filterNode;
}

- (void)updateClientAuditToken:(id *)a3
{
  self->_primaryCaptureRectUniqueID = 0;
  imageQueueSinkNode = self->_imageQueueSinkNode;
  long long v4 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v4;
  [(BWImageQueueSinkNode *)imageQueueSinkNode updateClientAuditToken:v5];
}

+ (void)initialize
{
}

- (void)dealloc
{
  [(BWImageQueueSinkNode *)self->_imageQueueSinkNode setCaptureDevice:0];

  v3.receiver = self;
  v3.super_class = (Class)FigCapturePreviewSinkPipeline;
  [(FigCaptureSinkPipeline *)&v3 dealloc];
}

- (BWMRCSceneObserver)mrcSceneObserver
{
  return [(BWSceneClassifierSinkNode *)self->_sceneClassifierSinkNode mrcSceneObserver];
}

- (void)setSemanticStyleSceneObserver:(id)a3
{
}

- (BOOL)discardsImageQueueSampleData
{
  uint64_t v2 = [(BWNodeConnection *)[(BWNodeInput *)[(BWNode *)self->_imageQueueSinkNode input] connection] output];
  return [(BWNodeOutput *)v2 discardsSampleData];
}

- (void)setSceneClassifierSuspended:(BOOL)a3
{
  sceneClassifierSinkNode = self->_sceneClassifierSinkNode;
  if (sceneClassifierSinkNode)
  {
    BOOL v6 = a3;
    uint64_t v7 = [(BWNodeConnection *)[(BWNodeInput *)[(BWNode *)sceneClassifierSinkNode input] connection] output];
    if (!v7)
    {
      fig_log_get_emitter();
      uint64_t v10 = v3;
      LODWORD(v9) = 0;
      FigDebugAssert3();
    }
    -[BWNodeOutput setDiscardsSampleData:](v7, "setDiscardsSampleData:", v6, v9, v10);
    sceneClassifierPipelineUpstreamOutput = self->_sceneClassifierPipelineUpstreamOutput;
    if (!sceneClassifierPipelineUpstreamOutput)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      sceneClassifierPipelineUpstreamOutput = self->_sceneClassifierPipelineUpstreamOutput;
    }
    [(BWNodeOutput *)sceneClassifierPipelineUpstreamOutput setDiscardsSampleData:v6];
  }
}

- (BOOL)sceneClassifierSuspended
{
  return [(BWNodeOutput *)self->_sceneClassifierPipelineUpstreamOutput discardsSampleData];
}

- (void)setFilters:(id)a3
{
  -[FigCapturePreviewSinkPipeline toggleDepthDensificationAccordingToFilters:]((uint64_t)self, a3);
  -[FigCapturePreviewSinkPipeline _setPortraitRenderingInferencesNeededForFilters:]((uint64_t)self, a3);
  [(BWPreviewStitcherNode *)self->_previewStitcher setOverCaptureNotSupportedByDownstreamNodes:BWCIFilterArrayContainsFiltersRequiringSegmentation(a3)];
  filterNode = self->_filterNode;
  [(BWStreamingFilterNode *)filterNode changeToFilters:a3 animated:1];
}

- (void)setSimulatedAperture:(float)a3
{
}

- (void)setPortraitLightingEffectStrength:(float)a3
{
}

- (void)setSemanticStyleSet:(id)a3 fencePortSendRight:(id)a4
{
  if (!self->_smartStyleRenderingEnabled)
  {
    uint64_t v7 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      [a3 leftmostRegionStartXOffset];
      [a4 port];
      kdebug_trace();
    }
    [(BWImageQueueSinkNode *)self->_imageQueueSinkNode fencePortGenerationIDWillChange];
    if (objc_msgSend((id)objc_msgSend(a3, "semanticStyles"), "count")) {
      [(BWInferenceNode *)self->_semanticStylePersonSegmentationNode setInferencesToSkip:0];
    }
    [(BWStreamingFilterNode *)self->_filterNode setSemanticStyleSet:a3 fencePortSendRight:a4];
    if (*v7 == 1)
    {
      kdebug_trace();
    }
  }
}

- (void)setSemanticStyle:(id)a3
{
  if (!self->_smartStyleRenderingEnabled) {
    [(FigCapturePreviewSinkPipeline *)self setSemanticStyle:a3 animated:0];
  }
}

- (void)setSemanticStyleRenderingSuspended:(BOOL)a3 animated:(BOOL)a4
{
  if (!self->_smartStyleRenderingEnabled)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    if ([(BWStreamingFilterNode *)self->_filterNode isSemanticStyleRenderingEnabled])
    {
      filterNode = self->_filterNode;
      [(BWStreamingFilterNode *)filterNode setSemanticStyleRenderingSuspended:v5 animated:v4];
    }
  }
}

- (void)setDisplaysWidestCameraOnly:(BOOL)a3
{
}

- (BOOL)displaysWidestCameraOnly
{
  return [(BWPreviewStitcherNode *)self->_previewStitcher displaysWidestCameraOnly];
}

- (void)setVideoStabilizationOverscanCropEnabled:(BOOL)a3 momentMovieRecordingEnabled:(BOOL)a4
{
  double v4 = 1.0;
  if (a3) {
    double v4 = self->_videoStabilizationOverscan + 1.0;
  }
  BOOL v5 = a4 && !self->_applyPreviewShiftToMomentCapture;
  [(BWPreviewStitcherNode *)self->_previewStitcher rampToAdditionalZoomFactor:v5 momentMovieRecordingRecenteringEnabled:v4];
}

- (void)setStoppingForModeSwitch:(BOOL)a3 parallelGraphRebuildEnabled:(BOOL)a4 ispFastSwitchEnabled:(BOOL)a5 smartStyleRenderingEnabledInTrueVideoGraph:(BOOL)a6
{
  BOOL v6 = a4;
  [(BWPreviewStitcherNode *)self->_previewStitcher setStoppingForModeSwitch:a3 delayedEndOfDataEnabled:a4 ispFastSwitchEnabled:a5 smartStyleRenderingEnabledInTrueVideoGraph:a6];
  if (v6)
  {
    [(BWVideoDepthNode *)self->_videoDepthNode setReleasesResourcesAtEndOfData:0];
    [(BWInferenceNode *)self->_opticalFlowInferenceNode setReleasesResourcesAtEndOfData:0];
    [(BWInferenceNode *)self->_personSegmentationAndDepthNode setReleasesResourcesAtEndOfData:0];
    [(BWInferenceNode *)self->_portraitOnlyPersonSegmentationNode setReleasesResourcesAtEndOfData:0];
    zoomPIPOverlayNode = self->_zoomPIPOverlayNode;
    [(BWVideoPIPOverlayNode *)zoomPIPOverlayNode setReleasesResourcesAtEndOfData:0];
  }
}

- (void)setStoppingForClientBackgrounded:(BOOL)a3
{
}

- (void)_buildPreviewTimeMachineSinkPipeline:(uint64_t)a3 upstreamPipelineStageForPreviewTimeMachine:(uint64_t)a4 upstreamTransform:(uint64_t)a5 previewTimeMachineConnectionConfiguration:(uint64_t)a6 videoPreviewEnabled:(uint64_t)a7 deferredPrepareEnabled:(int)a8 smartCameraMotionDetectionEnabled:(unsigned __int8)a9 graph:(void *)a10 captureDevice:(void *)a11
{
  if (result)
  {
    v14 = result;
    uint64_t v18 = 0;
    if ([a11 zeroShutterLagEnabled]) {
      uint64_t v15 = 7;
    }
    else {
      uint64_t v15 = 4;
    }
    int v16 = -[BWPreviewTimeMachineSinkNode initWithCaptureDevice:processingQueuePriority:timeMachineCapacity:smartCameraMotionDetectionEnabled:sinkID:]([BWPreviewTimeMachineSinkNode alloc], "initWithCaptureDevice:processingQueuePriority:timeMachineCapacity:smartCameraMotionDetectionEnabled:sinkID:", a11, 13, v15, a9, [v14 sinkID]);
    v17.receiver = v14;
    v17.super_class = (Class)FigCapturePreviewSinkPipeline;
    if ((objc_msgSendSuper2(&v17, sel_addNode_error_, v16, &v18) & 1) != 0
      && (v14[10] = v16,
          (objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", a2, -[BWNode input](v16, "input"), a3) & 1) != 0))
    {
      [(BWNode *)v16 output];
      if (a8) {
        [a10 enableDeferredPrepareForNodesNotInPathOfSinkNode:v16];
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    FigCaptureVideoTransform result = v18;
    if (v18) {
      return (void *)[v18 code];
    }
  }
  return result;
}

- (id)_buildPreviewSmartStyleCoefficientsTimeMachineSinkPipeline:(uint64_t)a3 upstreamPipelineStageForPreviewTimeMachine:(uint64_t)a4 previewTimeMachineConnectionConfiguration:(int)a5 deferredPrepareEnabled:(void *)a6 graph:(void *)a7 captureDevice:
{
  v21[5] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    BOOL v12 = result;
    id v19 = 0;
    v21[0] = 0x1EFA748E0;
    v21[1] = 0x1EFA74840;
    v21[2] = @"HumanFullBodiesMask";
    v21[3] = @"HumanSkinsMask";
    v21[4] = 0x1EFA74700;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:5];
    uint64_t v14 = *MEMORY[0x1E4F53520];
    v20[0] = *MEMORY[0x1E4F53518];
    v20[1] = v14;
    uint64_t v15 = *MEMORY[0x1E4F534D8];
    v20[2] = *MEMORY[0x1E4F534F8];
    v20[3] = v15;
    v20[4] = *MEMORY[0x1E4F534E0];
    int v16 = -[BWAttachedMediaTimeMachineSinkNode initWithTimeMachineCapacity:attachedMediaKeys:metadataKeys:sinkID:]([BWAttachedMediaTimeMachineSinkNode alloc], "initWithTimeMachineCapacity:attachedMediaKeys:metadataKeys:sinkID:", 4, v13, [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:5], @"SmartStyle attachments Time Machine");
    if (v16)
    {
      objc_super v17 = v16;
      [(BWNode *)v16 setName:@"SmartStyle attachments Time Machine"];
      [a7 setSmartStyleAttachedMediaTimeMachineDelegate:v17];
      v18.receiver = v12;
      v18.super_class = (Class)FigCapturePreviewSinkPipeline;
      if ((objc_msgSendSuper2(&v18, sel_addNode_error_, v17, &v19) & 1) != 0
        && (objc_msgSend(a6, "connectOutput:toInput:pipelineStage:", a2, -[BWNode input](v17, "input"), a3) & 1) != 0)
      {
        [(BWNode *)v17 output];
        if (a5) {
          [a6 enableDeferredPrepareForNodesNotInPathOfSinkNode:v17];
        }
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
    FigCaptureVideoTransform result = v19;
    if (v19) {
      return (id)[v19 code];
    }
  }
  return result;
}

- (BWPreviewStitcherNode)previewStitcherNode
{
  return self->_previewStitcher;
}

- (BWPixelTransferNode)scalerNode
{
  return self->_scalerNode;
}

- (BWNodeOutput)depthDataSinkOutput
{
  return self->_depthDataSinkOutput;
}

- (NSString)sourceID
{
  return self->_sourceID;
}

@end