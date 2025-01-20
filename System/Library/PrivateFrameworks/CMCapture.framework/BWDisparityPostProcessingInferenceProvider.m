@interface BWDisparityPostProcessingInferenceProvider
+ (void)initialize;
- (BOOL)allowsAsyncPropagation;
- (BWDisparityPostProcessingInferenceProvider)initWithDisparityInputRequirement:(id)a3 displacementInputRequirement:(id)a4 stateInputRequirement:(id)a5 stateOutputRequirement:(id)a6 disparityOutputRequirement:(id)a7 portType:(id)a8 resourceProvider:(id)a9 configuration:(id)a10;
- (BWInferenceExecutable)executable;
- (BWInferenceExtractable)extractable;
- (NSArray)cloneVideoRequirements;
- (NSArray)inputMetadataRequirements;
- (NSArray)inputVideoRequirements;
- (NSArray)outputMetadataRequirements;
- (NSArray)outputVideoRequirements;
- (NSSet)preventionReasons;
- (id)newStorage;
- (int)executionTarget;
- (int)prepareForSubmissionWithWorkQueue:(id)a3;
- (int)prewarmUsingLimitedMemory:(BOOL)a3;
- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7;
- (int)type;
- (uint64_t)newTextureWithRequirement:(void *)a3 usingStorage:(uint64_t)a4 descriptor:(int)a5 isOutput:;
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)dealloc;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
@end

@implementation BWDisparityPostProcessingInferenceProvider

- (NSArray)outputVideoRequirements
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = self->_disparityOutputRequirement;
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (NSArray)inputVideoRequirements
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  long long v2 = *(_OWORD *)&self->_stateInputRequirement;
  v4[0] = *(_OWORD *)&self->_displacementInputRequirement;
  v4[1] = v2;
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
}

- (NSArray)cloneVideoRequirements
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

- (BWDisparityPostProcessingInferenceProvider)initWithDisparityInputRequirement:(id)a3 displacementInputRequirement:(id)a4 stateInputRequirement:(id)a5 stateOutputRequirement:(id)a6 disparityOutputRequirement:(id)a7 portType:(id)a8 resourceProvider:(id)a9 configuration:(id)a10
{
  v18.receiver = self;
  v18.super_class = (Class)BWDisparityPostProcessingInferenceProvider;
  v16 = [(BWDisparityPostProcessingInferenceProvider *)&v18 init];
  if (v16)
  {
    v16->_metalInferenceContext = (BWMetalInferenceContext *)(id)[a9 defaultDeviceMetalContext];
    v16->_disparityInputRequirement = (BWInferenceVideoRequirement *)a3;
    v16->_displacementInputRequirement = (BWInferenceVideoRequirement *)a4;
    v16->_disparityOutputRequirement = (BWInferenceVideoRequirement *)a7;
    v16->_stateInputRequirement = (BWInferenceVideoRequirement *)a5;
    v16->_stateOutputRequirement = (BWInferenceVideoRequirement *)a6;
    v16->_portType = (NSString *)a8;
    v16->_concurrencyWidth = [a10 concurrencyWidth];
  }
  return v16;
}

+ (void)initialize
{
}

- (void)dealloc
{
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWDisparityPostProcessingInferenceProvider;
  [(BWDisparityPostProcessingInferenceProvider *)&v4 dealloc];
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  self->_disparityPostProcessor = 0;
  objc_super v4 = [(BWInferenceVideoRequirement *)self->_disparityInputRequirement videoFormat];
  uint64_t v5 = [(BWInferenceVideoFormat *)v4 width];
  uint64_t v6 = [(BWInferenceVideoFormat *)v4 height];
  v7 = [(BWInferenceVideoRequirement *)self->_disparityOutputRequirement videoFormat];
  uint64_t v8 = [(BWInferenceVideoFormat *)v7 width];
  uint64_t v9 = [(BWInferenceVideoFormat *)v7 height];
  id v10 = objc_alloc((Class)getPTDisparityPostProcessingClass());
  v11 = [(BWMetalInferenceContext *)self->_metalInferenceContext commandQueue];
  portType = self->_portType;
  v17[0] = v5;
  v17[1] = v6;
  v17[2] = 1;
  v16[0] = v8;
  v16[1] = v9;
  v16[2] = 1;
  v15[0] = v5;
  v15[1] = v6;
  v15[2] = 1;
  v13 = (PTDisparityPostProcessing *)[v10 initWithCommandQueue:v11 disparitySize:v17 filteredDisparitySize:v16 disparityPixelFormat:25 colorSize:v15 colorPixelFormat:71 sensorPort:portType];
  self->_disparityPostProcessor = v13;
  if (v13)
  {
    self->_disparityInputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, -[BWInferenceVideoFormat width](v4, "width"), -[BWInferenceVideoFormat height](v4, "height"), 0);
    self->_disparityOutputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, -[BWInferenceVideoFormat width](v7, "width"), -[BWInferenceVideoFormat height](v7, "height"), 0);
    self->_displacementDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 65, -[BWInferenceVideoFormat width](-[BWInferenceVideoRequirement videoFormat](self->_displacementInputRequirement, "videoFormat"), "width"), -[BWInferenceVideoFormat height](-[BWInferenceVideoRequirement videoFormat](self->_displacementInputRequirement, "videoFormat"), "height"), 0);
    self->_stateInDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 65, -[BWInferenceVideoFormat width](v7, "width"), -[BWInferenceVideoFormat height](v7, "height"), 0);
    self->_stateOutDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 65, -[BWInferenceVideoFormat width](v7, "width"), -[BWInferenceVideoFormat height](v7, "height"), 0);
    [(MTLTextureDescriptor *)self->_disparityInputDescriptor setUsage:1];
    [(MTLTextureDescriptor *)self->_disparityOutputDescriptor setUsage:2];
    [(MTLTextureDescriptor *)self->_displacementDescriptor setUsage:1];
    [(MTLTextureDescriptor *)self->_stateInDescriptor setUsage:1];
    [(MTLTextureDescriptor *)self->_stateOutDescriptor setUsage:2];
    return 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -31702;
  }
}

- (uint64_t)newTextureWithRequirement:(void *)a3 usingStorage:(uint64_t)a4 descriptor:(int)a5 isOutput:
{
  if (!a1) {
    return 0;
  }
  if (a5)
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "pixelBufferPoolForRequirement:", a2), "newPixelBuffer");
    if (v10)
    {
      v11 = (__CVBuffer *)v10;
      [a3 setPixelBuffer:v10 forRequirement:a2];
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  v11 = (__CVBuffer *)[a3 pixelBufferForRequirement:a2];
  if (!v11)
  {
LABEL_9:
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
LABEL_6:
  uint64_t v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "commandQueue"), "device"), "newTextureWithDescriptor:iosurface:plane:", a4, CVPixelBufferGetIOSurface(v11), 0);
  if (a5) {
    CFRelease(v11);
  }
  return v12;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v10 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  v11 = (void *)-[BWDisparityPostProcessingInferenceProvider newTextureWithRequirement:usingStorage:descriptor:isOutput:]((uint64_t)self, (uint64_t)self->_disparityInputRequirement, a4, (uint64_t)self->_disparityInputDescriptor, 0);
  if (!v11)
  {
    v15 = 0;
    uint64_t v12 = 0;
LABEL_14:
    v14 = 0;
    v13 = 0;
    goto LABEL_17;
  }
  uint64_t v12 = (void *)-[BWDisparityPostProcessingInferenceProvider newTextureWithRequirement:usingStorage:descriptor:isOutput:]((uint64_t)self, (uint64_t)self->_disparityOutputRequirement, a4, (uint64_t)self->_disparityOutputDescriptor, 1);
  if (!v12)
  {
    v15 = 0;
    goto LABEL_14;
  }
  v13 = (void *)-[BWDisparityPostProcessingInferenceProvider newTextureWithRequirement:usingStorage:descriptor:isOutput:]((uint64_t)self, (uint64_t)self->_stateInputRequirement, a4, (uint64_t)self->_stateInDescriptor, 0);
  if (!v13)
  {
    v15 = 0;
    v14 = 0;
    goto LABEL_17;
  }
  v14 = (void *)-[BWDisparityPostProcessingInferenceProvider newTextureWithRequirement:usingStorage:descriptor:isOutput:]((uint64_t)self, (uint64_t)self->_stateOutputRequirement, a4, (uint64_t)self->_stateOutDescriptor, 0);
  if (!v14)
  {
    v15 = 0;
    goto LABEL_17;
  }
  v15 = (void *)-[BWDisparityPostProcessingInferenceProvider newTextureWithRequirement:usingStorage:descriptor:isOutput:]((uint64_t)self, (uint64_t)self->_displacementInputRequirement, a4, (uint64_t)self->_displacementDescriptor, 0);
  if (!v15)
  {
LABEL_17:
    uint64_t v18 = 4294935578;
    goto LABEL_18;
  }
  if ([(PTDisparityPostProcessing *)self->_disparityPostProcessor temporalDisparityFilter:v15 inStatePrev:v13 inDisparity:v11 outDisparityFiltered:v12 outState:v14])
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v18 = 4294935586;
  }
  else
  {
    v16 = (void *)[(MTLCommandQueue *)[(BWMetalInferenceContext *)self->_metalInferenceContext commandQueue] commandBuffer];
    if (v16)
    {
      v17 = v16;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __128__BWDisparityPostProcessingInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
      v20[3] = &unk_1E5C24730;
      int v21 = 0;
      v20[4] = self;
      v20[5] = a7;
      [v16 addScheduledHandler:v20];
      [v17 addCompletedHandler:&__block_literal_global_72];
      [v17 commit];
      LODWORD(v18) = 0;
      goto LABEL_11;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    uint64_t v18 = 0;
  }
LABEL_18:
  if (a7) {
    (*((void (**)(id, uint64_t, BWDisparityPostProcessingInferenceProvider *))a7 + 2))(a7, v18, self);
  }
  if (*v10 == 1) {
    kdebug_trace();
  }
LABEL_11:

  return v18;
}

uint64_t __128__BWDisparityPostProcessingInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned int *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __128__BWDisparityPostProcessingInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_2()
{
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    return kdebug_trace();
  }
  return result;
}

- (BWInferenceExecutable)executable
{
  return 0;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (id)newStorage
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  stateOutputRequirement = self->_stateOutputRequirement;
  v20[0] = self->_disparityOutputRequirement;
  v20[1] = stateOutputRequirement;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 2, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t concurrencyWidth = self->_concurrencyWidth;
        if (concurrencyWidth)
        {
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
          do
          {
            [v3 addObject:v11];
            --concurrencyWidth;
          }
          while (concurrencyWidth);
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }
  uint64_t v12 = [BWInferenceProviderStorage alloc];
  long long v13 = *(_OWORD *)&self->_stateInputRequirement;
  v19[0] = *(_OWORD *)&self->_displacementInputRequirement;
  v19[1] = v13;
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](v12, "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:4], v3);
}

- (int)type
{
  return 115;
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

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  CFTypeRef cf = 0;
  uint64_t v8 = (__CVBuffer *)[a4 pixelBufferForRequirement:self->_disparityOutputRequirement];
  if (v8)
  {
    long long v10 = *MEMORY[0x1E4F1F9F8];
    uint64_t v11 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    if (!BWSampleBufferCreateFromPixelBuffer(v8, (uint64_t)&v10, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&cf))
    {
      uint64_t v9 = [(BWInferenceMediaRequirement *)self->_disparityOutputRequirement attachedMediaKey];
      BWSampleBufferSetAttachedMedia(a6, (uint64_t)v9, (uint64_t)cf);
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
  if (cf) {
    CFRelease(cf);
  }
}

- (BOOL)allowsAsyncPropagation
{
  return 1;
}

@end