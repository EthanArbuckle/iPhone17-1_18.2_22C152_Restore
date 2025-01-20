@interface FigCaptureVisionDataSinkPipeline
+ (void)initialize;
- (id)_buildVisionDataSinkPipeline:(uint64_t)a3 videoDataConnectionConfiguration:(void *)a4 graph:(uint64_t)a5 visionCaptureOutput:(_OWORD *)a6 clientAuditToken:(uint64_t)a7 delegate:;
- (uint64_t)setKeypointDetectionThreshold:(uint64_t)result;
- (uint64_t)setRuntimeUpdates:(uint64_t)result;
- (uint64_t)triggerVisionDataBurst;
- (void)dealloc;
- (void)initWithVisionDataConnectionConfiguration:(uint64_t)a3 videoDataConnectionConfiguration:(void *)a4 graph:(uint64_t)a5 name:(uint64_t)a6 visionCaptureOutput:(void *)a7 captureDevice:(_OWORD *)a8 clientAuditToken:(uint64_t)a9 delegate:;
@end

@implementation FigCaptureVisionDataSinkPipeline

+ (void)initialize
{
}

- (void)initWithVisionDataConnectionConfiguration:(uint64_t)a3 videoDataConnectionConfiguration:(void *)a4 graph:(uint64_t)a5 name:(uint64_t)a6 visionCaptureOutput:(void *)a7 captureDevice:(_OWORD *)a8 clientAuditToken:(uint64_t)a9 delegate:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v44.receiver = a1;
  v44.super_class = (Class)FigCaptureVisionDataSinkPipeline;
  v14 = objc_msgSendSuper2(&v44, sel_initWithGraph_name_sinkID_, a4, a5, objc_msgSend((id)objc_msgSend(a2, "sinkConfiguration"), "sinkID"));
  if (v14)
  {
    v31 = a8;
    v33 = a4;
    uint64_t v34 = a6;
    v14[8] = (id)objc_msgSend((id)objc_msgSend(a2, "sourceConfiguration"), "sourceID");
    v32 = a2;
    *((_DWORD *)v14 + 18) = [a2 underlyingDeviceType];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v15 = (void *)[a7 captureStreams];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v45 count:16];
    v17 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
    if (!v16) {
      goto LABEL_21;
    }
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v41;
    uint64_t v20 = *MEMORY[0x1E4F52E10];
    uint64_t v37 = *MEMORY[0x1E4F52DE8];
    uint64_t v36 = *MEMORY[0x1E4F52DF0];
    uint64_t v21 = *MEMORY[0x1E4F52DD8];
    uint64_t v35 = *MEMORY[0x1E4F52DF8];
LABEL_5:
    uint64_t v22 = 0;
    while (2)
    {
      if (*(void *)v41 != v19) {
        objc_enumerationMutation(v15);
      }
      v23 = *(void **)(*((void *)&v40 + 1) + 8 * v22);
      v24 = (void *)[v23 portType];
      v25 = v24;
      switch(*((_DWORD *)v14 + 18))
      {
        case 2:
          if ([v24 isEqualToString:v21]) {
            goto LABEL_20;
          }
          v24 = v25;
          uint64_t v26 = v35;
          goto LABEL_14;
        case 3:
          uint64_t v26 = v36;
          goto LABEL_14;
        case 7:
          if ([v24 isEqualToString:v37]) {
            goto LABEL_20;
          }
          v24 = v25;
          uint64_t v26 = v20;
LABEL_14:
          if ([v24 isEqualToString:v26])
          {
LABEL_20:
            id v27 = v23;
            v17 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
            v14[7] = v27;
            goto LABEL_21;
          }
LABEL_17:
          if (v18 != ++v22) {
            continue;
          }
          uint64_t v18 = [v15 countByEnumeratingWithState:&v40 objects:v45 count:16];
          v17 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
          if (v18) {
            goto LABEL_5;
          }
LABEL_21:
          if (*(void *)((char *)v14 + v17[537]))
          {
            v39.receiver = v14;
            v39.super_class = (Class)FigCaptureVisionDataSinkPipeline;
            objc_msgSendSuper2(&v39, sel_setUpstreamOutput_, v34);
            long long v28 = v31[1];
            v38[0] = *v31;
            v38[1] = v28;
            if (!-[FigCaptureVisionDataSinkPipeline _buildVisionDataSinkPipeline:videoDataConnectionConfiguration:graph:visionCaptureOutput:clientAuditToken:delegate:](v14, v32, v29, v33, v34, v38, a9))return v14; {
            fig_log_get_emitter();
            }
          }
          else
          {
            fig_log_get_emitter();
          }
          FigDebugAssert3();

          break;
        case 0xB:
          if (![v24 isEqualToString:v20]) {
            goto LABEL_17;
          }
          goto LABEL_20;
        default:
          goto LABEL_17;
      }
      return 0;
    }
  }
  return v14;
}

- (id)_buildVisionDataSinkPipeline:(uint64_t)a3 videoDataConnectionConfiguration:(void *)a4 graph:(uint64_t)a5 visionCaptureOutput:(_OWORD *)a6 clientAuditToken:(uint64_t)a7 delegate:
{
  if (result)
  {
    v12 = result;
    id v21 = 0;
    v13 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", FigCaptureBuildPipelineStageName(@"com.apple.coremedia.capture.visiondata", (void *)[a2 sourceConfiguration]), 13);
    v14 = [BWRemoteQueueSinkNode alloc];
    uint64_t v15 = [v12 sinkID];
    long long v16 = a6[1];
    v20[0] = *a6;
    v20[1] = v16;
    v17 = [(BWRemoteQueueSinkNode *)v14 initWithMediaType:1986618469 clientAuditToken:v20 sinkID:v15];
    [(BWNode *)v17 setName:@"Vision Data Remote Queue Sink"];
    [(BWRemoteQueueSinkNode *)v17 setDelegate:a7];
    [(BWRemoteQueueSinkNode *)v17 setDiscardsLateSampleBuffers:0];
    -[BWRemoteQueueSinkNode setClientVideoRetainedBufferCount:](v17, "setClientVideoRetainedBufferCount:", [a2 retainedBufferCount]);
    v19.receiver = v12;
    v19.super_class = (Class)FigCaptureVisionDataSinkPipeline;
    if ((objc_msgSendSuper2(&v19, sel_addNode_error_, v17, &v21) & 1) != 0
      && (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", a5, -[BWNode input](v17, "input"), v13) & 1) != 0)
    {
      v18.receiver = v12;
      v18.super_class = (Class)FigCaptureVisionDataSinkPipeline;
      objc_msgSendSuper2(&v18, sel_setSinkNode_, v17);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    result = v21;
    if (v21) {
      return (id)[v21 code];
    }
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureVisionDataSinkPipeline;
  [(FigCaptureRemoteQueueSinkPipeline *)&v3 dealloc];
}

- (uint64_t)triggerVisionDataBurst
{
  if (result) {
    return [*(id *)(result + 56) triggerVisionDataBurst];
  }
  return result;
}

- (uint64_t)setRuntimeUpdates:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 56) setRuntimeUpdates:a2];
  }
  return result;
}

- (uint64_t)setKeypointDetectionThreshold:(uint64_t)result
{
  if (result) {
    return objc_msgSend(*(id *)(result + 56), "setVisionDataKeypointDetectionThreshold:");
  }
  return result;
}

@end