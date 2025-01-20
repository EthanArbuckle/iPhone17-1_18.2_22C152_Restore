@interface BWOpticalFlowInferenceProvider
+ (void)initialize;
- (BOOL)allowsAsyncPropagation;
- (BWInferenceExecutable)executable;
- (BWInferenceExtractable)extractable;
- (BWOpticalFlowInferenceProvider)initWithInputRequirement:(id)a3 outputRequirement:(id)a4 portType:(id)a5 resourceProvider:(id)a6 configuration:(id)a7;
- (NSArray)cloneVideoRequirements;
- (NSArray)inputMetadataRequirements;
- (NSArray)inputVideoRequirements;
- (NSArray)outputMetadataRequirements;
- (NSArray)outputVideoRequirements;
- (NSSet)preventionReasons;
- (id)bindOutputByCloningInputRequirement:(id)a3 toAttachedMediaUsingKey:(id)a4;
- (id)newStorage;
- (int)executionTarget;
- (int)prepareForSubmissionWithWorkQueue:(id)a3;
- (int)prewarmUsingLimitedMemory:(BOOL)a3;
- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7;
- (int)type;
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)dealloc;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
@end

@implementation BWOpticalFlowInferenceProvider

- (NSArray)outputVideoRequirements
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = self->_outputRequirement;
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (NSArray)inputVideoRequirements
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = self->_inputRequirement;
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (NSArray)cloneVideoRequirements
{
  return &self->_cloneVideoRequirements->super;
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

- (id)bindOutputByCloningInputRequirement:(id)a3 toAttachedMediaUsingKey:(id)a4
{
  v5 = [[BWInferenceCloneVideoRequirement alloc] initWithAttachedMediaKey:a4 sourceVideoRequirement:a3];
  [(NSMutableArray *)self->_cloneVideoRequirements addObject:v5];
  return v5;
}

- (BWOpticalFlowInferenceProvider)initWithInputRequirement:(id)a3 outputRequirement:(id)a4 portType:(id)a5 resourceProvider:(id)a6 configuration:(id)a7
{
  v14.receiver = self;
  v14.super_class = (Class)BWOpticalFlowInferenceProvider;
  v12 = [(BWOpticalFlowInferenceProvider *)&v14 init];
  if (v12)
  {
    v12->_metalInferenceContext = (BWMetalInferenceContext *)(id)[a6 defaultDeviceMetalContext];
    v12->_inputRequirement = (BWInferenceVideoRequirement *)a3;
    v12->_outputRequirement = (BWInferenceVideoRequirement *)a4;
    v12->_portType = (NSString *)a5;
    v12->_concurrencyWidth = [a7 concurrencyWidth];
    v12->_cloneVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v12;
}

- (int)type
{
  return 115;
}

- (id)newStorage
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObject:self->_outputRequirement];
  unint64_t concurrencyWidth = self->_concurrencyWidth;
  if (concurrencyWidth >= 2)
  {
    do
    {
      [v3 addObject:self->_outputRequirement];
      --concurrencyWidth;
    }
    while (concurrencyWidth > 1);
  }
  v5 = [BWInferenceProviderStorage alloc];
  v7[0] = self->_inputRequirement;
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](v5, "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1], v3);
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  disparityPostProcessor = self->_disparityPostProcessor;
  if (disparityPostProcessor) {

  }
  v5 = [(BWInferenceVideoRequirement *)self->_inputRequirement videoFormat];
  v6 = [(BWInferenceVideoRequirement *)self->_outputRequirement videoFormat];
  uint64_t v7 = [(BWInferenceVideoFormat *)v5 width];
  uint64_t v8 = [(BWInferenceVideoFormat *)v5 height];
  uint64_t v9 = [(BWInferenceVideoFormat *)v6 width];
  uint64_t v10 = [(BWInferenceVideoFormat *)v6 height];
  id v11 = objc_alloc((Class)getPTDisparityPostProcessingClass());
  v12 = [(BWMetalInferenceContext *)self->_metalInferenceContext commandQueue];
  portType = self->_portType;
  v18[0] = v7;
  v18[1] = v8;
  v18[2] = 1;
  v17[0] = v9;
  v17[1] = v10;
  v17[2] = 1;
  v16[0] = v7;
  v16[1] = v8;
  v16[2] = 1;
  objc_super v14 = (PTDisparityPostProcessing *)[v11 initWithCommandQueue:v12 disparitySize:v18 filteredDisparitySize:v17 disparityPixelFormat:25 colorSize:v16 colorPixelFormat:71 sensorPort:portType];
  self->_disparityPostProcessor = v14;
  if (v14)
  {
    self->_colorInputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 71, -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_inputRequirement, "videoFormat"), "width"), -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_inputRequirement, "videoFormat"), "height"), 0);
    self->_colorOutputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 65, -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_outputRequirement, "videoFormat"), "width"), -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_outputRequirement, "videoFormat"), "height"), 0);
    [(MTLTextureDescriptor *)self->_colorInputDescriptor setUsage:1];
    [(MTLTextureDescriptor *)self->_colorOutputDescriptor setUsage:2];
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -31702;
  }
}

- (BWInferenceExecutable)executable
{
  return 0;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWOpticalFlowInferenceProvider;
  [(BWOpticalFlowInferenceProvider *)&v3 dealloc];
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v10 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  id v11 = (__CVBuffer *)[a4 pixelBufferForRequirement:self->_inputRequirement];
  if (v11)
  {
    v12 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", self->_outputRequirement), "newPixelBuffer");
    if (v12)
    {
      [a4 setPixelBuffer:v12 forRequirement:self->_outputRequirement];
      v13 = objc_msgSend((id)-[MTLCommandQueue device](-[BWMetalInferenceContext commandQueue](self->_metalInferenceContext, "commandQueue"), "device"), "newTextureWithDescriptor:iosurface:plane:", self->_colorOutputDescriptor, CVPixelBufferGetIOSurface(v12), 0);
      id v11 = (__CVBuffer *)objc_msgSend((id)-[MTLCommandQueue device](-[BWMetalInferenceContext commandQueue](self->_metalInferenceContext, "commandQueue"), "device"), "newTextureWithDescriptor:iosurface:plane:", self->_colorInputDescriptor, CVPixelBufferGetIOSurface(v11), 0);
      if ([(PTDisparityPostProcessing *)self->_disparityPostProcessor computeOpticalFlow:v11 outDisplacement:v13])
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        uint64_t v16 = 4294935586;
      }
      else
      {
        objc_super v14 = (void *)[(MTLCommandQueue *)[(BWMetalInferenceContext *)self->_metalInferenceContext commandQueue] commandBuffer];
        if (v14)
        {
          v15 = v14;
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __116__BWOpticalFlowInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
          void v18[3] = &unk_1E5C24730;
          int v19 = 0;
          v18[4] = self;
          v18[5] = a7;
          [v14 addScheduledHandler:v18];
          [v15 addCompletedHandler:&__block_literal_global_4];
          [v15 commit];
          LODWORD(v16) = 0;
LABEL_8:
          CFRelease(v12);
          goto LABEL_9;
        }
        fig_log_get_emitter();
        FigDebugAssert3();
        FigSignalErrorAt();
        uint64_t v16 = 0;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      id v11 = 0;
      v13 = 0;
      uint64_t v16 = 4294935578;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v12 = 0;
    v13 = 0;
    uint64_t v16 = 4294935584;
  }
  if (a7) {
    (*((void (**)(id, uint64_t, BWOpticalFlowInferenceProvider *))a7 + 2))(a7, v16, self);
  }
  if (*v10 == 1) {
    kdebug_trace();
  }
  if (v12) {
    goto LABEL_8;
  }
LABEL_9:

  return v16;
}

uint64_t __116__BWOpticalFlowInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned int *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __116__BWOpticalFlowInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_2()
{
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    return kdebug_trace();
  }
  return result;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (NSArray)inputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)outputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (int)executionTarget
{
  return 1;
}

- (NSSet)preventionReasons
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  return 0;
}

- (BOOL)allowsAsyncPropagation
{
  return 1;
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (const void *)objc_msgSend(a4, "newSampleBufferSatisfyingRequirement:withPropagationSampleBuffer:", self->_outputRequirement, a6, a5);
  BWSampleBufferSetAttachedMedia(a6, (uint64_t)[(BWInferenceMediaRequirement *)self->_outputRequirement attachedMediaKey], (uint64_t)v9);
  if (v9) {
    CFRelease(v9);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  cloneVideoRequirements = self->_cloneVideoRequirements;
  uint64_t v11 = [(NSMutableArray *)cloneVideoRequirements countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(cloneVideoRequirements);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v16 = (const void *)[a4 newSampleBufferSatisfyingCloneRequirement:v15];
        BWSampleBufferSetAttachedMedia(a6, [v15 attachedMediaKey], (uint64_t)v16);
        if (v16) {
          CFRelease(v16);
        }
      }
      uint64_t v12 = [(NSMutableArray *)cloneVideoRequirements countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
}

@end