@interface BWInferenceFusionTrackerScalingProvider
- (BOOL)allowsAsyncPropagation;
- (BOOL)mustExecuteWhenAllowed;
- (BWInferenceExecutable)executable;
- (BWInferenceExtractable)extractable;
- (BWInferenceSubmittable)submittable;
- (NSArray)cloneVideoRequirements;
- (NSArray)inputMetadataRequirements;
- (NSArray)inputVideoRequirements;
- (NSArray)outputMetadataRequirements;
- (NSArray)outputVideoRequirements;
- (NSSet)preventionReasons;
- (NSString)description;
- (id)newStorage;
- (id)preventionReasonWithSampleBuffer:(opaqueCMSampleBuffer *)a3 executionTime:(id *)a4;
- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6;
- (int)executionTarget;
- (int)prepareForExecution;
- (int)prepareForSubmissionWithWorkQueue:(id)a3;
- (int)prewarmUsingLimitedMemory:(BOOL)a3;
- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7;
- (int)type;
- (uint64_t)_executeOnSampleBuffer:(void *)a3 usingStorage:(uint64_t)a4 meanPixel:(uint64_t)a5 withExecutionTime:(uint64_t)a6 completionHandler:;
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)dealloc;
- (void)initWithInputRequirement:(void *)a3 orderBufferRequirement:(void *)a4 descriptor:(void *)a5 resourceProvider:(void *)a6 meanPixelCalculator:(uint64_t)a7 operation:;
@end

@implementation BWInferenceFusionTrackerScalingProvider

- (void)initWithInputRequirement:(void *)a3 orderBufferRequirement:(void *)a4 descriptor:(void *)a5 resourceProvider:(void *)a6 meanPixelCalculator:(uint64_t)a7 operation:
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v19.receiver = a1;
  v19.super_class = (Class)BWInferenceFusionTrackerScalingProvider;
  v13 = objc_msgSendSuper2(&v19, sel_init);
  if (v13)
  {
    v13[1] = a2;
    v13[2] = a3;
    v13[6] = a7;
    v14 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    [a4 size];
    [(BWVideoFormatRequirements *)v14 setWidth:(unint64_t)v15];
    [a4 size];
    [(BWVideoFormatRequirements *)v14 setHeight:(unint64_t)v16];
    v21[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a4, "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v14, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1]);
    [(BWVideoFormatRequirements *)v14 setBytesPerRowAlignment:64];
    uint64_t v17 = [NSString stringWithFormat:@"BWInferenceFusionTrackerNetworkInput_%lu_%@", a7, objc_msgSend(a4, "name")];
    v20 = v14;
    v13[3] = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", v17, +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1]));
    v13[7] = [objc_alloc((Class)getFTMSRScalerClass()) init];
    v13[9] = a6;
    v13[8] = (id)[a5 defaultDeviceMetalContext];
  }
  return v13;
}

- (void)dealloc
{
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWInferenceFusionTrackerScalingProvider;
  [(BWInferenceFusionTrackerScalingProvider *)&v4 dealloc];
}

- (NSString)description
{
  v5.receiver = self;
  v5.super_class = (Class)BWInferenceFusionTrackerScalingProvider;
  v3 = [(BWInferenceFusionTrackerScalingProvider *)&v5 description];
  return [(NSString *)v3 stringByAppendingString:FTCinematicHighPriorityTrackerOpDescription(self->_operation)];
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

- (int)type
{
  return 150;
}

- (int)executionTarget
{
  return 0;
}

- (NSSet)preventionReasons
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (NSArray)cloneVideoRequirements
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (NSArray)inputVideoRequirements
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  orderBufferRequirement = self->_orderBufferRequirement;
  if (orderBufferRequirement)
  {
    inputRequirement = self->_inputRequirement;
    v9 = orderBufferRequirement;
    v3 = (void *)MEMORY[0x1E4F1C978];
    p_inputRequirement = &inputRequirement;
    uint64_t v5 = 2;
  }
  else
  {
    v7 = self->_inputRequirement;
    v3 = (void *)MEMORY[0x1E4F1C978];
    p_inputRequirement = &v7;
    uint64_t v5 = 1;
  }
  return (NSArray *)objc_msgSend(v3, "arrayWithObjects:count:", p_inputRequirement, v5, v7, inputRequirement, v9, v10);
}

- (NSArray)outputVideoRequirements
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = self->_outputRequirement;
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (NSArray)inputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)outputMetadataRequirements
{
  v2 = (void *)[(NSMutableArray *)self->_outputMetadataRequirements copy];
  return (NSArray *)v2;
}

- (BWInferenceExecutable)executable
{
  if (*((void *)self + 9)) {
    return 0;
  }
  return self;
}

- (BWInferenceSubmittable)submittable
{
  if (!*((void *)self + 9)) {
    return 0;
  }
  return self;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (id)newStorage
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [BWInferenceProviderStorage alloc];
  v7[0] = self->_inputRequirement;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  outputRequirement = self->_outputRequirement;
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](v3, "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", v4, [MEMORY[0x1E4F1C978] arrayWithObjects:&outputRequirement count:1]);
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  return 0;
}

- (BOOL)allowsAsyncPropagation
{
  return 0;
}

- (uint64_t)_executeOnSampleBuffer:(void *)a3 usingStorage:(uint64_t)a4 meanPixel:(uint64_t)a5 withExecutionTime:(uint64_t)a6 completionHandler:
{
  if (!a1) {
    return 0;
  }
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  v11 = (void *)CMGetAttachment(target, @"FusionTrackerInput", 0);
  if (v11) {
    v12 = (void *)[v11 highPriorityTrackerState];
  }
  else {
    v12 = 0;
  }
  uint64_t v13 = [a3 pixelBufferForRequirement:a1[1]];
  if (!v13)
  {
    uint64_t v22 = 4294935585;
    goto LABEL_21;
  }
  v14 = (__CVBuffer *)v13;
  uint64_t v15 = objc_msgSend((id)objc_msgSend(a3, "pixelBufferPoolForRequirement:", a1[3]), "newPixelBuffer");
  if (!v15)
  {
    uint64_t v22 = 4294935553;
    goto LABEL_21;
  }
  double v16 = (__CVBuffer *)v15;
  [a3 setPixelBuffer:v15 forRequirement:a1[3]];
  if (([v12 completed] & 1) == 0)
  {
    CVPixelBufferLockBaseAddress(v16, 0);
    uint64_t v17 = a1[6];
    if (v17 == 3)
    {
      objc_super v19 = (void *)CMGetAttachment(target, @"FusionTrackerInput", 0);
      FTTapToBoxClass = (void *)getFTTapToBoxClass();
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v19, "input"), "tapRequest"), "tapPoint");
      char v21 = objc_msgSend(FTTapToBoxClass, "renderTap:inBuffer:", v16);
    }
    else
    {
      if (v17 == 2)
      {
        CVPixelBufferLockBaseAddress(v14, 1uLL);
        char v18 = [v12 preProcessInstanceInputFromSourceBuffer:v14 toDestinationBuffer:v16 meanPixel:a4 scaler:a1[7]];
      }
      else
      {
        if (v17 != 1)
        {
          CVPixelBufferUnlockBaseAddress(v16, 0);
LABEL_20:
          CFRelease(v16);
          uint64_t v22 = 4294935580;
LABEL_21:
          [v12 abort];
          goto LABEL_22;
        }
        CVPixelBufferLockBaseAddress(v14, 1uLL);
        targetRectForSampleBuffer(target);
        char v18 = objc_msgSend(v12, "preProcessExemplarInputFromSourceBuffer:toDestinationBuffer:forTargetRect:meanPixel:scaler:", v14, v16, a4, a1[7]);
      }
      char v21 = v18;
      CVPixelBufferUnlockBaseAddress(v14, 1uLL);
    }
    CVPixelBufferUnlockBaseAddress(v16, 0);
    if (v21) {
      goto LABEL_18;
    }
    goto LABEL_20;
  }
LABEL_18:
  CFRelease(v16);
  uint64_t v22 = 0;
LABEL_22:
  (*(void (**)(uint64_t, uint64_t, void *))(a6 + 16))(a6, v22, a1);
  return v22;
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  return -[BWInferenceFusionTrackerScalingProvider _executeOnSampleBuffer:usingStorage:meanPixel:withExecutionTime:completionHandler:](self, a3, a4, 0, (uint64_t)a5, (uint64_t)a6);
}

- (int)prepareForExecution
{
  return 0;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  return 0;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v12 = [a4 pixelBufferForRequirement:self->_inputRequirement];
  if (v12)
  {
    uint64_t v13 = v12;
    meanPixelCalculator = self->_meanPixelCalculator;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __125__BWInferenceFusionTrackerScalingProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
    v17[3] = &unk_1E5C26458;
    v17[4] = self;
    v17[5] = a4;
    long long v18 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    v17[6] = a7;
    v17[7] = a3;
    [(BWInferenceFusionTrackerMeanPixelCalculator *)meanPixelCalculator asyncMeanPixelForBuffer:v13 completionHandler:v17];
    return 0;
  }
  else
  {
    int v15 = -31711;
    (*((void (**)(id, uint64_t, BWInferenceFusionTrackerScalingProvider *))a7 + 2))(a7, 4294935585, self);
  }
  return v15;
}

uint64_t __125__BWInferenceFusionTrackerScalingProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return -[BWInferenceFusionTrackerScalingProvider _executeOnSampleBuffer:usingStorage:meanPixel:withExecutionTime:completionHandler:](*(void **)(a1 + 32), *(CMAttachmentBearerRef *)(a1 + 56), *(void **)(a1 + 40), a2, a5, *(void *)(a1 + 48));
}

- (BOOL)mustExecuteWhenAllowed
{
  return 0;
}

- (id)preventionReasonWithSampleBuffer:(opaqueCMSampleBuffer *)a3 executionTime:(id *)a4
{
  return preventionReasonWithSampleBuffer(a3, self->_operation);
}

@end