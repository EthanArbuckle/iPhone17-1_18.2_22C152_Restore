@interface FigCapturePointCloudDataSinkPipeline
+ (void)initialize;
- (id)_buildPointCloudDataSinkPipelineWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(_OWORD *)a5 clientAuditToken:(uint64_t)a6 delegate:;
- (void)dealloc;
- (void)initWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(uint64_t)a5 name:(_OWORD *)a6 clientAuditToken:(uint64_t)a7 delegate:;
@end

@implementation FigCapturePointCloudDataSinkPipeline

+ (void)initialize
{
}

- (void)initWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(uint64_t)a5 name:(_OWORD *)a6 clientAuditToken:(uint64_t)a7 delegate:
{
  if (!a1) {
    return 0;
  }
  v16.receiver = a1;
  v16.super_class = (Class)FigCapturePointCloudDataSinkPipeline;
  v12 = objc_msgSendSuper2(&v16, sel_initWithGraph_name_sinkID_, a4, a5, objc_msgSend((id)objc_msgSend(a2, "sinkConfiguration"), "sinkID"));
  if (v12)
  {
    v12[7] = (id)objc_msgSend((id)objc_msgSend(a2, "sourceConfiguration"), "sourceID");
    long long v13 = a6[1];
    v15[0] = *a6;
    v15[1] = v13;
    if (-[FigCapturePointCloudDataSinkPipeline _buildPointCloudDataSinkPipelineWithConfiguration:sourceOutput:graph:clientAuditToken:delegate:](v12, a2, a3, a4, v15, a7))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v12;
}

- (id)_buildPointCloudDataSinkPipelineWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(_OWORD *)a5 clientAuditToken:(uint64_t)a6 delegate:
{
  if (result)
  {
    v11 = result;
    id v20 = 0;
    v19.receiver = result;
    v19.super_class = (Class)FigCapturePointCloudDataSinkPipeline;
    objc_msgSendSuper2(&v19, sel_setUpstreamOutput_);
    v12 = [BWRemoteQueueSinkNode alloc];
    uint64_t v13 = [v11 sinkID];
    long long v14 = a5[1];
    v18[0] = *a5;
    v18[1] = v14;
    v15 = [(BWRemoteQueueSinkNode *)v12 initWithMediaType:1885564004 clientAuditToken:v18 sinkID:v13];
    [(BWNode *)v15 setName:@"Point Cloud Data Remote Queue Sink"];
    [(BWRemoteQueueSinkNode *)v15 setDelegate:a6];
    -[BWRemoteQueueSinkNode setDiscardsLateSampleBuffers:](v15, "setDiscardsLateSampleBuffers:", objc_msgSend((id)objc_msgSend(a2, "pointCloudDataSinkConfiguration"), "discardsLatePointCloudData"));
    -[BWRemoteQueueSinkNode setClientVideoRetainedBufferCount:](v15, "setClientVideoRetainedBufferCount:", [a2 retainedBufferCount]);
    v17.receiver = v11;
    v17.super_class = (Class)FigCapturePointCloudDataSinkPipeline;
    if (objc_msgSendSuper2(&v17, sel_addNode_error_, v15, &v20))
    {
      v16.receiver = v11;
      v16.super_class = (Class)FigCapturePointCloudDataSinkPipeline;
      objc_msgSendSuper2(&v16, sel_setSinkNode_, v15);
      if (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", a3, -[BWNode input](v15, "input"), 0)) {
        goto LABEL_4;
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
LABEL_4:
    result = v20;
    if (v20) {
      return (id)[v20 code];
    }
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCapturePointCloudDataSinkPipeline;
  [(FigCaptureRemoteQueueSinkPipeline *)&v3 dealloc];
}

@end