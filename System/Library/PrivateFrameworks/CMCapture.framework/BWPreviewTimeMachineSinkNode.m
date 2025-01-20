@interface BWPreviewTimeMachineSinkNode
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)frameDimensions;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)earliestAllowedPTS;
- (BWPreviewTimeMachineSinkNode)initWithCaptureDevice:(id)a3 processingQueuePriority:(unsigned int)a4 timeMachineCapacity:(int)a5 smartCameraMotionDetectionEnabled:(BOOL)a6 sinkID:(id)a7;
- (id)nodeSubType;
- (uint64_t)_computeMotionDetectionFaceRectForSampleBuffers:(double *)a3 faceMotionRectOut:;
- (uint64_t)_setupStateMachine;
- (uint64_t)_trimToTimeRange:(uint64_t)result;
- (void)dealloc;
- (void)detectMotionOnStoredFramesWithSmartCameraDiagnostics:(id)a3 completionHandler:(id)a4;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)resume;
- (void)setEarliestAllowedPTS:(id *)a3;
- (void)suspendWithPTSRange:(id *)a3 completionHandler:(id)a4;
@end

@implementation BWPreviewTimeMachineSinkNode

+ (void)initialize
{
}

- (BWPreviewTimeMachineSinkNode)initWithCaptureDevice:(id)a3 processingQueuePriority:(unsigned int)a4 timeMachineCapacity:(int)a5 smartCameraMotionDetectionEnabled:(BOOL)a6 sinkID:(id)a7
{
  BOOL v7 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BWPreviewTimeMachineSinkNode;
  v10 = [(BWSinkNode *)&v16 initWithSinkID:a7];
  if (v10)
  {
    v11 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v10];
    v12 = objc_alloc_init(BWVideoFormatRequirements);
    v13 = v12;
    if (v7) {
      [(BWVideoFormatRequirements *)v12 setSupportedPixelFormats:&unk_1EFB02D20];
    }
    [(BWNodeInput *)v11 setFormatRequirements:v13];
    v10->_timeMachineCapacity = a5;
    [(BWNodeInput *)v11 setRetainedBufferCount:(a5 + 1)];
    [(BWNode *)v10 addInput:v11];

    [a3 setPreviewTimeMachineProcessor:v10];
    v10->_device = (BWFigVideoCaptureDevice *)a3;
    v10->_processingQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v10->_timeMachineFrames = (NSMutableArray *)objc_opt_new();
    v10->_timeMachineLock._os_unfair_lock_opaque = 0;
    v14 = (_OWORD *)MEMORY[0x1E4F1F9F8];
    v10->_earliestAllowedPTS.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    *(_OWORD *)&v10->_earliestAllowedPTS.value = *v14;
    v10->_smartCameraMotionDetectionEnabled = v7;
    -[BWPreviewTimeMachineSinkNode _setupStateMachine]((uint64_t)v10);
  }
  return v10;
}

- (uint64_t)_setupStateMachine
{
  if (result)
  {
    uint64_t v1 = result;
    v2 = [[FigStateMachine alloc] initWithLabel:@"BWPreviewTimeMachineStateMachine" stateCount:3 initialState:1 owner:result];
    *(void *)(v1 + 200) = v2;
    [(FigStateMachine *)v2 setPerformsAtomicStateTransitions:0];
    [*(id *)(v1 + 200) setLabel:@"Running" forState:1];
    [*(id *)(v1 + 200) setLabel:@"Suspending" forState:2];
    v3 = *(void **)(v1 + 200);
    return [v3 setLabel:@"Suspended" forState:4];
  }
  return result;
}

- (void)dealloc
{
  [(BWFigVideoCaptureDevice *)self->_device setPreviewTimeMachineProcessor:0];

  id suspendCompletionHandler = 0;
  if (self->_suspendCompletionHandler)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id suspendCompletionHandler = self->_suspendCompletionHandler;
  }

  v4.receiver = self;
  v4.super_class = (Class)BWPreviewTimeMachineSinkNode;
  [(BWSinkNode *)&v4 dealloc];
}

- (id)nodeSubType
{
  return @"SmartCamPreviewTimeMachine";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3 = [[FigCaptureImageMotionDetector alloc] initWithWidth:[(BWVideoFormat *)[(BWNodeInput *)self->super.super._input videoFormat] width] height:[(BWVideoFormat *)[(BWNodeInput *)self->super.super._input videoFormat] height]];
  self->_motionDetector = v3;
  LODWORD(v4) = 1065017672;
  [(FigCaptureImageMotionDetector *)v3 setStationaryThreshold:v4];
  self->_faceMotionDetectionEnabled = 1;
  v5.receiver = self;
  v5.super_class = (Class)BWPreviewTimeMachineSinkNode;
  [(BWNode *)&v5 prepareForCurrentConfigurationToBecomeLive];
}

- (void)setEarliestAllowedPTS:(id *)a3
{
  p_timeMachineLock = &self->_timeMachineLock;
  os_unfair_lock_lock(&self->_timeMachineLock);
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_earliestAllowedPTS.value = *(_OWORD *)&a3->var0;
  self->_earliestAllowedPTS.epoch = var3;
  CMTime start = *(CMTime *)a3;
  CMTime v7 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
  CMTimeRangeMake(&v9, &start, &v7);
  -[BWPreviewTimeMachineSinkNode _trimToTimeRange:]((uint64_t)self, (long long *)&v9.start.value);
  os_unfair_lock_unlock(p_timeMachineLock);
}

- (uint64_t)_trimToTimeRange:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    v3 = *(void **)(result + 184);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __49__BWPreviewTimeMachineSinkNode__trimToTimeRange___block_invoke;
    v5[3] = &__block_descriptor_80_e15_B32__0_8Q16_B24l;
    long long v4 = a2[1];
    long long v6 = *a2;
    long long v7 = v4;
    long long v8 = a2[2];
    return objc_msgSend(*(id *)(v2 + 184), "removeObjectsAtIndexes:", objc_msgSend(v3, "indexesOfObjectsPassingTest:", v5));
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)earliestAllowedPTS
{
  p_timeMachineLock = &self->_timeMachineLock;
  os_unfair_lock_lock(&self->_timeMachineLock);
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_earliestAllowedPTS;
  os_unfair_lock_unlock(p_timeMachineLock);
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)frameDimensions
{
  uint64_t v2 = [(BWNodeInput *)self->super.super._input videoFormat];
  unsigned int v3 = [(BWVideoFormat *)v2 width];
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | ((unint64_t)[(BWVideoFormat *)v2 height] << 32));
}

- (void)detectMotionOnStoredFramesWithSmartCameraDiagnostics:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    if (self->_smartCameraMotionDetectionEnabled)
    {
      os_unfair_lock_lock(&self->_timeMachineLock);
      timeMachineFrames = self->_timeMachineFrames;
      self->_timeMachineFrames = (NSMutableArray *)objc_opt_new();
      os_unfair_lock_unlock(&self->_timeMachineLock);
      processingQueue = self->_processingQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __103__BWPreviewTimeMachineSinkNode_detectMotionOnStoredFramesWithSmartCameraDiagnostics_completionHandler___block_invoke_2;
      block[3] = &unk_1E5C25460;
      block[4] = timeMachineFrames;
      block[5] = self;
      block[6] = a3;
      block[7] = a4;
      dispatch_async(processingQueue, block);
    }
    else
    {
      CMTimeRange v9 = self->_processingQueue;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __103__BWPreviewTimeMachineSinkNode_detectMotionOnStoredFramesWithSmartCameraDiagnostics_completionHandler___block_invoke;
      v11[3] = &unk_1E5C249F0;
      v11[4] = a4;
      dispatch_async(v9, v11);
    }
  }
}

uint64_t __103__BWPreviewTimeMachineSinkNode_detectMotionOnStoredFramesWithSmartCameraDiagnostics_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __103__BWPreviewTimeMachineSinkNode_detectMotionOnStoredFramesWithSmartCameraDiagnostics_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    CGSize v2 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v32.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v32.size = v2;
    v31[0] = v32.origin;
    v31[1] = v2;
    uint64_t v3 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v3 + 296)
      && (int v4 = -[BWPreviewTimeMachineSinkNode _computeMotionDetectionFaceRectForSampleBuffers:faceMotionRectOut:](v3, *(void **)(a1 + 32), &v32.origin.x), v3 = *(void *)(a1 + 40), v4))
    {
      uint64_t v5 = [(id)v3 frameDimensions];
      v36.size.width = (double)(int)v5;
      v36.size.height = (double)SHIDWORD(v5);
      v36.origin.x = 0.0;
      v36.origin.y = 0.0;
      CGRect v32 = CGRectIntersection(v32, v36);
      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 288), "setRoi:actualROI:", v31);
    }
    else
    {
      [*(id *)(v3 + 288) setCentralROIAndGetRect:v31];
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      int v9 = 0;
      uint64_t v10 = *(void *)v28;
      while (2)
      {
        uint64_t v11 = 0;
        uint64_t v12 = v9;
        v9 += v8;
        do
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v6);
          }
          CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(*((void *)&v27 + 1) + 8 * v11));
          if (ImageBuffer
            && ![*(id *)(*(void *)(a1 + 40) + 288) processPixelBuffer:ImageBuffer])
          {
            long long v25 = 0u;
            long long v26 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            v14 = *(void **)(*(void *)(a1 + 40) + 288);
            if (v14)
            {
              [v14 motionStatistics];
              if (BYTE9(v26))
              {
                if (BYTE8(v26))
                {
                  v18 = *(void **)(a1 + 48);
                  long long v19 = v23;
                  long long v20 = v24;
                  long long v21 = v25;
                  long long v22 = v26;
                  [v18 addMotionStats:&v19];
                  goto LABEL_25;
                }
              }
            }
            if (v12 + v11 == [*(id *)(a1 + 32) count] - 1)
            {
              v15 = *(void **)(a1 + 48);
              long long v19 = v23;
              long long v20 = v24;
              long long v21 = v25;
              long long v22 = v26;
              [v15 addMotionStats:&v19];
            }
          }
          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_25:
    [*(id *)(*(void *)(a1 + 40) + 288) resetProcessingState];
    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    objc_super v16 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v16();
  }
}

- (uint64_t)_computeMotionDetectionFaceRectForSampleBuffers:(double *)a3 faceMotionRectOut:
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!*(unsigned char *)(a1 + 298))
  {
    fig_log_get_emitter();
    uint64_t v55 = v3;
    LODWORD(v54) = 0;
    FigDebugAssert3();
  }
  long long v6 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v60 objects:v73 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v61;
    CFStringRef v11 = (const __CFString *)*MEMORY[0x1E4F53070];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v61 != v10) {
          objc_enumerationMutation(a2);
        }
        v13 = *(const void **)(*((void *)&v60 + 1) + 8 * i);
        CFTypeRef v14 = CMGetAttachment(v13, v11, 0);
        if (v14)
        {
          [v6 addObject:v14];
          if (!v9) {
            int v9 = objc_msgSend((id)CMGetAttachment(v13, @"UprightExifOrientation", 0), "intValue");
          }
        }
      }
      uint64_t v8 = [a2 countByEnumeratingWithState:&v60 objects:v73 count:16];
    }
    while (v8);
  }
  if (objc_msgSend(v6, "count", v54, v55))
  {
    uint64_t v15 = [(id)a1 frameDimensions];
    if (v6 && (uint64_t v16 = v15, v17 = *(_DWORD *)(a1 + 300), v18 = *(unsigned __int8 *)(a1 + 304), [v6 count]))
    {
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v19 = (void *)[v6 reverseObjectEnumerator];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v69 objects:v74 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        int v56 = v18;
        int v57 = v17;
        uint64_t v22 = *(void *)v70;
        uint64_t v23 = *MEMORY[0x1E4F53ED0];
        uint64_t v24 = *MEMORY[0x1E4F53EC8];
        uint64_t v25 = MEMORY[0x1E4F1DB20];
LABEL_19:
        uint64_t v26 = 0;
        while (1)
        {
          if (*(void *)v70 != v22) {
            objc_enumerationMutation(v19);
          }
          long long v27 = *(void **)(*((void *)&v69 + 1) + 8 * v26);
          if (objc_msgSend((id)objc_msgSend(v27, "objectForKeyedSubscript:", v23), "intValue") == 2)
          {
            long long v28 = (void *)[v27 objectForKeyedSubscript:v24];
            CGSize v29 = *(CGSize *)(v25 + 16);
            rect.origin = *(CGPoint *)v25;
            rect.size = v29;
            if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v28 firstObject], &rect)) {
              break;
            }
          }
          if (v21 == ++v26)
          {
            uint64_t v21 = [v19 countByEnumeratingWithState:&v69 objects:v74 count:16];
            if (v21) {
              goto LABEL_19;
            }
            goto LABEL_40;
          }
        }
        memset(&v67, 0, sizeof(v67));
        BWGetAffineTransformFromSensorToPreview(v57, v56 != 0, v27, (uint64_t)&v67);
        double v30 = (double)SHIDWORD(v16);
        CGAffineTransformMakeScale(&t2, (double)(int)v16, (double)SHIDWORD(v16));
        CGAffineTransform t1 = v67;
        CGAffineTransformConcat(&v66, &t1, &t2);
        CGAffineTransform v67 = v66;
        CGRect v76 = CGRectApplyAffineTransform(rect, &v66);
        CGFloat width = v76.size.width;
        CGFloat height = v76.size.height;
        double v33 = v76.size.width * 1.4;
        double v34 = v76.size.height * 1.4;
        if ((int)v16 <= SHIDWORD(v16)) {
          int v35 = HIDWORD(v16);
        }
        else {
          int v35 = v16;
        }
        double v36 = (double)v35;
        if (v33 <= v34) {
          double v37 = v76.size.height * 1.4;
        }
        else {
          double v37 = v76.size.width * 1.4;
        }
        if (v33 >= v34) {
          double v38 = v76.size.height * 1.4;
        }
        else {
          double v38 = v76.size.width * 1.4;
        }
        double v39 = v36 * 0.5;
        double v40 = v36 * 0.5 / v37;
        if (v37 <= v36 * 0.5) {
          double v40 = 1.0;
        }
        double v41 = v36 * 0.25;
        if (v38 < v41)
        {
          if (v37 > v39) {
            goto LABEL_40;
          }
          double v40 = v41 / v38;
        }
        double v58 = v33 * v40;
        double v44 = v34 * v40;
        CGFloat v45 = width;
        CGFloat v46 = height;
        CGFloat x = v76.origin.x;
        CGFloat y = v76.origin.y;
        double MidX = CGRectGetMidX(v76);
        v77.origin.CGFloat x = x;
        v77.origin.CGFloat y = y;
        v77.size.CGFloat width = width;
        v77.size.CGFloat height = height;
        double v50 = MidX - v58 * 0.5;
        double v51 = CGRectGetMidY(v77) - v44 * 0.5;
        v78.origin.CGFloat x = 0.0;
        v78.origin.CGFloat y = 0.0;
        v78.size.CGFloat width = (double)(int)v16;
        v78.size.CGFloat height = (double)SHIDWORD(v16);
        v82.origin.CGFloat x = v50;
        v82.origin.CGFloat y = v51;
        v82.size.CGFloat width = v58;
        v82.size.CGFloat height = v44;
        CGRect v79 = CGRectIntersection(v78, v82);
        v83.origin.CGFloat x = v50;
        v83.origin.CGFloat y = v51;
        v83.size.CGFloat width = v58;
        v83.size.CGFloat height = v44;
        if (!CGRectEqualToRect(v79, v83))
        {
          double v52 = (double)(int)v16;
          if (v50 >= 0.0) {
            double v53 = v50;
          }
          else {
            double v53 = 0.0;
          }
          v80.origin.CGFloat x = v53;
          v80.origin.CGFloat y = v51;
          v80.size.CGFloat width = v58;
          v80.size.CGFloat height = v44;
          if (CGRectGetMaxX(v80) <= v52) {
            double v50 = v53;
          }
          else {
            double v50 = v52 - v58;
          }
          if (v51 < 0.0) {
            double v51 = 0.0;
          }
          v81.origin.CGFloat x = v50;
          v81.origin.CGFloat y = v51;
          v81.size.CGFloat width = v58;
          v81.size.CGFloat height = v44;
          if (CGRectGetMaxY(v81) > v30) {
            double v51 = v30 - v44;
          }
        }
        if (a3)
        {
          *a3 = v50;
          a3[1] = v51;
          uint64_t v42 = 1;
          a3[2] = v58;
          a3[3] = v44;
        }
        else
        {
          uint64_t v42 = 1;
        }
        goto LABEL_41;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
LABEL_40:
  uint64_t v42 = 0;
LABEL_41:

  return v42;
}

- (void)suspendWithPTSRange:(id *)a3 completionHandler:(id)a4
{
  if ((a3->var0.var2 & 1) == 0 || (a3->var1.var2 & 1) == 0 || a3->var1.var3 || a3->var1.var0 < 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v7 = 1;
    if (!a4) {
      return;
    }
    goto LABEL_5;
  }
  os_unfair_lock_lock(&self->_timeMachineLock);
  BOOL v9 = [(FigStateMachine *)self->_stateMachine transitionToState:2 fromState:1];
  if (v9)
  {
    long long v11 = *(_OWORD *)&a3->var0.var3;
    long long v10 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&self->_requestedSuspendPTSRange.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&self->_requestedSuspendPTSRange.start.epoch = v11;
    *(_OWORD *)&self->_requestedSuspendPTSRange.duration.timescale = v10;
    id suspendCompletionHandler = self->_suspendCompletionHandler;
    if (suspendCompletionHandler)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      id suspendCompletionHandler = self->_suspendCompletionHandler;
    }

    self->_id suspendCompletionHandler = (id)[a4 copy];
  }
  int v7 = !v9;
  os_unfair_lock_unlock(&self->_timeMachineLock);
  if (a4)
  {
LABEL_5:
    if (v7)
    {
      processingQueue = self->_processingQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __70__BWPreviewTimeMachineSinkNode_suspendWithPTSRange_completionHandler___block_invoke;
      block[3] = &unk_1E5C249F0;
      block[4] = a4;
      dispatch_async(processingQueue, block);
    }
  }
}

uint64_t __70__BWPreviewTimeMachineSinkNode_suspendWithPTSRange_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(uint64_t (**)(uint64_t, void, void, void, _OWORD *, uint64_t))(v6 + 16);
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v10[0] = *MEMORY[0x1E4F1DAB8];
  v10[1] = v8;
  v10[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return v7(v6, 0, 0, 0, v10, a6);
}

- (void)resume
{
  p_timeMachineLock = &self->_timeMachineLock;
  os_unfair_lock_lock(&self->_timeMachineLock);
  [(FigStateMachine *)self->_stateMachine currentState];
  [(FigStateMachine *)self->_stateMachine transitionToState:1];
  os_unfair_lock_unlock(p_timeMachineLock);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__BWPreviewTimeMachineSinkNode_didReachEndOfDataForInput___block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(processingQueue, block);
  v6.receiver = self;
  v6.super_class = (Class)BWPreviewTimeMachineSinkNode;
  [(BWSinkNode *)&v6 didReachEndOfDataForInput:a3];
}

void __58__BWPreviewTimeMachineSinkNode_didReachEndOfDataForInput___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 168) setPreviewTimeMachineProcessor:0];

  *(void *)(*(void *)(a1 + 32) + 168) = 0;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 192));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 280);
  if (v3)
  {
    int v4 = *(void (**)(uint64_t, void, void, void, _OWORD *))(v3 + 16);
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v6[0] = *MEMORY[0x1E4F1DAB8];
    v6[1] = v5;
    v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v4(v3, 0, 0, 0, v6);

    *(void *)(*(void *)(a1 + 32) + 280) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 184) removeAllObjects];

  *(void *)(*(void *)(a1 + 32) + 184) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 192));
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  p_timeMachineLock = &self->_timeMachineLock;
  os_unfair_lock_lock(&self->_timeMachineLock);
  unsigned int v7 = [(FigStateMachine *)self->_stateMachine currentState];
  if (v7 == 4)
  {
    os_unfair_lock_unlock(p_timeMachineLock);
    BOOL v8 = 0;
  }
  else
  {
    unsigned int v9 = v7;
    if ((self->_earliestAllowedPTS.flags & 1) != 0
      && (ptmsn_getSampleBufferPTS(a3, (uint64_t)&time1),
          *(_OWORD *)&time2.start.value = *(_OWORD *)&self->_earliestAllowedPTS.value,
          time2.start.CMTimeEpoch epoch = self->_earliestAllowedPTS.epoch,
          CMTimeCompare(&time1, &time2.start) < 0)
      || ([(NSMutableArray *)self->_timeMachineFrames addObject:a3],
          [(NSMutableArray *)self->_timeMachineFrames count] <= (unint64_t)self->_timeMachineCapacity))
    {
      BOOL v8 = v9 == 2;
      os_unfair_lock_unlock(p_timeMachineLock);
    }
    else
    {
      CFTypeRef v10 = CFRetain((CFTypeRef)[(NSMutableArray *)self->_timeMachineFrames firstObject]);
      [(NSMutableArray *)self->_timeMachineFrames removeObjectAtIndex:0];
      BOOL v8 = v9 == 2;
      os_unfair_lock_unlock(p_timeMachineLock);
      if (v10) {
        CFRelease(v10);
      }
    }
  }
  if (!self->_haveFrameRotationAndMirror)
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    if (ImageBuffer)
    {
      BWGetPixelBufferRotationAndMirroring(ImageBuffer, &self->_frameRotationDegrees, &self->_frameMirrored);
      self->_haveFrameRotationAndMirror = 1;
    }
  }
  if (v8)
  {
    memset(&v41, 0, sizeof(v41));
    CMTimeMake(&v41, 1, 1000);
    os_unfair_lock_lock(p_timeMachineLock);
    if ([(FigStateMachine *)self->_stateMachine currentState] == 2)
    {
      long long v26 = *MEMORY[0x1E4F1FA48];
      long long v39 = *MEMORY[0x1E4F1FA48];
      CMTimeEpoch v12 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      CMTimeEpoch epoch = v12;
      long long v13 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      *(_OWORD *)&time2.start.value = *MEMORY[0x1E4F1FA20];
      *(_OWORD *)&time2.start.CMTimeEpoch epoch = v13;
      *(_OWORD *)&time2.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
      if (![(NSMutableArray *)self->_timeMachineFrames count])
      {
        p_earliestAllowedPTS = &self->_earliestAllowedPTS;
        if ((self->_earliestAllowedPTS.flags & 1) == 0)
        {
LABEL_20:
          *(_OWORD *)&lhs.start.value = *(_OWORD *)&time2.start.value;
          lhs.start.CMTimeEpoch epoch = time2.start.epoch;
          rhs.CMTimeRange start = v41;
          CMTimeSubtract(&start.start, &lhs.start, &rhs.start);
          *(_OWORD *)&time2.start.value = *(_OWORD *)&start.start.value;
          time2.start.CMTimeEpoch epoch = start.start.epoch;
          start.CMTimeRange start = v41;
          CMTimeMultiply(&v36, &start.start, 2);
          lhs.CMTimeRange start = time2.duration;
          CMTimeAdd(&start.start, &lhs.start, &v36);
          time2.duration = start.start;
          long long v18 = *(_OWORD *)&self->_requestedSuspendPTSRange.start.epoch;
          *(_OWORD *)&start.start.value = *(_OWORD *)&self->_requestedSuspendPTSRange.start.value;
          *(_OWORD *)&start.start.CMTimeEpoch epoch = v18;
          long long v20 = *(_OWORD *)&self->_requestedSuspendPTSRange.start.value;
          long long v19 = *(_OWORD *)&self->_requestedSuspendPTSRange.start.epoch;
          *(_OWORD *)&start.duration.timescale = *(_OWORD *)&self->_requestedSuspendPTSRange.duration.timescale;
          CMTimeRange lhs = time2;
          *(_OWORD *)&rhs.start.value = v20;
          *(_OWORD *)&rhs.start.CMTimeEpoch epoch = v19;
          *(_OWORD *)&rhs.duration.timescale = *(_OWORD *)&self->_requestedSuspendPTSRange.duration.timescale;
          int v21 = CMTimeRangeContainsTimeRange(&lhs, &rhs);
          CMTimeRange lhs = start;
          CMTimeRangeGetEnd(&time, &lhs);
          CMTimeRange lhs = time2;
          int v22 = CMTimeRangeContainsTime(&lhs, &time);
          CMTimeRange lhs = start;
          CMTimeRangeGetEnd(&v31, &lhs);
          *(_OWORD *)&lhs.start.value = v39;
          lhs.start.CMTimeEpoch epoch = epoch;
          int32_t v23 = CMTimeCompare(&v31, &lhs.start);
          if (v21 || v22 || v23 < 0)
          {
            [(FigStateMachine *)self->_stateMachine transitionToState:4];
            id suspendCompletionHandler = self->_suspendCompletionHandler;
            self->_id suspendCompletionHandler = 0;
            if (suspendCompletionHandler)
            {
              processingQueue = self->_processingQueue;
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __60__BWPreviewTimeMachineSinkNode_renderSampleBuffer_forInput___block_invoke;
              block[3] = &unk_1E5C25488;
              CMTimeRange v28 = start;
              CMTime v29 = v41;
              block[4] = self;
              void block[5] = suspendCompletionHandler;
              BOOL v30 = v21 != 0;
              dispatch_async(processingQueue, block);
            }
          }
          goto LABEL_25;
        }
        long long v39 = *(_OWORD *)&p_earliestAllowedPTS->value;
        CMTimeEpoch epoch = self->_earliestAllowedPTS.epoch;
        *(_OWORD *)&start.start.value = *(_OWORD *)&p_earliestAllowedPTS->value;
        start.start.CMTimeEpoch epoch = self->_earliestAllowedPTS.epoch;
        *(_OWORD *)&lhs.start.value = v26;
        lhs.start.CMTimeEpoch epoch = v12;
        p_CMTimeRange start = &start;
        p_CMTimeRange lhs = &lhs;
LABEL_19:
        CMTimeRangeMake(&time2, &p_start->start, &p_lhs->start);
        goto LABEL_20;
      }
      double SampleBufferPTS = ptmsn_getSampleBufferPTS((void *)[(NSMutableArray *)self->_timeMachineFrames firstObject], (uint64_t)&v39);
      memset(&start, 0, 24);
      ptmsn_getSampleBufferPTS((void *)[(NSMutableArray *)self->_timeMachineFrames lastObject], (uint64_t)&start);
      *(_OWORD *)&lhs.start.value = v39;
      lhs.start.CMTimeEpoch epoch = epoch;
      *(_OWORD *)&rhs.start.value = *(_OWORD *)&start.start.value;
      rhs.start.CMTimeEpoch epoch = start.start.epoch;
      if (CMTimeCompare(&lhs.start, &rhs.start) <= 0)
      {
        *(_OWORD *)&lhs.start.value = *(_OWORD *)&start.start.value;
        lhs.start.CMTimeEpoch epoch = start.start.epoch;
        *(_OWORD *)&rhs.start.value = v39;
        rhs.start.CMTimeEpoch epoch = epoch;
        CMTimeSubtract(&v37, &lhs.start, &rhs.start);
        *(_OWORD *)&lhs.start.value = v39;
        lhs.start.CMTimeEpoch epoch = epoch;
        p_CMTimeRange start = &lhs;
        p_CMTimeRange lhs = (CMTimeRange *)&v37;
        goto LABEL_19;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
    }
LABEL_25:
    os_unfair_lock_unlock(p_timeMachineLock);
  }
}

void __60__BWPreviewTimeMachineSinkNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = objc_opt_new();
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 192));
  long long v4 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v31[0].value = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v31[0].CMTimeEpoch epoch = v4;
  long long v5 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)&v31[1].timescale = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&lhs.start.value = *(_OWORD *)&v31[0].value;
  lhs.start.CMTimeEpoch epoch = *(void *)(a1 + 64);
  *(_OWORD *)&rhs.value = v5;
  rhs.CMTimeEpoch epoch = *(void *)(a1 + 112);
  CMTimeSubtract(v31, &lhs.start, &rhs);
  *(_OWORD *)&lhs.start.value = *(_OWORD *)(a1 + 96);
  lhs.start.CMTimeEpoch epoch = *(void *)(a1 + 112);
  CMTimeMultiply(&v29, &lhs.start, 2);
  CMTime rhs = v31[1];
  CMTimeAdd(&lhs.start, &rhs, &v29);
  v31[1] = lhs.start;
  objc_super v6 = (void *)[MEMORY[0x1E4F28E60] indexSet];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v22 = a1;
  unsigned int v7 = *(void **)(*(void *)(a1 + 32) + 184);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v26;
    CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F53070];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v7);
        }
        CFTypeRef v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        memset(&rhs, 0, sizeof(rhs));
        ptmsn_getSampleBufferPTS(v14, (uint64_t)&rhs);
        CMTimeRange lhs = *(CMTimeRange *)&v31[0].value;
        CMTime time = rhs;
        if (CMTimeRangeContainsTime(&lhs, &time))
        {
          CFTypeRef v15 = CMGetAttachment(v14, v12, 0);
          if (v15)
          {
            [v2 addObject:v15];
            [v3 addObject:v14];
          }
        }
        else
        {
          [v6 addIndex:v10 + i];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v32 count:16];
      v10 += i;
    }
    while (v9);
  }
  [*(id *)(*(void *)(v22 + 32) + 184) removeObjectsAtIndexes:v6];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v22 + 32) + 192));
  long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v31[0].value = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v31[0].CMTimeEpoch epoch = v16;
  *(_OWORD *)&v31[1].timescale = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  if ([v2 count])
  {
    uint64_t v17 = *(void *)(v22 + 32);
    if (!*(unsigned char *)(v17 + 298))
    {
      fig_log_get_emitter();
      uint64_t v20 = v21;
      LODWORD(v19) = 0;
      FigDebugAssert3();
      uint64_t v17 = *(void *)(v22 + 32);
    }
    BWGetAffineTransformFromSensorToPreview(*(_DWORD *)(v17 + 300), *(unsigned __int8 *)(v17 + 304), objc_msgSend(v2, "lastObject", v19, v20), (uint64_t)v31);
  }
  long long v18 = *(void (**)(void))(*(void *)(v22 + 40) + 16);
  CMTimeRange lhs = *(CMTimeRange *)&v31[0].value;
  v18();
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a3, "reason"), "isEqualToString:", 0x1EFA67EC0))
  {
    os_unfair_lock_lock(&self->_timeMachineLock);
    if ([(NSMutableArray *)self->_timeMachineFrames count])
    {
      timeMachineFrames = self->_timeMachineFrames;
      self->_timeMachineFrames = (NSMutableArray *)objc_opt_new();
    }
    else
    {
      timeMachineFrames = 0;
    }
    os_unfair_lock_unlock(&self->_timeMachineLock);
  }
  v8.receiver = self;
  v8.super_class = (Class)BWPreviewTimeMachineSinkNode;
  [(BWNode *)&v8 handleDroppedSample:a3 forInput:a4];
}

BOOL __49__BWPreviewTimeMachineSinkNode__trimToTimeRange___block_invoke(_OWORD *a1, void *a2)
{
  ptmsn_getSampleBufferPTS(a2, (uint64_t)&time);
  long long v3 = a1[3];
  *(_OWORD *)&v5.start.value = a1[2];
  *(_OWORD *)&v5.start.CMTimeEpoch epoch = v3;
  *(_OWORD *)&v5.duration.timescale = a1[4];
  return CMTimeRangeContainsTime(&v5, &time) == 0;
}

@end