@interface FigCaptureDepthDataPipeline
+ (void)initialize;
- (BWNodeOutput)videoAndConvertedDepthDataOutput;
- (BWPipelineStage)pipelineStage;
- (FigCaptureDepthDataPipeline)initWithConfiguration:(id)a3 sourceOutput:(id)a4 graph:(id)a5 name:(id)a6 delegate:(id)a7;
- (NSString)sourceID;
- (id)_buildDepthDataSinkPipeline:(uint64_t)a3 sourceOutput:(void *)a4 graph:(_OWORD *)a5 clientAuditToken:(uint64_t)a6 delegate:(int)a7 insertCopier:;
- (id)_buildDepthPipelineWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(uint64_t)a5 delegate:;
- (int)sourceDeviceType;
- (uint64_t)_buildDepthConversionPipelineWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(uint64_t *)a5 convertedDepthOutputsOut:;
- (void)dealloc;
@end

@implementation FigCaptureDepthDataPipeline

- (FigCaptureDepthDataPipeline)initWithConfiguration:(id)a3 sourceOutput:(id)a4 graph:(id)a5 name:(id)a6 delegate:(id)a7
{
  if (a3) {
    v12 = (void *)*((void *)a3 + 1);
  }
  else {
    v12 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)FigCaptureDepthDataPipeline;
  v13 = -[FigCaptureSinkPipeline initWithGraph:name:sinkID:](&v16, sel_initWithGraph_name_sinkID_, a5, a6, objc_msgSend((id)objc_msgSend(v12, "sinkConfiguration"), "sinkID"));
  if (!v13) {
    goto LABEL_9;
  }
  if (a3)
  {
    v14 = (void *)*((void *)a3 + 1);
    if (!v14)
    {
      v14 = (void *)*((void *)a3 + 2);
      if (!v14) {
        v14 = (void *)*((void *)a3 + 3);
      }
    }
  }
  else
  {
    v14 = 0;
  }
  v13->_sourceID = (NSString *)(id)objc_msgSend((id)objc_msgSend(v14, "sourceConfiguration"), "sourceID");
  v13->_sourceDeviceType = [v14 underlyingDeviceType];
  if (-[FigCaptureDepthDataPipeline _buildDepthPipelineWithConfiguration:sourceOutput:graph:delegate:](v13, (uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a7))
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  else
  {
LABEL_9:
    objc_msgSend((id)objc_msgSend(a5, "memoryAnalyticsPayload"), "setGraphContainsDepthDataPipeline:", 1);
  }
  return v13;
}

- (id)_buildDepthPipelineWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(uint64_t)a5 delegate:
{
  if (!a1) {
    return 0;
  }
  id v18 = 0;
  if (!a2)
  {
    a1[9] = 0;
    -[FigCaptureDepthDataPipeline _buildDepthConversionPipelineWithConfiguration:sourceOutput:graph:convertedDepthOutputsOut:]((uint64_t)a1, 0, a3, a4, (uint64_t *)&v18);
    return 0;
  }
  a1[9] = *(id *)(a2 + 40);
  -[FigCaptureDepthDataPipeline _buildDepthConversionPipelineWithConfiguration:sourceOutput:graph:convertedDepthOutputsOut:]((uint64_t)a1, a2, a3, a4, (uint64_t *)&v18);
  v10 = *(void **)(a2 + 8);
  if (v10)
  {
    uint64_t v11 = [v18 objectAtIndexedSubscript:0];
    long long v12 = *(_OWORD *)(a2 + 64);
    v17[0] = *(_OWORD *)(a2 + 48);
    v17[1] = v12;
    id v13 = -[FigCaptureDepthDataPipeline _buildDepthDataSinkPipeline:sourceOutput:graph:clientAuditToken:delegate:insertCopier:](a1, v10, v11, a4, v17, a5, (unint64_t)[v18 count] > 1);
    if (v13)
    {
      id v15 = v13;
      fig_log_get_emitter();
      FigDebugAssert3();
      return v15;
    }
    uint64_t v14 = 1;
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (!*(unsigned char *)(a2 + 34)) {
    return 0;
  }
  id v15 = 0;
  a1[8] = (id)[v18 objectAtIndexedSubscript:v14];
  return v15;
}

- (id)_buildDepthDataSinkPipeline:(uint64_t)a3 sourceOutput:(void *)a4 graph:(_OWORD *)a5 clientAuditToken:(uint64_t)a6 delegate:(int)a7 insertCopier:
{
  v29[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    id v13 = result;
    id v28 = 0;
    v27.receiver = result;
    v27.super_class = (Class)FigCaptureDepthDataPipeline;
    objc_msgSendSuper2(&v27, sel_setUpstreamOutput_);
    uint64_t v14 = [BWAttachedMediaSplitNode alloc];
    v29[0] = @"Depth";
    id v15 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:](v14, "initWithAttachedMediaKeys:", [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1]);
    [(BWNode *)v15 setName:@"Depth Splitter"];
    v26.receiver = v13;
    v26.super_class = (Class)FigCaptureDepthDataPipeline;
    if ((objc_msgSendSuper2(&v26, sel_addNode_error_, v15, &v28) & 1) != 0
      && (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", a3, -[BWNode input](v15, "input"), 0) & 1) != 0)
    {
      uint64_t v16 = [(NSArray *)[(BWNode *)v15 outputs] objectAtIndexedSubscript:0];
      if (a7)
      {
        v17 = [[BWPixelTransferNode alloc] initWithfractionalSourceRectEnabled:0];
        [(BWNode *)v17 setName:@"Depth Data Copier"];
        -[BWPixelTransferNode setOutputPixelFormat:](v17, "setOutputPixelFormat:", [a2 outputFormat]);
        v25.receiver = v13;
        v25.super_class = (Class)FigCaptureDepthDataPipeline;
        if ((objc_msgSendSuper2(&v25, sel_addNode_error_, v17, &v28) & 1) == 0
          || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v16, -[BWNode input](v17, "input"), 0) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_18;
        }
        uint64_t v16 = [(BWNode *)v17 output];
      }
      id v18 = [BWRemoteQueueSinkNode alloc];
      uint64_t v19 = [v13 sinkID];
      long long v20 = a5[1];
      v24[0] = *a5;
      v24[1] = v20;
      v21 = [(BWRemoteQueueSinkNode *)v18 initWithMediaType:1986618469 clientAuditToken:v24 sinkID:v19];
      [(BWNode *)v21 setName:@"Depth Data Remote Queue Sink"];
      [(BWRemoteQueueSinkNode *)v21 setDelegate:a6];
      -[BWRemoteQueueSinkNode setDiscardsLateSampleBuffers:](v21, "setDiscardsLateSampleBuffers:", objc_msgSend((id)objc_msgSend(a2, "depthDataSinkConfiguration"), "discardsLateDepthData"));
      -[BWRemoteQueueSinkNode setClientVideoRetainedBufferCount:](v21, "setClientVideoRetainedBufferCount:", [a2 retainedBufferCount]);
      v23.receiver = v13;
      v23.super_class = (Class)FigCaptureDepthDataPipeline;
      if (objc_msgSendSuper2(&v23, sel_addNode_error_, v21, &v28))
      {
        v22.receiver = v13;
        v22.super_class = (Class)FigCaptureDepthDataPipeline;
        objc_msgSendSuper2(&v22, sel_setSinkNode_, v21);
        if (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v16, -[BWNode input](v21, "input"), 0)) {
          goto LABEL_10;
        }
        fig_log_get_emitter();
      }
      else
      {
        fig_log_get_emitter();
      }
    }
    else
    {
      fig_log_get_emitter();
    }
LABEL_18:
    FigDebugAssert3();
LABEL_10:
    result = v28;
    if (v28) {
      return (id)[v28 code];
    }
  }
  return result;
}

- (uint64_t)_buildDepthConversionPipelineWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(uint64_t *)a5 convertedDepthOutputsOut:
{
  v36[1] = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  v9 = (void *)result;
  unsigned int v35 = 0;
  id v34 = 0;
  if (a2)
  {
    v10 = *(void **)(a2 + 8);
    BOOL v11 = *(unsigned char *)(a2 + 34) != 0;
  }
  else
  {
    v10 = 0;
    BOOL v11 = 0;
  }
  uint64_t v12 = FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.depthdata", (void *)[v10 sourceConfiguration]);
  if (a2)
  {
    id v13 = *(BWPipelineStage **)(a2 + 40);
    if (v13)
    {
      BOOL v14 = !v11;
      if (v10) {
        BOOL v14 = 0;
      }
      if (!v14)
      {
        int v15 = v10 != 0 && v11;
        if (v15) {
          uint64_t v16 = 2;
        }
        else {
          uint64_t v16 = 1;
        }
        goto LABEL_20;
      }
LABEL_47:
      fig_log_get_emitter();
      goto LABEL_52;
    }
  }
  v17 = +[BWPipelineStage pipelineStageWithName:v12 priority:13];
  if (v10) {
    char v18 = 1;
  }
  else {
    char v18 = v11;
  }
  if ((v18 & 1) == 0) {
    goto LABEL_47;
  }
  id v13 = v17;
  int v15 = v10 != 0 && v11;
  if (v15) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 1;
  }
  if (!a2)
  {
    FigCaptureMetadataObjectConfigurationRequiresFaceTracking(0);
    uint64_t v24 = 0;
    objc_super v22 = 0;
    long long v20 = 0;
    BOOL v19 = 0;
    v21 = 0;
    uint64_t v23 = 0;
    BOOL v25 = 0;
    goto LABEL_27;
  }
LABEL_20:
  if (FigCaptureMetadataObjectConfigurationRequiresFaceTracking(*(void **)(a2 + 24))) {
    BOOL v19 = *(_DWORD *)(a2 + 104) == 2;
  }
  else {
    BOOL v19 = 0;
  }
  if (!*(unsigned char *)(a2 + 32))
  {
    long long v20 = *(void **)(a2 + 16);
    v21 = *(void **)(a2 + 24);
    uint64_t v23 = *(void *)(a2 + 88);
    objc_super v22 = *(void **)(a2 + 96);
    uint64_t v24 = *(unsigned int *)(a2 + 80);
    BOOL v25 = *(unsigned char *)(a2 + 33) != 0;
LABEL_27:
    objc_super v26 = FigCaptureCreateAndConfigureDepthConverterNode(v10, v20, v21, v22, v23, v24, v25, v19, &v35);
    if (v35)
    {
      fig_log_get_emitter();
      goto LABEL_54;
    }
    objc_super v27 = v26;
    if (v26)
    {
      v33.receiver = v9;
      v33.super_class = (Class)FigCaptureDepthDataPipeline;
      if ((objc_msgSendSuper2(&v33, sel_addNode_error_, v26, &v34) & 1) == 0
        || (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", a3, -[BWNode input](v27, "input"), v13) & 1) == 0)
      {
        fig_log_get_emitter();
        goto LABEL_54;
      }
      v9[7] = v27;
      a3 = [(BWNode *)v27 output];
      if (v15) {
        goto LABEL_32;
      }
      goto LABEL_38;
    }
    fig_log_get_emitter();
LABEL_52:
    FigDebugAssert3();
    unsigned int v35 = -12780;
    goto LABEL_43;
  }
  if (v15)
  {
LABEL_32:
    id v28 = [[BWFanOutNode alloc] initWithFanOutCount:v16 mediaType:1986618469];
    [(BWNode *)v28 setName:@"Depth Splitter"];
    v32.receiver = v9;
    v32.super_class = (Class)FigCaptureDepthDataPipeline;
    if (objc_msgSendSuper2(&v32, sel_addNode_error_, v28, &v34))
    {
      uint64_t v29 = [(BWNode *)v28 input];
      uint64_t v30 = a2 ? *(void *)(a2 + 40) : 0;
      if ([a4 connectOutput:a3 toInput:v29 pipelineStage:v30])
      {
        uint64_t v31 = [(BWNode *)v28 outputs];
        if (!a5) {
          goto LABEL_43;
        }
        goto LABEL_42;
      }
    }
    fig_log_get_emitter();
LABEL_54:
    FigDebugAssert3();
    goto LABEL_43;
  }
LABEL_38:
  if (!a3)
  {
    uint64_t v31 = 0;
    if (!a5) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  v36[0] = a3;
  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  if (a5) {
LABEL_42:
  }
    *a5 = v31;
LABEL_43:
  result = v35;
  if (!v35)
  {
    if (v34) {
      return [v34 code];
    }
  }
  return result;
}

- (BWNodeOutput)videoAndConvertedDepthDataOutput
{
  return self->_videoAndConvertedDepthDataOutput;
}

- (NSString)sourceID
{
  return self->_sourceID;
}

- (int)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (BWPipelineStage)pipelineStage
{
  return self->_pipelineStage;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureDepthDataPipeline;
  [(FigCaptureRemoteQueueSinkPipeline *)&v3 dealloc];
}

@end