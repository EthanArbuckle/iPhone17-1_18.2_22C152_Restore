@interface BWOverCaptureAttachedMediaSplitNode
+ (void)initialize;
- (BWNodeOutput)primaryFrameOutput;
- (BWNodeOutput)synchronizedSlaveFrameOutput;
- (BWOverCaptureAttachedMediaSplitNode)initWithBackPressureExtraRetainBufferCount:(int)a3;
- (id)_handleIrisMovieRequestForInput:(uint64_t)a3 sbuf:;
- (id)_updateSynchronizedSlaveFrameEnabledWithSampleBuffer:(id)result;
- (void)dealloc;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWOverCaptureAttachedMediaSplitNode

+ (void)initialize
{
}

- (BWOverCaptureAttachedMediaSplitNode)initWithBackPressureExtraRetainBufferCount:(int)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"PrimaryFormat";
  v11[1] = @"SynchronizedSlaveFrame";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v10.receiver = self;
  v10.super_class = (Class)BWOverCaptureAttachedMediaSplitNode;
  v6 = [(BWAttachedMediaSplitNode *)&v10 initWithAttachedMediaKeys:v5 attachedMediaToPropagateToPrimaryOutput:MEMORY[0x1E4F1CBF0]];
  v7 = v6;
  if (v6)
  {
    v6->_primaryFrameOutput = (BWNodeOutput *)[(NSArray *)[(BWNode *)v6 outputs] objectAtIndexedSubscript:0];
    v7->_synchronizedSlaveFrameOutput = (BWNodeOutput *)[(NSArray *)[(BWNode *)v7 outputs] objectAtIndexedSubscript:1];
    [(BWNodeInput *)v7->super.super.super._input setRetainedBufferCount:[(BWNodeInput *)v7->super.super.super._input retainedBufferCount] + a3];
    id v8 = [(BWNodeInput *)v7->super.super.super._input mediaConfigurationForAttachedMediaKey:@"SynchronizedSlaveFrame"];
    objc_msgSend(v8, "setRetainedBufferCount:", objc_msgSend(v8, "retainedBufferCount") + a3);
  }
  return v7;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BWOverCaptureAttachedMediaSplitNode;
  [(BWAttachedMediaSplitNode *)&v2 dealloc];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  -[BWOverCaptureAttachedMediaSplitNode _updateSynchronizedSlaveFrameEnabledWithSampleBuffer:](self, a3);
  if (!BWSampleBufferIsMarkerBuffer(a3) || !CMGetAttachment(a3, @"IrisMovieRequest", 0))
  {
    uint64_t AttachedMedia = BWSampleBufferGetAttachedMedia(a3, @"SynchronizedSlaveFrame");
    if (AttachedMedia)
    {
      v9 = (opaqueCMSampleBuffer *)AttachedMedia;
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
      *(_OWORD *)&timingArrayOut.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
      *(_OWORD *)&timingArrayOut.decodeTimeStamp.value = v10;
      timingArrayOut.decodeTimeStamp.epoch = *(void *)(MEMORY[0x1E4F1FA70] + 64);
      long long v11 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
      *(_OWORD *)&timingArrayOut.duration.value = *MEMORY[0x1E4F1FA70];
      *(_OWORD *)&timingArrayOut.duration.epoch = v11;
      OSStatus SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(a3, 1, &timingArrayOut, 0);
      if (SampleTimingInfoArray)
      {
        OSStatus v14 = SampleTimingInfoArray;
        fig_log_get_emitter();
        uint64_t v17 = v4;
        OSStatus v16 = v14;
        goto LABEL_14;
      }
      CMSampleBufferGetPresentationTimeStamp(&time2, v9);
      CMTime time1 = timingArrayOut.presentationTimeStamp;
      if (CMTimeCompare(&time1, &time2))
      {
        time1.value = 0;
        OSStatus v13 = CMSampleBufferCreateCopyWithNewTiming((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v9, 1, &timingArrayOut, (CMSampleBufferRef *)&time1);
        if (!v13)
        {
          BWSampleBufferSetAttachedMedia(a3, @"SynchronizedSlaveFrame", time1.value);
          CFRelease((CFTypeRef)time1.value);
          goto LABEL_11;
        }
        OSStatus v15 = v13;
        fig_log_get_emitter();
        uint64_t v17 = v4;
        OSStatus v16 = v15;
LABEL_14:
        FigDebugAssert3();
      }
    }
LABEL_11:
    v18.receiver = self;
    v18.super_class = (Class)BWOverCaptureAttachedMediaSplitNode;
    -[BWAttachedMediaSplitNode renderSampleBuffer:forInput:](&v18, sel_renderSampleBuffer_forInput_, a3, a4, v16, v17);
    return;
  }
  -[BWOverCaptureAttachedMediaSplitNode _handleIrisMovieRequestForInput:sbuf:](self, (uint64_t)a4, (uint64_t)a3);
}

- (id)_updateSynchronizedSlaveFrameEnabledWithSampleBuffer:(id)result
{
  if (result)
  {
    v3 = result;
    result = (id)BWSampleBufferIsMarkerBuffer(a2);
    if (result)
    {
      result = (id)CMGetAttachment(a2, @"RecordingSettings", 0);
      if (result)
      {
        v4.receiver = v3;
        v4.super_class = (Class)BWOverCaptureAttachedMediaSplitNode;
        return objc_msgSendSuper2(&v4, sel_setOutputRenderingEnabled_forAttachedMediaKey_, [result spatialOverCaptureMovieURL] != 0, @"SynchronizedSlaveFrame");
      }
    }
  }
  return result;
}

- (id)_handleIrisMovieRequestForInput:(uint64_t)a3 sbuf:
{
  if (result)
  {
    uint64_t v5 = result;
    if (objc_msgSend((id)objc_msgSend(result, "outputs"), "count") != 2) {
      -[BWOverCaptureAttachedMediaSplitNode _handleIrisMovieRequestForInput:sbuf:]();
    }
    if ([v5 isOutputRenderingEnabledForAttachedMediaKey:@"SynchronizedSlaveFrame"])
    {
      v7.receiver = v5;
      v7.super_class = (Class)BWOverCaptureAttachedMediaSplitNode;
      return objc_msgSendSuper2(&v7, sel_renderSampleBuffer_forInput_, a3, a2);
    }
    else
    {
      v6 = objc_msgSend((id)objc_msgSend(v5, "outputs"), "objectAtIndexedSubscript:", 0);
      return (id)[v6 emitSampleBuffer:a3];
    }
  }
  return result;
}

- (BWNodeOutput)primaryFrameOutput
{
  return self->_primaryFrameOutput;
}

- (BWNodeOutput)synchronizedSlaveFrameOutput
{
  return self->_synchronizedSlaveFrameOutput;
}

- (void)_handleIrisMovieRequestForInput:sbuf:.cold.1()
{
  __assert_rtn("-[BWOverCaptureAttachedMediaSplitNode _handleIrisMovieRequestForInput:sbuf:]", "BWOverCaptureAttachedMediaSplitNode.m", 123, "self.outputs.count == 2");
}

@end