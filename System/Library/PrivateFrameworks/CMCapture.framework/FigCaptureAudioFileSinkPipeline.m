@interface FigCaptureAudioFileSinkPipeline
+ (void)initialize;
- (id)_buildAudioFileSinkPipeline:(void *)a3 graph:(uint64_t)a4 sourceAudioOutput:(uint64_t)a5 recordingStatusDelegate:;
- (id)initWithConfiguration:(void *)a3 graph:(uint64_t)a4 name:(uint64_t)a5 sourceAudioOutput:(uint64_t)a6 recordingStatusDelegate:;
- (uint64_t)audioFileSinkNode;
- (uint64_t)fileCoordinatorNode;
- (void)dealloc;
@end

@implementation FigCaptureAudioFileSinkPipeline

+ (void)initialize
{
}

- (id)initWithConfiguration:(void *)a3 graph:(uint64_t)a4 name:(uint64_t)a5 sourceAudioOutput:(uint64_t)a6 recordingStatusDelegate:
{
  if (!a1) {
    return 0;
  }
  v13.receiver = a1;
  v13.super_class = (Class)FigCaptureAudioFileSinkPipeline;
  v9 = (id *)objc_msgSendSuper2(&v13, sel_initWithGraph_name_sinkID_, a3, a4, objc_msgSend((id)objc_msgSend(a2, "sinkConfiguration"), "sinkID"));
  v11 = v9;
  if (v9
    && -[FigCaptureAudioFileSinkPipeline _buildAudioFileSinkPipeline:graph:sourceAudioOutput:recordingStatusDelegate:](v9, v10, a3, a5, a6))
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    return 0;
  }
  return v11;
}

- (id)_buildAudioFileSinkPipeline:(void *)a3 graph:(uint64_t)a4 sourceAudioOutput:(uint64_t)a5 recordingStatusDelegate:
{
  if (result)
  {
    v8 = result;
    v20 = 0;
    v9 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.audiofile" priority:14];
    LOBYTE(v16) = 0;
    uint64_t v10 = [[BWFileCoordinatorNode alloc] initWithNumberOfVideoInputs:0 numberOfAudioInputs:1 numberOfMetadataInputs:0 numberOfActionOnlyOutputs:0 overCaptureEnabled:0 allowLowLatencyWhenPossible:1 useTrueVideoFileRecordingStaging:v16 motionDataTimeMachine:0];
    v19.receiver = v8;
    v19.super_class = (Class)FigCaptureAudioFileSinkPipeline;
    if (objc_msgSendSuper2(&v19, sel_addNode_error_, v10, &v20))
    {
      v11 = v10;
      v8[6] = v11;
      if (!a4)
      {
LABEL_6:
        v12 = objc_alloc_init(BWAudioConverterNode);
        v18.receiver = v8;
        v18.super_class = (Class)FigCaptureAudioFileSinkPipeline;
        if ((objc_msgSendSuper2(&v18, sel_addNode_error_, v12, &v20) & 1) != 0
          && (objc_super v13 = v12,
              v8[7] = v13,
              (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a4, -[BWNode input](v13, "input"), v9) & 1) != 0))
        {
          uint64_t v14 = [v8[7] output];
          v15 = -[BWAudioFileSinkNode initWithSinkID:]([BWAudioFileSinkNode alloc], "initWithSinkID:", [v8 sinkID]);
          v17.receiver = v8;
          v17.super_class = (Class)FigCaptureAudioFileSinkPipeline;
          if (objc_msgSendSuper2(&v17, sel_addNode_error_, v15, &v20))
          {
            v8[8] = v15;
            [(BWFileSinkNode *)v15 setRecordingStatusDelegate:a5];
            if (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", v14, objc_msgSend(v8[8], "input"), v9)) {
              goto LABEL_10;
            }
          }
          fig_log_get_emitter();
        }
        else
        {
          fig_log_get_emitter();
        }
LABEL_19:
        FigDebugAssert3();
LABEL_10:
        result = v20;
        if (v20) {
          return (id *)[v20 code];
        }
        return result;
      }
      if (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a4, -[BWNode input](v11, "input"), v9))
      {
        a4 = [v8[6] output];
        goto LABEL_6;
      }
    }
    fig_log_get_emitter();
    goto LABEL_19;
  }
  return result;
}

- (void)dealloc
{
  [(BWFileSinkNode *)self->_audioFileSinkNode setRecordingStatusDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureAudioFileSinkPipeline;
  [(FigCaptureSinkPipeline *)&v3 dealloc];
}

- (uint64_t)fileCoordinatorNode
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)audioFileSinkNode
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

@end