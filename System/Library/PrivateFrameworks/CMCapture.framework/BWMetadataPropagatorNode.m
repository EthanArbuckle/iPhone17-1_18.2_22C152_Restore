@interface BWMetadataPropagatorNode
+ (void)initialize;
- (void)dealloc;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWMetadataPropagatorNode

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWMetadataPropagatorNode;
  [(BWFunnelNode *)&v3 dealloc];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  CMSampleBufferRef v22 = 0;
  AttachedInferenceResult = (void *)BWInferenceGetAttachedInferenceResult(a3, 101);
  if ([AttachedInferenceResult isValid]
    && objc_msgSend((id)objc_msgSend(AttachedInferenceResult, "inferences"), "count"))
  {
    int v7 = objc_msgSend((id)objc_msgSend(AttachedInferenceResult, "preventionReason"), "isEqualToString:", @"BlurryInputBuffer") ^ 1;
  }
  else
  {
    int v7 = 0;
  }
  v8 = (void *)BWInferenceGetAttachedInferenceResult(a3, 130);
  if ([v8 isValid] && objc_msgSend((id)objc_msgSend(v8, "inferences"), "count")) {
    int v9 = objc_msgSend((id)objc_msgSend(v8, "preventionReason"), "isEqualToString:", @"BlurryInputBuffer") ^ 1;
  }
  else {
    int v9 = 0;
  }
  if ((v7 | v9) == 1)
  {
    memset(&sampleTimingArray.presentationTimeStamp, 0, 48);
    *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1F9F8];
    sampleTimingArray.duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.presentationTimeStamp, a3);
    sampleTimingArray.decodeTimeStamp = sampleTimingArray.duration;
    CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, &v22);
    if (v22)
    {
      if (v7) {
        CMSetAttachment(v22, (CFStringRef)*MEMORY[0x1E4F53118], (CFTypeRef)[AttachedInferenceResult inferences], 1u);
      }
      if (v9)
      {
        if (!self->_viService) {
          self->_viService = (VIService *)[objc_alloc((Class)getVIServiceClass()) init];
        }
        if (objc_opt_respondsToSelector())
        {
          viService = self->_viService;
          uint64_t v11 = [v8 inferences];
          double v12 = FigCaptureUnityRect();
          uint64_t v16 = -[VIService generateCachedResultsWithDetectorOutputs:imageSize:orientation:normalizedRegionOfInterest:](viService, "generateCachedResultsWithDetectorOutputs:imageSize:orientation:normalizedRegionOfInterest:", v11, 1, 512.0, 512.0, v12, v13, v14, v15);
          unsigned int v17 = objc_msgSend((id)CMGetAttachment(a3, @"UprightExifOrientation", 0), "intValue");
          if (v17 <= 1) {
            uint64_t v18 = 1;
          }
          else {
            uint64_t v18 = v17;
          }
          v19 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
          [v19 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F531D0]];
          uint64_t v20 = [NSNumber numberWithUnsignedInt:v18];
          [v19 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F531D8]];
          CMSetAttachment(v22, (CFStringRef)*MEMORY[0x1E4F531C8], v19, 1u);
        }
      }
      [(BWNodeOutput *)self->super.super._output emitSampleBuffer:v22];
      if (v22) {
        CFRelease(v22);
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

@end