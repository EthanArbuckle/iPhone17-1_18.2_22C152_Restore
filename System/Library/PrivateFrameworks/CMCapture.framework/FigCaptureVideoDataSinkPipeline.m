@interface FigCaptureVideoDataSinkPipeline
+ (void)initialize;
- (BOOL)optimizedForPreview;
- (id)initWithConfiguration:(uint64_t)a3 sourceVideoOutput:(void *)a4 captureDevice:(void *)a5 graph:(uint64_t)a6 name:(uint64_t)a7 delegate:;
- (uint64_t)_buildVideoDataSinkPipelineWithConfiguration:(uint64_t)a3 sourceVideoOutput:(void *)a4 captureDevice:(void *)a5 graph:(uint64_t)a6 delegate:;
- (uint64_t)faceTrackingVideoCaptureOutput;
- (uint64_t)offlineVISMotionDataCaptureOutput;
- (uint64_t)sourceDeviceType;
- (uint64_t)sourceID;
- (void)dealloc;
- (void)setDiscardsSampleData:(BOOL)a3;
@end

@implementation FigCaptureVideoDataSinkPipeline

- (void)setDiscardsSampleData:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BWPipelineStage *)self->_visPipelineStage queue]) {
    BOOL v5 = !v3;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5 && ![(FigCaptureSinkPipeline *)self discardsSampleData])
  {
    objc_initWeak(&location, self);
    v6 = [(BWPipelineStage *)self->_visPipelineStage queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__FigCaptureVideoDataSinkPipeline_setDiscardsSampleData___block_invoke;
    block[3] = &unk_1E5C24580;
    objc_copyWeak(&v9, &location);
    dispatch_async((dispatch_queue_t)v6, block);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  v7.receiver = self;
  v7.super_class = (Class)FigCaptureVideoDataSinkPipeline;
  [(FigCaptureSinkPipeline *)&v7 setDiscardsSampleData:v3];
}

- (id)initWithConfiguration:(uint64_t)a3 sourceVideoOutput:(void *)a4 captureDevice:(void *)a5 graph:(uint64_t)a6 name:(uint64_t)a7 delegate:
{
  if (!a1) {
    return 0;
  }
  if (a2) {
    v13 = *(void **)(a2 + 88);
  }
  else {
    v13 = 0;
  }
  v16.receiver = a1;
  v16.super_class = (Class)FigCaptureVideoDataSinkPipeline;
  id v14 = objc_msgSendSuper2(&v16, sel_initWithGraph_name_sinkID_, a5, a6, objc_msgSend((id)objc_msgSend(v13, "sinkConfiguration"), "sinkID"));
  if (v14)
  {
    if (!a2
      || (*((void *)v14 + 7) = a4,
          *((void *)v14 + 13) = (id)[*(id *)(a2 + 64) sourceID],
          *((_DWORD *)v14 + 28) = *(_DWORD *)(a2 + 72),
          -[FigCaptureVideoDataSinkPipeline _buildVideoDataSinkPipelineWithConfiguration:sourceVideoOutput:captureDevice:graph:delegate:]((uint64_t)v14, a2, a3, a4, a5, a7)))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  objc_msgSend((id)objc_msgSend(a5, "memoryAnalyticsPayload"), "setGraphHasVideoDataOutput:", 1);
  return v14;
}

- (uint64_t)faceTrackingVideoCaptureOutput
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

- (uint64_t)sourceID
{
  if (result) {
    return *(void *)(result + 104);
  }
  return result;
}

- (uint64_t)sourceDeviceType
{
  if (result) {
    return *(unsigned int *)(result + 112);
  }
  return result;
}

- (uint64_t)_buildVideoDataSinkPipelineWithConfiguration:(uint64_t)a3 sourceVideoOutput:(void *)a4 captureDevice:(void *)a5 graph:(uint64_t)a6 delegate:
{
  if (!result) {
    return result;
  }
  uint64_t v9 = result;
  unsigned int v124 = 0;
  id v123 = 0;
  if (a2) {
    v10 = *(void **)(a2 + 88);
  }
  else {
    v10 = 0;
  }
  v110 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.videodata", (void *)[v10 sourceConfiguration]), 13);
  if (a2)
  {
    uint64_t v11 = *(void *)(a2 + 16);
    unint64_t v104 = *(void *)(a2 + 8);
    unint64_t v98 = HIDWORD(v104);
    v12 = *(void **)(a2 + 88);
    v13 = *(void **)(a2 + 64);
    int v14 = *(_DWORD *)(a2 + 28);
    unsigned int v15 = *(_DWORD *)(a2 + 32);
    v87 = (void *)[v13 requiredFormat];
    BOOL v97 = *(unsigned char *)(a2 + 24) != 0;
  }
  else
  {
    v87 = (void *)[0 requiredFormat];
    unsigned int v15 = 0;
    v12 = 0;
    LODWORD(v98) = 0;
    unint64_t v104 = 0;
    uint64_t v11 = 0;
    int v14 = 0;
    v13 = 0;
    BOOL v97 = 0;
  }
  unsigned int v100 = v14;
  BOOL v16 = +[FigCaptureVISPipeline visPipelineIsRequiredForFigCaptureVideoStabilizationType:]((uint64_t)FigCaptureVISPipeline, v14);
  int v91 = [v13 imageControlMode];
  int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  if (a2)
  {
    BOOL v109 = *(unsigned char *)(a2 + 48) != 0;
    BOOL v105 = *(unsigned __int8 *)(a2 + 36) != 0;
    BOOL v99 = *(unsigned char *)(a2 + 60) != 0;
    if (*(unsigned char *)(a2 + 36)) {
      BOOL v17 = 0;
    }
    else {
      BOOL v17 = *(unsigned char *)(a2 + 60) != 0;
    }
    BOOL v103 = v17;
  }
  else
  {
    BOOL v103 = 0;
    BOOL v109 = 0;
    BOOL v105 = 0;
    BOOL v99 = 0;
  }
  v18 = (void *)[v12 sinkConfiguration];
  uint64_t v106 = v11;
  unsigned int v93 = v15;
  if ([v18 sinkType] == 6)
  {
    if (!a2)
    {
      [v18 sinkType];
      BOOL v102 = 0;
      uint64_t v19 = a3;
      goto LABEL_36;
    }
    BOOL v102 = *(unsigned char *)(a2 + 128) != 0;
    uint64_t v19 = a3;
    if ([v18 sinkType] != 6) {
      goto LABEL_25;
    }
  }
  else
  {
    if ([v18 sinkType] != 6)
    {
      BOOL v102 = 0;
      uint64_t v19 = a3;
      if (!a2) {
        goto LABEL_36;
      }
      goto LABEL_25;
    }
    BOOL v102 = 0;
    uint64_t v19 = a3;
    if (!a2) {
      goto LABEL_36;
    }
  }
  if (*(unsigned char *)(a2 + 129))
  {
    [(BWPipelineStage *)v110 priority];
    v20 = -[BWPocketDetectionNode initWithMetalCommandQueue:clientApplicationID:]([BWPocketDetectionNode alloc], "initWithMetalCommandQueue:clientApplicationID:", -[FigCaptureMovieFileSinkTailPipeline _metalCommandQueueWithName:priority:](v9), *(void *)(a2 + 152));
    if (!v20)
    {
      fig_log_get_emitter();
      goto LABEL_101;
    }
    v21 = v20;
    [(BWNode *)v20 setName:@"Pocket Detection"];
    v122.receiver = (id)v9;
    v122.super_class = (Class)FigCaptureVideoDataSinkPipeline;
    if ((objc_msgSendSuper2(&v122, sel_addNode_error_, v21, &v123) & 1) == 0
      || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", a3, -[BWNode input](v21, "input"), v110) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_151;
    }
    uint64_t v19 = [(BWNode *)v21 output];
  }
  else
  {
    uint64_t v19 = a3;
  }
LABEL_25:
  if (*(unsigned char *)(a2 + 160)) {
    char v22 = v16;
  }
  else {
    char v22 = 1;
  }
  if ((v22 & 1) == 0)
  {
    v23 = v13;
    v24 = [[BWSmartStyleApplyNode alloc] initWithMetalCommandQueue:0 renderingMethod:*(unsigned int *)(a2 + 164)];
    if (!v24)
    {
      fig_log_get_emitter();
      goto LABEL_101;
    }
    v25 = v24;
    [(BWNode *)v24 setName:@"SmartStyle Video Data Output Apply"];
    int v26 = *(_DWORD *)(a2 + 56);
    if (v26 <= (int)FigCapturePixelFormatGetLossyCompressionLevel([v12 outputFormat])) {
      uint64_t LossyCompressionLevel = FigCapturePixelFormatGetLossyCompressionLevel([v12 outputFormat]);
    }
    else {
      uint64_t LossyCompressionLevel = *(unsigned int *)(a2 + 56);
    }
    [(BWSmartStyleApplyNode *)v25 setMaxLossyCompressionLevel:LossyCompressionLevel];
    v121.receiver = (id)v9;
    v121.super_class = (Class)FigCaptureVideoDataSinkPipeline;
    if ((objc_msgSendSuper2(&v121, sel_addNode_error_, v25, &v123) & 1) == 0
      || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v19, -[BWNode input](v25, "input"), v110) & 1) == 0)
    {
      goto LABEL_95;
    }
    uint64_t v19 = [(BWNode *)v25 output];
    v13 = v23;
  }
LABEL_36:
  v111 = v12;
  v95 = v13;
  v96 = a5;
  uint64_t v89 = a3;
  if (v16)
  {
    *(void *)(v9 + 72) = +[BWPipelineStage pipelineStageWithName:FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.videodata-stabilization", v13) priority:13];
    v125[0] = 0;
    uint64_t v28 = [v13 source];
    uint64_t v29 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v29) {
      uint64_t v30 = v29;
    }
    else {
      uint64_t v30 = 0;
    }
    unsigned int v31 = v100;
    v38 = *(void (**)(uint64_t, __CFString *, void, id *))(v30 + 48);
    if (v38)
    {
      v38(v28, @"AttributesDictionary", *MEMORY[0x1E4F1CF80], v125);
      id v39 = v125[0];
    }
    else
    {
      id v39 = 0;
    }
    char v40 = objc_msgSend((id)objc_msgSend(v39, "objectForKeyedSubscript:", @"HEVC"), "BOOLValue");

    v41 = [FigCaptureVISPipeline alloc];
    if (a2)
    {
      uint64_t v42 = *(void *)(a2 + 76);
      unsigned int v43 = *(_DWORD *)(a2 + 56);
      unsigned __int8 v44 = *(unsigned char *)(a2 + 61) != 0;
      unsigned __int8 v45 = *(unsigned char *)(a2 + 160) != 0;
      v46 = *(void **)(a2 + 40);
    }
    else
    {
      unsigned __int8 v45 = 0;
      unsigned int v43 = 0;
      uint64_t v42 = 0;
      unsigned __int8 v44 = 0;
      v46 = 0;
    }
    v47 = -[FigCaptureVISPipeline initWithUpstreamOutput:graph:name:parentPipeline:videoCaptureConnectionConfiguration:pipelineStage:sdofPipelineStage:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:captureDevice:outputDimensions:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:visProcessingSemaphore:](v41, v19, a5, 0.0, @"Video Data Sink VIS Pipeline", (void *)v9, v12, *(void **)(v9 + 72), 0, v100, v93, v40, 0, 0, 0, 0, 0, 0x5Au, a4,
            v42,
            v109,
            0,
            0,
            v43,
            v44,
            0,
            0,
            0,
            v45,
            0,
            0,
            v46,
            0);
    *(void *)(v9 + 64) = v47;
    if (v47)
    {
      [(id)-[FigCaptureVISPipeline motionAttachmentsNode]((uint64_t)v47) setAdjustsValidBufferRectForDarkShade:1];
      uint64_t v94 = [(id)-[FigCaptureVISPipeline visNode](*(void *)(v9 + 64)) output];
      uint64_t v48 = [(id)-[FigCaptureVISPipeline visNode](*(void *)(v9 + 64)) outputDimensions];
      goto LABEL_58;
    }
LABEL_95:
    fig_log_get_emitter();
    goto LABEL_151;
  }
  if (v91 == 4 || CFPreferenceNumberWithDefault)
  {
    unsigned int v34 = [v87 horizontalSensorBinningFactor];
    unsigned int v35 = [v87 verticalSensorBinningFactor];
    [v87 maxSupportedFrameRate];
    uint64_t v37 = FigCaptureBuildMotionAttachmentsNode((void *)v9, v19, v34, v35, v110, v93, [a4 sensorIDDictionaryByPortType], objc_msgSend(a4, "cameraInfoByPortType"), v36, objc_msgSend(a4, "activePortTypes"), v91 == 4, objc_msgSend((id)objc_msgSend(v12, "irisSinkConfiguration"), "optimizesImagesForOfflineVideoStabilization"), 1, 0, &v124);
    if (v124) {
      goto LABEL_95;
    }
    uint64_t v94 = v37;
    unsigned int v31 = v100;
  }
  else
  {
    unsigned int v31 = v100;
    if (v102)
    {
      v32 = -[BWPreviewStabilizationNode initWithCameraInfoByPortType:forStillImagePreview:updateFinalCropRectWithStabilizationShift:]([BWPreviewStabilizationNode alloc], "initWithCameraInfoByPortType:forStillImagePreview:updateFinalCropRectWithStabilizationShift:", [a4 cameraInfoByPortType], objc_msgSend(a4, "autoImageControlMode") == 0, 1);
      if (v32)
      {
        v33 = v32;
        [(BWNode *)v32 setName:@"Preview Stabilization"];
        v120.receiver = (id)v9;
        v120.super_class = (Class)FigCaptureVideoDataSinkPipeline;
        if ((objc_msgSendSuper2(&v120, sel_addNode_error_, v33, &v123) & 1) == 0
          || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v19, -[BWNode input](v33, "input"), v110) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_151;
        }
        uint64_t v94 = [(BWNode *)v33 output];
        goto LABEL_57;
      }
      fig_log_get_emitter();
LABEL_101:
      FigDebugAssert3();
      return 4294954510;
    }
    uint64_t v94 = v19;
  }
LABEL_57:
  uint64_t v48 = v106;
LABEL_58:
  [v12 outputFormat];
  unint64_t v49 = [v12 transform];
  uint64_t v92 = v50;
  unint64_t v51 = HIDWORD(v49);
  unint64_t v101 = v49;
  char v52 = v49 ^ v104;
  int v53 = objc_msgSend(v12, "requiresScalingForInputTransForm:nodeName:");
  v54 = v12;
  char v55 = v31 == 2 || v97;
  int v56 = [v54 deviceOrientationCorrectionEnabled];
  uint64_t v107 = v48;
  if (v98 != v51 && (v51 == 270 || v51 == 90))
  {
    uint64_t v57 = v9;
    [v111 outputHeight];
    [v111 outputWidth];
  }
  else
  {
    uint64_t v57 = v9;
    [v111 outputWidth];
    [v111 outputHeight];
  }
  char v58 = (v98 != v51) | v52;
  char v59 = v58 | v53;
  v60 = -[BWPixelTransferNode initWithfractionalSourceRectEnabled:]([BWPixelTransferNode alloc], "initWithfractionalSourceRectEnabled:", v102 | [*(id *)(v57 + 56) parallaxMitigationBasedOnZoomFactorEnabled]);
  [(BWPixelTransferNode *)v60 setPassesBuffersThroughWhenPossible:(((v103 || v109) | (v58 | v53)) & 1) == 0];
  v61 = (void *)[MEMORY[0x1E4F28E78] stringWithString:@"Video Data Converter"];
  v62 = v61;
  if (v58) {
    [v61 appendString:@"/Rotator"];
  }
  if (v53) {
    [v62 appendString:@"/Scaler"];
  }
  if ((v55 & 1) == 0) {
    [v62 appendString:@"/Zoomer"];
  }
  if (v109) {
    [v62 appendString:@"/ColorConverter"];
  }
  if (v103) {
    [v62 appendString:@"/Copier"];
  }
  if (v56) {
    [v62 appendString:@"/DeviceOrientationCorrection"];
  }
  [(BWNode *)v60 setName:v62];
  uint64_t v63 = [a4 supportsWideColor];
  if (a2)
  {
    int v65 = *(_DWORD *)(a2 + 52);
    uint64_t v64 = *(unsigned int *)(a2 + 56);
  }
  else
  {
    uint64_t v64 = 0;
    int v65 = 0;
  }
  int v66 = v105 && v99;
  FigCaptureConfigureVideoDataConverterRotatorNode(v60, v111, v104, v107, v63, v109, v64, v65);
  if (!((v109 | v56) & 1 | v59 & 1 | ((v55 & 1) == 0))
    || [v95 sourceDeviceType] == 8
    && (([v95 manualCinematicFramingEnabled] & 1) != 0
     || [v95 cinematicFramingEnabled]))
  {
    [(BWPixelTransferNode *)v60 setCropMode:3];
  }
  if (v66) {
    [(BWPixelTransferNode *)v60 setOutputPixelFormat:0];
  }
  v119.receiver = (id)v57;
  v119.super_class = (Class)FigCaptureVideoDataSinkPipeline;
  if ((objc_msgSendSuper2(&v119, sel_addNode_error_, v60, &v123) & 1) == 0
    || (*(void *)(v57 + 80) = v60,
        (objc_msgSend(v96, "connectOutput:toInput:pipelineStage:", v94, -[BWNode input](v60, "input"), v110) & 1) == 0))
  {
    fig_log_get_emitter();
    goto LABEL_151;
  }
  uint64_t v67 = [(BWNode *)v60 output];
  uint64_t v68 = v67;
  if (a2)
  {
    BOOL v69 = *(unsigned char *)(a2 + 37) != 0;
    if (*(void *)(a2 + 88))
    {
      char v70 = 0;
      int v71 = 1;
      BOOL v72 = v105;
      goto LABEL_110;
    }
  }
  else
  {
    BOOL v69 = 0;
  }
  BOOL v72 = v105;
  int v71 = 0;
  char v70 = 1;
LABEL_110:
  uint64_t v73 = (v69 + v72 + v71);
  if (v73 >= 2)
  {
    v74 = [[BWFanOutNode alloc] initWithFanOutCount:v73 mediaType:1986618469];
    [(BWNode *)v74 setName:@"Video Splitter"];
    v118.receiver = (id)v57;
    v118.super_class = (Class)FigCaptureVideoDataSinkPipeline;
    if ((objc_msgSendSuper2(&v118, sel_addNode_error_, v74, &v123) & 1) == 0
      || (objc_msgSend(v96, "connectOutput:toInput:pipelineStage:", v68, -[BWNode input](v74, "input"), v110) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_151;
    }
    if (v70)
    {
      uint64_t v75 = 0;
      uint64_t v76 = 0;
    }
    else
    {
      uint64_t v75 = [(NSArray *)[(BWNode *)v74 outputs] objectAtIndexedSubscript:0];
      uint64_t v76 = 1;
    }
    if (v105)
    {
      *(void *)(v57 + 88) = [(NSArray *)[(BWNode *)v74 outputs] objectAtIndexedSubscript:v76++];
      if (!v69)
      {
LABEL_125:
        if (v66)
        {
LABEL_126:
          v79 = [[BWPixelTransferNode alloc] initWithfractionalSourceRectEnabled:0];
          [(BWNode *)v79 setName:@"Video Data Copier"];
          uint64_t v80 = [a4 supportsWideColor];
          uint64_t v78 = v75;
          if (a2)
          {
            int v82 = *(_DWORD *)(a2 + 52);
            uint64_t v81 = *(unsigned int *)(a2 + 56);
          }
          else
          {
            uint64_t v81 = 0;
            int v82 = 0;
          }
          FigCaptureConfigureVideoDataConverterRotatorNode(v79, v111, v101, v92, v80, 0, v81, v82);
          v117.receiver = (id)v57;
          v117.super_class = (Class)FigCaptureVideoDataSinkPipeline;
          if ((objc_msgSendSuper2(&v117, sel_addNode_error_, v79, &v123) & 1) == 0
            || (objc_msgSend(v96, "connectOutput:toInput:pipelineStage:", v75, -[BWNode input](v79, "input"), v110) & 1) == 0)
          {
            fig_log_get_emitter();
            goto LABEL_151;
          }
          uint64_t v83 = [(BWNode *)v79 output];
          if (v70) {
            goto LABEL_142;
          }
          uint64_t v68 = v83;
LABEL_135:
          v84 = [BWRemoteQueueSinkNode alloc];
          if (a2)
          {
            long long v85 = *(_OWORD *)(a2 + 112);
            long long v115 = *(_OWORD *)(a2 + 96);
            long long v116 = v85;
          }
          else
          {
            long long v115 = 0u;
            long long v116 = 0u;
          }
          v86 = -[BWRemoteQueueSinkNode initWithMediaType:clientAuditToken:sinkID:](v84, "initWithMediaType:clientAuditToken:sinkID:", 1986618469, &v115, [(id)v57 sinkID]);
          [(BWNode *)v86 setName:@"Video Data Remote Queue Sink"];
          [(BWRemoteQueueSinkNode *)v86 setDelegate:a6];
          [(BWRemoteQueueSinkNode *)v86 setFrameSenderSupportEnabled:1];
          if (objc_msgSend((id)objc_msgSend(v111, "videoDataSinkConfiguration"), "sceneStabilityMetadataEnabled"))objc_msgSend(a4, "registerForAEMatrixMetadata"); {
          -[BWRemoteQueueSinkNode setDiscardsLateSampleBuffers:](v86, "setDiscardsLateSampleBuffers:", objc_msgSend((id)objc_msgSend(v111, "videoDataSinkConfiguration"), "discardsLateVideoFrames"));
          }
          -[BWRemoteQueueSinkNode setClientVideoRetainedBufferCount:](v86, "setClientVideoRetainedBufferCount:", [v111 retainedBufferCount]);
          -[BWRemoteQueueSinkNode setAttachPanoramaMetadata:](v86, "setAttachPanoramaMetadata:", objc_msgSend((id)objc_msgSend(v111, "sourceConfiguration"), "imageControlMode") == 4);
          -[BWRemoteQueueSinkNode setCameraSupportsFlash:](v86, "setCameraSupportsFlash:", [a4 hasFlash]);
          -[BWRemoteQueueSinkNode setRemoveCameraIntrinsicMatrixAttachment:](v86, "setRemoveCameraIntrinsicMatrixAttachment:", [v111 cameraIntrinsicMatrixDeliveryEnabled] ^ 1);
          -[BWRemoteQueueSinkNode setPanoramaRequiresLTMLocking:](v86, "setPanoramaRequiresLTMLocking:", -[FigCaptureCameraParameters panoramaRequiresLTMLockingForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "panoramaRequiresLTMLockingForPortType:sensorIDString:", objc_msgSend((id)objc_msgSend(a4, "captureStream"), "portType"), objc_msgSend((id)objc_msgSend(a4, "captureStream"), "sensorIDString")));
          -[BWRemoteQueueSinkNode setSceneStabilityMetadataEnabled:](v86, "setSceneStabilityMetadataEnabled:", objc_msgSend((id)objc_msgSend(v111, "videoDataSinkConfiguration"), "sceneStabilityMetadataEnabled"));
          -[BWRemoteQueueSinkNode setRequestedBufferAttachmentsTrie:](v86, "setRequestedBufferAttachmentsTrie:", objc_msgSend((id)objc_msgSend(v111, "videoDataSinkConfiguration"), "requestedBufferAttachmentsTrie"));
          v114.receiver = (id)v57;
          v114.super_class = (Class)FigCaptureVideoDataSinkPipeline;
          if ((objc_msgSendSuper2(&v114, sel_addNode_error_, v86, &v123) & 1) != 0
            && (objc_msgSend(v96, "connectOutput:toInput:pipelineStage:", v68, -[BWNode input](v86, "input"), v110) & 1) != 0)
          {
            v113.receiver = (id)v57;
            v113.super_class = (Class)FigCaptureVideoDataSinkPipeline;
            objc_msgSendSuper2(&v113, sel_setSinkNode_, v86);
            goto LABEL_142;
          }
          fig_log_get_emitter();
LABEL_151:
          FigDebugAssert3();
          if (v124) {
            return v124;
          }
          else {
            return 4294954516;
          }
        }
LABEL_134:
        uint64_t v78 = v75;
        uint64_t v68 = v75;
        if (v70) {
          goto LABEL_142;
        }
        goto LABEL_135;
      }
    }
    else if (!v69)
    {
      goto LABEL_125;
    }
    *(void *)(v57 + 96) = [(NSArray *)[(BWNode *)v74 outputs] objectAtIndexedSubscript:v76];
    if (v66) {
      goto LABEL_126;
    }
    goto LABEL_134;
  }
  if (v72)
  {
    uint64_t v77 = 88;
  }
  else
  {
    if (!v69) {
      goto LABEL_120;
    }
    uint64_t v77 = 96;
  }
  *(void *)(v57 + v77) = v67;
LABEL_120:
  uint64_t v78 = v89;
  if ((v70 & 1) == 0) {
    goto LABEL_135;
  }
LABEL_142:
  *(unsigned char *)(v57 + 116) = objc_msgSend((id)objc_msgSend(v111, "videoDataSinkConfiguration"), "optimizedForPreview");
  v112.receiver = (id)v57;
  v112.super_class = (Class)FigCaptureVideoDataSinkPipeline;
  objc_msgSendSuper2(&v112, sel_setUpstreamOutput_, v78);
  result = v124;
  if (!v124)
  {
    if (v123) {
      return [v123 code];
    }
  }
  return result;
}

- (uint64_t)offlineVISMotionDataCaptureOutput
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVideoDataSinkPipeline;
  [(FigCaptureRemoteQueueSinkPipeline *)&v3 dealloc];
}

void *__57__FigCaptureVideoDataSinkPipeline_setDiscardsSampleData___block_invoke(uint64_t a1)
{
  result = objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    v2 = (void *)-[FigCaptureVISPipeline visNode](result[8]);
    return (void *)[v2 flush];
  }
  return result;
}

- (BOOL)optimizedForPreview
{
  if (result) {
    return *(unsigned char *)(result + 116) != 0;
  }
  return result;
}

@end