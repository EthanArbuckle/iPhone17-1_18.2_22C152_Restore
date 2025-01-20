@interface FigCaptureVISPipeline
+ (BOOL)visPipelineIsRequiredForFigCaptureVideoStabilizationType:(uint64_t)a1;
+ (void)initialize;
- (BWVISNode)_buildVISPipelineWithUpstreamOutput:(void *)a3 graph:(void *)a4 parentPipeline:(void *)a5 videoCaptureConnectionConfiguration:(void *)a6 pipelineStage:(void *)a7 sdofPipelineStage:(unsigned int)a8 videoStabilizationType:(float)a9 motionAttachmentsSource:(unsigned int)a10 fillExtendedRowsOfOutputBuffer:(char)a11 overCaptureEnabled:(char)a12 stereoMode:(unsigned int)a13 videoStabilizationOverscanOverride:(unsigned int)a14 videoStabilizationStrength:(char)a15 motionMetadataPreloadingEnabled:(int)a16 visExecutionMode:(unsigned int)a17 pipelineTraceID:(void *)a18 captureDevice:(uint64_t)a19 outputDimensions:(char)a20 P3ToBT2020ConversionEnabled:(char)a21 stabilizeDepthAttachments:(uint64_t)a22 outputDepthDimensions:(unsigned int)a23 maxLossyCompressionLevel:(unsigned __int8)a24 videoSTFEnabled:(unsigned __int8)a25 videoGreenGhostMitigationEnabled:(char)a26 lightSourceMaskAndKeypointDescriptorDataEnabled:(unsigned __int8)a27 personSegmentationRenderingEnabled:(unsigned __int8)a28 smartStyleRenderingEnabled:(unsigned __int8)a29 smartStyleReversibilityEnabled:(unsigned __int8)a30 lowResImageUsedByVideoEncoderEnabled:(void *)a31 portTypesWithGeometricDistortionCorrectionInVISEnabled:(uint64_t)a32 visProcessingSemaphore:;
- (BWVISNode)_newVISNodeWithUpstreamOutput:(void *)a3 graph:(void *)a4 parentPipeline:(void *)a5 videoCaptureConnectionConfiguration:(unsigned int)a6 videoStabilizationType:(int)a7 motionAttachmentsSource:(char)a8 fillExtendedRowsOfOutputBuffer:(float)a9 overCaptureEnabled:(char)a10 stereoMode:(unsigned int)a11 videoStabilizationOverscanOverride:(unsigned int)a12 videoStabilizationStrength:(char)a13 motionMetadataPreloadingEnabled:(int)a14 visExecutionMode:(unsigned int)a15 pipelineTraceID:(void *)a16 pipelineStage:(void *)a17 captureDevice:(uint64_t)a18 outputDimensions:(double *)a19 irisVISCleanOutputRectOut:(char)a20 P3ToBT2020ConversionEnabled:(char)a21 stabilizeDepthAttachments:(uint64_t)a22 outputDepthDimensions:(unsigned int)a23 maxLossyCompressionLevel:(unsigned __int8)a24 videoSTFEnabled:(unsigned __int8)a25 videoGreenGhostMitigationEnabled:(char)a26 lightSourceMaskAndKeypointDescriptorDataEnabled:(unsigned __int8)a27 personSegmentationRenderingEnabled:(unsigned __int8)a28 smartStyleRenderingEnabled:(unsigned __int8)a29 smartStyleReversibilityEnabled:(unsigned __int8)a30 lowResImageUsedByVideoEncoderEnabled:(void *)a31 portTypesWithGeometricDistortionCorrectionInVISEnabled:(uint64_t)a32 visProcessingSemaphore:;
- (char)initWithUpstreamOutput:(void *)a3 graph:(float)a4 name:(uint64_t)a5 parentPipeline:(void *)a6 videoCaptureConnectionConfiguration:(void *)a7 pipelineStage:(void *)a8 sdofPipelineStage:(void *)a9 videoStabilizationType:(unsigned int)a10 motionAttachmentsSource:(unsigned int)a11 fillExtendedRowsOfOutputBuffer:(char)a12 overCaptureEnabled:(char)a13 stereoMode:(unsigned int)a14 videoStabilizationOverscanOverride:(unsigned int)a15 videoStabilizationStrength:(char)a16 motionMetadataPreloadingEnabled:(int)a17 visExecutionMode:(unsigned int)a18 pipelineTraceID:(void *)a19 captureDevice:(uint64_t)a20 outputDimensions:(char)a21 P3ToBT2020ConversionEnabled:(char)a22 stabilizeDepthAttachments:(uint64_t)a23 outputDepthDimensions:(unsigned int)a24 maxLossyCompressionLevel:(unsigned __int8)a25 videoSTFEnabled:(unsigned __int8)a26 videoGreenGhostMitigationEnabled:(char)a27 lightSourceMaskAndKeypointDescriptorDataEnabled:(unsigned __int8)a28 personSegmentationRenderingEnabled:(unsigned __int8)a29 smartStyleRenderingEnabled:(unsigned __int8)a30 smartStyleReversibilityEnabled:(unsigned __int8)a31 lowResImageUsedByVideoEncoderEnabled:(void *)a32 portTypesWithGeometricDistortionCorrectionInVISEnabled:(uint64_t)a33 visProcessingSemaphore:;
- (double)irisVISCleanOutputRect;
- (uint64_t)_buildMotionAttachmentsNodeWithUpstreamOutput:(void *)a1 graph:(uint64_t)a2 parentPipeline:(void *)a3 horizontalSensorBinningFactor:(void *)a4 verticalSensorBinningFactor:(unsigned int)a5 maxSupportedFrameRate:(unsigned int)a6 pipelineStage:(void *)a7 motionAttachmentsSource:(unsigned int)a8 captureDevice:(float)a9 isPanorama:(void *)a10 optimizesImagesForOfflineVideoStabilization:(unsigned __int8)a11 provideSourceVideoWithMotionAttachmentsOutput:(char)a12 provideOfflineVISMotionDataOutput:(char)a13 maxLossyCompressionLevel:(char)a14 motionAttachmentsNodeOut:(BWMotionAttachmentsNode *)a15 errOut:(_DWORD *)a16;
- (uint64_t)motionAttachmentsNode;
- (uint64_t)sdofVISNode;
- (uint64_t)visNode;
- (void)dealloc;
@end

@implementation FigCaptureVISPipeline

- (uint64_t)visNode
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

+ (BOOL)visPipelineIsRequiredForFigCaptureVideoStabilizationType:(uint64_t)a1
{
  return (a2 - 2) < 3;
}

- (uint64_t)_buildMotionAttachmentsNodeWithUpstreamOutput:(void *)a1 graph:(uint64_t)a2 parentPipeline:(void *)a3 horizontalSensorBinningFactor:(void *)a4 verticalSensorBinningFactor:(unsigned int)a5 maxSupportedFrameRate:(unsigned int)a6 pipelineStage:(void *)a7 motionAttachmentsSource:(unsigned int)a8 captureDevice:(float)a9 isPanorama:(void *)a10 optimizesImagesForOfflineVideoStabilization:(unsigned __int8)a11 provideSourceVideoWithMotionAttachmentsOutput:(char)a12 provideOfflineVISMotionDataOutput:(char)a13 maxLossyCompressionLevel:(char)a14 motionAttachmentsNodeOut:(BWMotionAttachmentsNode *)a15 errOut:(_DWORD *)a16
{
  if (!a1) {
    return 0;
  }
  int v19 = a11;
  uint64_t v39 = 0;
  int v38 = 0;
  v20 = [+[FigCaptureCameraParameters sharedInstance] motionAttachmentsParameters];
  uint64_t v21 = [a10 sensorIDDictionaryByPortType];
  uint64_t v22 = [a10 cameraInfoByPortType];
  uint64_t v23 = [a10 activePortTypes];
  if (a12) {
    int v19 = 2;
  }
  v24 = [BWMotionAttachmentsNode alloc];
  BYTE5(v31) = a14;
  BYTE4(v31) = a13;
  LODWORD(v31) = [a7 priority];
  *(float *)&double v25 = a9;
  v26 = -[BWMotionAttachmentsNode initWithSensorIDDictionaryByPortType:cameraInfoByPortType:tuningParameters:activePortTypes:horizontalSensorBinningFactor:verticalSensorBinningFactor:maxSupportedFrameRate:motionAttachmentsMode:motionAttachmentsSource:motionCallbackThreadPriority:provideSourceVideoWithMotionAttachmentsOutput:provideOfflineVISMotionDataOutput:errorOut:](v24, "initWithSensorIDDictionaryByPortType:cameraInfoByPortType:tuningParameters:activePortTypes:horizontalSensorBinningFactor:verticalSensorBinningFactor:maxSupportedFrameRate:motionAttachmentsMode:motionAttachmentsSource:motionCallbackThreadPriority:provideSourceVideoWithMotionAttachmentsOutput:provideOfflineVISMotionDataOutput:errorOut:", v21, v22, v20, v23, a5, a6, v25, __PAIR64__(a8, v19), v31, &v38);
  if (v38)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v28 = 0;
  }
  else
  {
    v27 = v26;
    -[BWNode setName:](v26, "setName:", [NSString stringWithFormat:@"%@ Motion Attachments", objc_msgSend(a1, "name")]);
    if ([a4 addNode:v27 error:&v39])
    {
      uint64_t v28 = a2;
      if (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a2, -[BWNode input](v27, "input"), a7))
      {
        if (a13) {
          uint64_t v29 = [(BWMotionAttachmentsNode *)v27 sourceVideoWithMotionAttachmentsOutput];
        }
        else {
          uint64_t v29 = [(BWMotionAttachmentsNode *)v27 offlineVISMotionDataOutput];
        }
        uint64_t v28 = v29;
        if (a15) {
          *a15 = v27;
        }
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      uint64_t v28 = a2;
    }
  }
  *a16 = v38;
  return v28;
}

- (uint64_t)sdofVISNode
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

+ (void)initialize
{
}

- (char)initWithUpstreamOutput:(void *)a3 graph:(float)a4 name:(uint64_t)a5 parentPipeline:(void *)a6 videoCaptureConnectionConfiguration:(void *)a7 pipelineStage:(void *)a8 sdofPipelineStage:(void *)a9 videoStabilizationType:(unsigned int)a10 motionAttachmentsSource:(unsigned int)a11 fillExtendedRowsOfOutputBuffer:(char)a12 overCaptureEnabled:(char)a13 stereoMode:(unsigned int)a14 videoStabilizationOverscanOverride:(unsigned int)a15 videoStabilizationStrength:(char)a16 motionMetadataPreloadingEnabled:(int)a17 visExecutionMode:(unsigned int)a18 pipelineTraceID:(void *)a19 captureDevice:(uint64_t)a20 outputDimensions:(char)a21 P3ToBT2020ConversionEnabled:(char)a22 stabilizeDepthAttachments:(uint64_t)a23 outputDepthDimensions:(unsigned int)a24 maxLossyCompressionLevel:(unsigned __int8)a25 videoSTFEnabled:(unsigned __int8)a26 videoGreenGhostMitigationEnabled:(char)a27 lightSourceMaskAndKeypointDescriptorDataEnabled:(unsigned __int8)a28 personSegmentationRenderingEnabled:(unsigned __int8)a29 smartStyleRenderingEnabled:(unsigned __int8)a30 smartStyleReversibilityEnabled:(unsigned __int8)a31 lowResImageUsedByVideoEncoderEnabled:(void *)a32 portTypesWithGeometricDistortionCorrectionInVISEnabled:(uint64_t)a33 visProcessingSemaphore:
{
  if (!a1) {
    return 0;
  }
  v43.receiver = a1;
  v43.super_class = (Class)FigCaptureVISPipeline;
  v40 = (char *)objc_msgSendSuper2(&v43, sel_initWithGraph_name_);
  if (v40)
  {
    long long v41 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *(_OWORD *)(v40 + 56) = *MEMORY[0x1E4F1DB28];
    *(_OWORD *)(v40 + 72) = v41;
    -[FigCaptureVISPipeline _buildVISPipelineWithUpstreamOutput:graph:parentPipeline:videoCaptureConnectionConfiguration:pipelineStage:sdofPipelineStage:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:captureDevice:outputDimensions:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:visProcessingSemaphore:]((BWVISNode *)v40, a2, a3, a6, a7, a8, a9, a10, a4, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
      a21,
      a22,
      a23,
      a24,
      a25,
      a26,
      a27,
      a28,
      a29,
      a30,
      a31,
      a32,
      a33);
    if (!*((void *)v40 + 5) || [a7 irisSDOFEnabled] && !*((void *)v40 + 6))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v40;
}

- (BWVISNode)_buildVISPipelineWithUpstreamOutput:(void *)a3 graph:(void *)a4 parentPipeline:(void *)a5 videoCaptureConnectionConfiguration:(void *)a6 pipelineStage:(void *)a7 sdofPipelineStage:(unsigned int)a8 videoStabilizationType:(float)a9 motionAttachmentsSource:(unsigned int)a10 fillExtendedRowsOfOutputBuffer:(char)a11 overCaptureEnabled:(char)a12 stereoMode:(unsigned int)a13 videoStabilizationOverscanOverride:(unsigned int)a14 videoStabilizationStrength:(char)a15 motionMetadataPreloadingEnabled:(int)a16 visExecutionMode:(unsigned int)a17 pipelineTraceID:(void *)a18 captureDevice:(uint64_t)a19 outputDimensions:(char)a20 P3ToBT2020ConversionEnabled:(char)a21 stabilizeDepthAttachments:(uint64_t)a22 outputDepthDimensions:(unsigned int)a23 maxLossyCompressionLevel:(unsigned __int8)a24 videoSTFEnabled:(unsigned __int8)a25 videoGreenGhostMitigationEnabled:(char)a26 lightSourceMaskAndKeypointDescriptorDataEnabled:(unsigned __int8)a27 personSegmentationRenderingEnabled:(unsigned __int8)a28 smartStyleRenderingEnabled:(unsigned __int8)a29 smartStyleReversibilityEnabled:(unsigned __int8)a30 lowResImageUsedByVideoEncoderEnabled:(void *)a31 portTypesWithGeometricDistortionCorrectionInVISEnabled:(uint64_t)a32 visProcessingSemaphore:
{
  if (!result) {
    return result;
  }
  v36 = result;
  int v37 = a10;
  uint64_t v67 = 0;
  int v38 = objc_msgSend((id)objc_msgSend(a5, "sourceConfiguration"), "requiredFormat");
  int v39 = [a5 irisSDOFEnabled];
  int v40 = objc_msgSend((id)objc_msgSend(a5, "sourceConfiguration"), "imageControlMode");
  int v61 = v39;
  if (a16 == 3)
  {
    long long v41 = a4;
  }
  else
  {
    unsigned __int8 v59 = v40 == 4;
    v66 = 0;
    char v42 = objc_msgSend((id)objc_msgSend(a5, "irisSinkConfiguration"), "optimizesImagesForOfflineVideoStabilization");
    if (a16 == 5) {
      char v43 = 1;
    }
    else {
      char v43 = v42;
    }
    int v65 = 0;
    unsigned int v44 = [v38 horizontalSensorBinningFactor];
    v45 = a6;
    unsigned int v46 = [v38 verticalSensorBinningFactor];
    [v38 maxSupportedFrameRate];
    char v57 = v43;
    int v37 = a10;
    long long v41 = a4;
    unsigned int v47 = v46;
    a6 = v45;
    uint64_t v49 = -[FigCaptureVISPipeline _buildMotionAttachmentsNodeWithUpstreamOutput:graph:parentPipeline:horizontalSensorBinningFactor:verticalSensorBinningFactor:maxSupportedFrameRate:pipelineStage:motionAttachmentsSource:captureDevice:isPanorama:optimizesImagesForOfflineVideoStabilization:provideSourceVideoWithMotionAttachmentsOutput:provideOfflineVISMotionDataOutput:maxLossyCompressionLevel:motionAttachmentsNodeOut:errOut:](v36, a2, a3, a4, v44, v47, v45, a10, v48, a18, v59, v57, 1, 0, &v66, &v65);
    if (v65) {
      goto LABEL_27;
    }
    a2 = v49;
    v36->super._outputs = (NSMutableArray *)v66;
    int v39 = v61;
  }
  if (v39)
  {
    v50 = objc_alloc_init(BWVideoSDOFSplitNode);
    -[BWNode setName:](v50, "setName:", [NSString stringWithFormat:@"%@ Iris SDOF Split", -[BWNode name](v36, "name")]);
    if (([v41 addNode:v50 error:&v67] & 1) == 0
      || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a2, -[BWNode input](v50, "input"), a6) & 1) == 0)
    {
LABEL_27:
      fig_log_get_emitter();
      return (BWVISNode *)FigDebugAssert3();
    }
    v51 = v36;
    v58 = v50;
    uint64_t v52 = [(BWVideoSDOFSplitNode *)v50 originalOutput];
  }
  else
  {
    v51 = v36;
    v58 = 0;
    uint64_t v52 = a2;
  }
  BOOL v53 = a16 == 3 || a16 == 0;
  if (v53) {
    unsigned __int8 v54 = a28;
  }
  else {
    unsigned __int8 v54 = 0;
  }
  if (v53) {
    unsigned __int8 v55 = a29;
  }
  else {
    unsigned __int8 v55 = 0;
  }
  v56 = -[FigCaptureVISPipeline _newVISNodeWithUpstreamOutput:graph:parentPipeline:videoCaptureConnectionConfiguration:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:pipelineStage:captureDevice:outputDimensions:irisVISCleanOutputRectOut:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:visProcessingSemaphore:](v51, v52, a3, a4, a5, a8, v37, a11, a9, a12, a13, a14, a15, a16, a17, a6, a18, a19, (double *)&v51->super._supportsConcurrentLiveInputCallbacks,
          a20,
          a21,
          a22,
          a23,
          a24,
          a25,
          a26,
          a27,
          v54,
          v55,
          a30,
          a31,
          a32);
  v51->super._name = (NSString *)&v56->super.super.isa;
  if (!v56) {
    goto LABEL_27;
  }
  result = [(BWNode *)v56 output];
  if (v61)
  {
    result = -[FigCaptureVISPipeline _newVISNodeWithUpstreamOutput:graph:parentPipeline:videoCaptureConnectionConfiguration:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:pipelineStage:captureDevice:outputDimensions:irisVISCleanOutputRectOut:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:visProcessingSemaphore:](v51, (uint64_t)[(BWVideoSDOFSplitNode *)v58 sdofOutput], a3, a4, a5, a8, v37, a11, a9, a12, 0, a14, a15, a16, a17, a7, a18, a19, 0,
               a20,
               a21,
               a22,
               a23,
               a24,
               a25,
               a26,
               a27,
               a28,
               a29,
               a30,
               0,
               0);
    v51->super._subgraphName = (NSString *)&result->super.super.isa;
    if (!result) {
      goto LABEL_27;
    }
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVISPipeline;
  [(FigCapturePipeline *)&v3 dealloc];
}

- (BWVISNode)_newVISNodeWithUpstreamOutput:(void *)a3 graph:(void *)a4 parentPipeline:(void *)a5 videoCaptureConnectionConfiguration:(unsigned int)a6 videoStabilizationType:(int)a7 motionAttachmentsSource:(char)a8 fillExtendedRowsOfOutputBuffer:(float)a9 overCaptureEnabled:(char)a10 stereoMode:(unsigned int)a11 videoStabilizationOverscanOverride:(unsigned int)a12 videoStabilizationStrength:(char)a13 motionMetadataPreloadingEnabled:(int)a14 visExecutionMode:(unsigned int)a15 pipelineTraceID:(void *)a16 pipelineStage:(void *)a17 captureDevice:(uint64_t)a18 outputDimensions:(double *)a19 irisVISCleanOutputRectOut:(char)a20 P3ToBT2020ConversionEnabled:(char)a21 stabilizeDepthAttachments:(uint64_t)a22 outputDepthDimensions:(unsigned int)a23 maxLossyCompressionLevel:(unsigned __int8)a24 videoSTFEnabled:(unsigned __int8)a25 videoGreenGhostMitigationEnabled:(char)a26 lightSourceMaskAndKeypointDescriptorDataEnabled:(unsigned __int8)a27 personSegmentationRenderingEnabled:(unsigned __int8)a28 smartStyleRenderingEnabled:(unsigned __int8)a29 smartStyleReversibilityEnabled:(unsigned __int8)a30 lowResImageUsedByVideoEncoderEnabled:(void *)a31 portTypesWithGeometricDistortionCorrectionInVISEnabled:(uint64_t)a32 visProcessingSemaphore:
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v117 = objc_msgSend((id)objc_msgSend(a17, "captureStream"), "sensorIDDictionary");
  int v40 = objc_msgSend((id)objc_msgSend(a5, "sourceConfiguration"), "requiredFormat");
  int v41 = [a5 irisVISEnabled];
  v116 = a4;
  if (v41)
  {
    char v42 = (void *)[a5 irisSinkConfiguration];
    if (v42) {
      [v42 irisMovieVideoFrameDuration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    float v44 = 1.0 / CMTimeGetSeconds(&time);
    unsigned int v45 = [a5 irisVISMethod];
  }
  else
  {
    objc_msgSend((id)objc_msgSend(a5, "sourceConfiguration"), "requiredMaxFrameRate");
    float v44 = v43;
    unsigned int v45 = [a5 videoStabilizationMethod];
  }
  unsigned int v46 = v45;
  if (v45 == 5 || (int v47 = 0, v45 == 3))
  {
    [v40 cinematicStabilizationExtendedLookAheadDuration];
    int v47 = v48;
  }
  if (!a2)
  {
    fig_log_get_emitter();
    goto LABEL_23;
  }
  int v115 = a7;
  id v130 = 0;
  uint64_t v49 = objc_msgSend((id)objc_msgSend(a5, "sourceConfiguration"), "source");
  uint64_t v50 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v50) {
    uint64_t v51 = v50;
  }
  else {
    uint64_t v51 = 0;
  }
  uint64_t v52 = *(uint64_t (**)(uint64_t, __CFString *, void, id *))(v51 + 48);
  if (!v52)
  {
    int v129 = -12782;
LABEL_22:
    fig_log_get_emitter();
LABEL_23:
    FigDebugAssert3();
    unsigned __int8 v55 = 0;
LABEL_24:

    return 0;
  }
  int v129 = v52(v49, @"AttributesDictionary", *MEMORY[0x1E4F1CF80], &v130);
  if (v129) {
    goto LABEL_22;
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v130, "objectForKeyedSubscript:", 0x1EFA6BA40), "objectForKeyedSubscript:", 0x1EFA6BA60), "floatValue");
  float v54 = v53;

  if (a6 == 4)
  {
    CFTypeRef cf = (CFTypeRef)[a17 copyISPProcessingSessionWithType:6 error:0];
    if (!cf) {
      goto LABEL_22;
    }
  }
  else if (a6 == 3)
  {
    CFTypeRef cf = (CFTypeRef)[a17 copyISPProcessingSessionWithType:1 error:0];
    if (!cf) {
      goto LABEL_22;
    }
  }
  else
  {
    CFTypeRef cf = 0;
  }
  int v111 = v47;
  unsigned int v113 = a6;
  v106 = a1;
  if (v41)
  {
    float v56 = (double)(int)a18 / 1.1;
    int v57 = FigCaptureRoundFloatToMultipleOf(4, v56);
    float v58 = (double)SHIDWORD(a18) / 1.1;
    int v59 = FigCaptureRoundFloatToMultipleOf(4, v58);
    int v60 = a18 - v57;
    if ((int)a18 < v57) {
      ++v60;
    }
    double v61 = (double)(v60 >> 1);
    int v62 = HIDWORD(a18) - v59;
    if (SHIDWORD(a18) < v59) {
      ++v62;
    }
    double v63 = (double)(v62 >> 1);
    double v64 = (double)v57;
    double v65 = (double)v59;
    if (a19)
    {
      *a19 = v61;
      a19[1] = v63;
      a19[2] = v64;
      a19[3] = v65;
    }
  }
  else
  {
    double v61 = *MEMORY[0x1E4F1DB28];
    double v63 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v64 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v65 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  v107 = a3;
  uint64_t v108 = a2;
  v120 = a5;
  unsigned int v112 = v46;
  if ((objc_msgSend((id)objc_msgSend(a5, "irisSinkConfiguration"), "irisApplyPreviewShift") & 1) != 0
    || ([a17 parallaxMitigationBasedOnZoomFactorEnabled] & 1) != 0)
  {
    char v110 = 1;
  }
  else
  {
    char v110 = [a17 adaptiveOverscanEnabled];
  }
  uint64_t v109 = [a17 cameraInfoByPortType];
  v119 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  v66 = (void *)[a17 activePortTypes];
  uint64_t v67 = [v66 countByEnumeratingWithState:&v125 objects:v137 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v126;
    while (2)
    {
      for (uint64_t i = 0; i != v68; ++i)
      {
        if (*(void *)v126 != v69) {
          objc_enumerationMutation(v66);
        }
        uint64_t v71 = *(void *)(*((void *)&v125 + 1) + 8 * i);
        v72 = (void *)FigVideoCaptureSourceCopyUnderlyingSourceFormatForFormatAndPortType(objc_msgSend((id)objc_msgSend(a5, "sourceConfiguration"), "source"), v40, v71, &v129);
        if (v129 || (v73 = v72) == 0)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          unsigned __int8 v55 = 0;
          goto LABEL_90;
        }
        int v74 = [v72 distortionCompensationSupported];
        if (a14 != 5 && !a11 && v74 && ([a31 containsObject:v71] & 1) == 0) {
          [v119 addObject:v71];
        }
      }
      uint64_t v68 = [v66 countByEnumeratingWithState:&v125 objects:v137 count:16];
      if (v68) {
        continue;
      }
      break;
    }
  }
  float v75 = a9;
  float v76 = v54 * 10.0;
  if ([v40 isHighPhotoQualitySupported]) {
    int v77 = 2;
  }
  else {
    int v77 = 1;
  }
  unsigned int v105 = v77;
  v78 = [BWVISNode alloc];
  [v40 maxSupportedFrameRate];
  int v80 = v79;
  uint64_t v81 = [a16 priority];
  BYTE5(v104) = a11 == 1;
  BYTE4(v104) = a26;
  *(float *)&uint64_t v104 = v76;
  HIDWORD(v103) = a14;
  BYTE2(v103) = a13;
  BYTE1(v103) = v110;
  LOBYTE(v103) = [a5 zoomSmoothingEnabled];
  BYTE5(v102) = a10;
  BYTE4(v102) = a8;
  LODWORD(v102) = v115;
  LODWORD(v82) = v80;
  *(float *)&double v83 = v44;
  *(float *)&double v84 = v75;
  LODWORD(v85) = v111;
  v86 = cf;
  unsigned __int8 v55 = -[BWVISNode initWithSensorIDDict:stabilizationMethod:stabilizationType:ispProcessingSession:maxSupportedFrameRate:activeMaxFrameRate:gpuPriority:metalSubmissionAndCompletionQueuePriority:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:zoomSmoothingEnabled:applyFrameCropOffset:motionMetadataPreloadingEnabled:visExecutionMode:livePhotoCleanOutputRect:cameraInfoByPortType:cvisExtendedLookAheadDuration:distortionCorrectionEnabledPortTypes:distortionCompensationEnabledPortTypes:minDistanceForBravoParallaxShift:lightSourceMaskAndKeypointDescriptorDataEnabled:attachStabilizedOutputCameraTrajectory:](v78, "initWithSensorIDDict:stabilizationMethod:stabilizationType:ispProcessingSession:maxSupportedFrameRate:activeMaxFrameRate:gpuPriority:metalSubmissionAndCompletionQueuePriority:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:zoomSmoothingEnabled:applyFrameCropOffset:motionMetadataPreloadingEnabled:visExecutionMode:livePhotoCleanOutputRect:cameraInfoByPortType:cvisExtendedLookAheadDuration:distortionCorrectionEnabledPortTypes:distortionCompensationEnabledPortTypes:minDistanceForBravoParallaxShift:lightSourceMaskAndKeypointDescriptorDataEnabled:attachStabilizedOutputCameraTrajectory:", v117, v112, v113, cf, v105, v81, v82, v83, v84, v61, v63,
          v64,
          v65,
          v85,
          v102,
          __PAIR64__(a12, a11),
          v103,
          v109,
          a31,
          v119,
          v104);
  if ([a17 position] == 2
    && (FigCaptureCameraRequires180DegreesRotation([a17 position] == 2, 0) & 1) == 0)
  {
    v133[0] = 0;
    v133[2] = 0;
    long long v134 = 0u;
    long long v135 = 0u;
    v133[1] = 0x3FF0000000000000;
    v133[3] = 0xBFF0000000000000;
    uint64_t v136 = 0x3FF0000000000000;
    -[BWVISNode setCameraExtrinsicMatrix:](v55, "setCameraExtrinsicMatrix:", [MEMORY[0x1E4F1C9B8] dataWithBytes:v133 length:72]);
  }
  if (!v55)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    if (!cf) {
      goto LABEL_24;
    }
    goto LABEL_91;
  }
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  v87 = (void *)[a17 captureStreams];
  uint64_t v88 = [v87 countByEnumeratingWithState:&v121 objects:v132 count:16];
  if (v88)
  {
    uint64_t v89 = v88;
    char v90 = 0;
    uint64_t v91 = *(void *)v122;
    do
    {
      uint64_t v92 = 0;
      do
      {
        if (*(void *)v122 != v91) {
          objc_enumerationMutation(v87);
        }
        [*(id *)(*((void *)&v121 + 1) + 8 * v92) currentNonLowPowerSphereMode];
        BOOL v93 = FigCFEqual() || FigCFEqual() || FigCFEqual() != 0;
        v90 |= v93;
        ++v92;
      }
      while (v89 != v92);
      uint64_t v94 = [v87 countByEnumeratingWithState:&v121 objects:v132 count:16];
      uint64_t v89 = v94;
    }
    while (v94);
  }
  else
  {
    char v90 = 0;
  }
  char v95 = v90 | a10;
  uint64_t v96 = [a17 variableFrameRateControlEnabled];
  [(BWVISNode *)v55 setOutputDimensions:a18];
  [(BWVISNode *)v55 setSphereVideoEnabled:v95 & 1];
  [(BWVISNode *)v55 setFrameRateConversionEnabled:v96];
  if (a20) {
    [(BWVISNode *)v55 setOutputColorSpaceProperties:6];
  }
  uint64_t v97 = a15;
  if (a21)
  {
    [(BWVISNode *)v55 setStabilizeDepthAttachments:1];
    uint64_t v97 = a15;
    [(BWVISNode *)v55 setOutputDepthDimensions:a22];
  }
  [(BWVISNode *)v55 setMaxLossyCompressionLevel:a23];
  -[BWVISNode setFlipHorizontalExcludingIris:](v55, "setFlipHorizontalExcludingIris:", [v120 physicalMirroringForMovieRecordingEnabled]);
  [(BWVISNode *)v55 setVideoSTFEnabled:a24];
  [(BWVISNode *)v55 setVideoGreenGhostMitigationEnabled:a25];
  [(BWVISNode *)v55 setSmartStyleRenderingEnabled:a28];
  [(BWVISNode *)v55 setSmartStyleReversibilityEnabled:a29];
  [(BWVISNode *)v55 setLowResImageUsedByVideoEncoderEnabled:a30];
  [(BWVISNode *)v55 setPersonSegmentationRenderingEnabled:a27];
  [(BWVISNode *)v55 setProcessingSemaphore:a32];
  v98 = NSString;
  uint64_t v99 = [v106 name];
  if (v113 - 1 > 3) {
    v100 = @"None";
  }
  else {
    v100 = off_1E5C29878[v113 - 1];
  }
  -[BWNode setName:](v55, "setName:", [v98 stringWithFormat:@"%@ Stabilizer (%@)", v99, v100]);
  [(BWVISNode *)v55 setPipelineTraceID:v97];
  if (([v116 addNode:v55 error:0] & 1) == 0
    || (objc_msgSend(v107, "connectOutput:toInput:pipelineStage:", v108, -[BWNode input](v55, "input"), a16) & 1) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_90:
    v86 = cf;
    if (!cf) {
      goto LABEL_24;
    }
LABEL_91:
    CFRelease(v86);
    goto LABEL_24;
  }
  if (cf) {
    CFRelease(cf);
  }
  return v55;
}

- (uint64_t)motionAttachmentsNode
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (double)irisVISCleanOutputRect
{
  if (a1) {
    return *(double *)(a1 + 56);
  }
  else {
    return 0.0;
  }
}

@end