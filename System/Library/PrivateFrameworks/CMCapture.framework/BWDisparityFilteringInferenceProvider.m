@interface BWDisparityFilteringInferenceProvider
+ (void)initialize;
- (BOOL)allowsAsyncPropagation;
- (BWDisparityFilteringInferenceProvider)initWithDisparityInputRequirement:(id)a3 disparityOutputRequirement:(id)a4 resourceProvider:(id)a5 configuration:(id)a6 isPreprocessing:(BOOL)a7;
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
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)dealloc;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
@end

@implementation BWDisparityFilteringInferenceProvider

- (NSArray)outputVideoRequirements
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = self->_outputRequirement;
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (NSArray)inputVideoRequirements
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = self->_disparityInputRequirement;
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (NSArray)cloneVideoRequirements
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
}

- (BWDisparityFilteringInferenceProvider)initWithDisparityInputRequirement:(id)a3 disparityOutputRequirement:(id)a4 resourceProvider:(id)a5 configuration:(id)a6 isPreprocessing:(BOOL)a7
{
  v19.receiver = self;
  v19.super_class = (Class)BWDisparityFilteringInferenceProvider;
  v12 = [(BWDisparityFilteringInferenceProvider *)&v19 init];
  if (v12)
  {
    v12->_metalInferenceContext = (BWMetalInferenceContext *)(id)[a5 defaultDeviceMetalContext];
    uint64_t v18 = 0;
    v13 = (void *)-[MTLDevice newDefaultLibraryWithBundle:error:](-[BWMetalInferenceContext device](v12->_metalInferenceContext, "device"), "newDefaultLibraryWithBundle:error:", [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()], &v18);
    if (v13
      && (v14 = v13,
          v15 = (void *)[v13 newFunctionWithName:@"depthCropUpscaleAndMirror"],
          v14,
          v12->_cropPipelineState = (MTLComputePipelineState *)[(MTLDevice *)[(BWMetalInferenceContext *)v12->_metalInferenceContext device] newComputePipelineStateWithFunction:v15 error:&v18], v15, v12->_cropPipelineState))
    {
      v12->_disparityInputRequirement = (BWInferenceVideoRequirement *)a3;
      v12->_outputRequirement = (BWInferenceVideoRequirement *)a4;
      v12->_concurrencyWidth = [a6 concurrencyWidth];
      v12->_requiresCroppingOfDepthBuffer = [a6 requiresCroppingOfDepthBuffer];
      v12->_requiresVerticalFlipOfDepthBuffer = [a6 requiresVerticalFlipOfDepthBuffer];
      v12->_inputSource = 0;
      unsigned int v16 = [a6 videoDepthAlgorithm];
      if (v16 < 4)
      {
        v12->_inputSource = qword_1A5F0C1F0[v16];
        v12->_isPreProcessing = a7;
        return v12;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    return 0;
  }
  return v12;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  int RequestedRotationDegrees = bwisr_getRequestedRotationDegrees([(BWInferenceVideoRequirement *)self->_disparityInputRequirement videoFormat], [(BWInferenceVideoRequirement *)self->_outputRequirement videoFormat]);
  if (self->_requiresVerticalFlipOfDepthBuffer) {
    int RequestedRotationDegrees = (RequestedRotationDegrees + 180) % 360;
  }
  if (RequestedRotationDegrees == 90)
  {
    int64_t v5 = 3;
  }
  else if (RequestedRotationDegrees == 180)
  {
    int64_t v5 = 2;
  }
  else
  {
    int64_t v5 = RequestedRotationDegrees == 270;
  }
  self->_requestedRotation = v5;
  stereoPipeline = self->_stereoPipeline;
  if (stereoPipeline) {

  }
  v7 = (ADPCEDisparityColorPipeline *)objc_msgSend(objc_alloc((Class)getADPCEDisparityColorPipelineClass()), "initForInputSource:metalDevice:", self->_inputSource, -[MTLCommandQueue device](-[BWMetalInferenceContext commandQueue](self->_metalInferenceContext, "commandQueue"), "device"));
  self->_stereoPipeline = v7;
  if (v7)
  {
    v8 = [(BWInferenceVideoRequirement *)self->_disparityInputRequirement videoFormat];
    v9 = [(BWInferenceVideoRequirement *)self->_outputRequirement videoFormat];
    if (self->_isPreProcessing) {
      uint64_t v10 = 23;
    }
    else {
      uint64_t v10 = 25;
    }
    self->_disparityInputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v10, -[BWInferenceVideoFormat width](v8, "width"), -[BWInferenceVideoFormat height](v8, "height"), 0);
    self->_disparityOutputDescriptor = (MTLTextureDescriptor *)(id)objc_msgSend(MEMORY[0x1E4F35330], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, -[BWInferenceVideoFormat width](v9, "width"), -[BWInferenceVideoFormat height](v9, "height"), 0);
    if (self->_requiresCroppingOfDepthBuffer) {
      self->_disparitySourceTextureCroppedUpscaledAndMirrored = (MTLTexture *)[(MTLDevice *)[(BWMetalInferenceContext *)self->_metalInferenceContext device] newTextureWithDescriptor:self->_disparityInputDescriptor];
    }
    return 0;
  }
  else
  {
    return FigSignalErrorAt();
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
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }

  if (self->_requiresCroppingOfDepthBuffer) {
  v4.receiver = self;
  }
  v4.super_class = (Class)BWDisparityFilteringInferenceProvider;
  [(BWDisparityFilteringInferenceProvider *)&v4 dealloc];
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  if (self->_isPreProcessing) {
    int v11 = 11;
  }
  else {
    int v11 = 14;
  }
  v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  uint64_t v13 = [a4 pixelBufferForRequirement:self->_disparityInputRequirement];
  if (v13)
  {
    v14 = (__CVBuffer *)v13;
    v15 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", self->_outputRequirement), "newPixelBuffer");
    if (v15)
    {
      [a4 setPixelBuffer:v15 forRequirement:self->_outputRequirement];
      unsigned int v16 = [(BWMetalInferenceContext *)self->_metalInferenceContext commandQueue];
      v17 = (MTLTexture *)objc_msgSend((id)-[MTLCommandQueue device](v16, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_disparityInputDescriptor, CVPixelBufferGetIOSurface(v14), 0);
      uint64_t v18 = objc_msgSend((id)-[MTLCommandQueue device](v16, "device"), "newTextureWithDescriptor:iosurface:plane:", self->_disparityOutputDescriptor, CVPixelBufferGetIOSurface(v15), 0);
      objc_super v19 = (void *)[(MTLCommandQueue *)v16 commandBuffer];
      [a4 setPixelBuffer:v15 forRequirement:self->_outputRequirement];
      if (self->_isPreProcessing)
      {
        unsigned __int16 v20 = objc_msgSend((id)objc_msgSend((id)CVPixelBufferGetAttributes(), "objectForKeyedSubscript:", *MEMORY[0x1E4F24CF8]), "shortValue");
        AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)[(BWInferenceMediaRequirement *)self->_disparityInputRequirement attachedMediaKey]);
        v22 = (void *)CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F52FE8], 0);
        objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E4F537D0]), "floatValue");
        int v24 = v23;
        objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E4F537D8]), "floatValue");
        int v27 = LODWORD(v25);
        if (self->_requiresCroppingOfDepthBuffer)
        {
          int v47 = v11;
          CGSize v28 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
          rect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
          rect.size = v28;
          v29 = (void *)CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F53070], 0);
          unsigned __int16 v46 = v20;
          if (v29
            && (v30 = v29,
                uint64_t v31 = *MEMORY[0x1E4F53260],
                [v29 objectForKeyedSubscript:*MEMORY[0x1E4F53260]]))
          {
            CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)[v30 objectForKeyedSubscript:v31], &rect);
            float32x4_t v32 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)rect.origin), (float64x2_t)rect.size);
          }
          else
          {
            rect.origin.x = 0.0;
            rect.origin.y = 0.0;
            __asm { FMOV            V0.2D, #1.0 }
            rect.size = _Q0;
            float32x4_t v32 = (float32x4_t)xmmword_1A5F0C1E0;
          }
          float32x4_t v55 = v32;
          BOOL requiresVerticalFlipOfDepthBuffer = self->_requiresVerticalFlipOfDepthBuffer;
          v38 = (void *)[v19 computeCommandEncoder];
          [v38 setTexture:v17 atIndex:0];
          [v38 setTexture:self->_disparitySourceTextureCroppedUpscaledAndMirrored atIndex:1];
          [v38 setBytes:&v55 length:16 atIndex:0];
          [v38 setBytes:&requiresVerticalFlipOfDepthBuffer length:1 atIndex:1];
          [v38 setComputePipelineState:self->_cropPipelineState];
          unint64_t v39 = [(MTLComputePipelineState *)self->_cropPipelineState threadExecutionWidth];
          unint64_t v40 = [(MTLComputePipelineState *)self->_cropPipelineState maxTotalThreadsPerThreadgroup]/ v39;
          uint64_t v41 = [(MTLTexture *)self->_disparitySourceTextureCroppedUpscaledAndMirrored width];
          uint64_t v42 = [(MTLTexture *)self->_disparitySourceTextureCroppedUpscaledAndMirrored height];
          v53[0] = v41;
          v53[1] = v42;
          v53[2] = 1;
          v52[0] = v39;
          v52[1] = v40;
          v52[2] = 1;
          [v38 dispatchThreads:v53 threadsPerThreadgroup:v52];
          [v38 endEncoding];
          disparitySourceTextureCroppedUpscaledAndMirrored = self->_disparitySourceTextureCroppedUpscaledAndMirrored;
          int v11 = v47;
          unsigned __int16 v20 = v46;
        }
        else
        {
          self->_disparitySourceTextureCroppedUpscaledAndMirrored = v17;
          disparitySourceTextureCroppedUpscaledAndMirrored = v17;
        }
        LODWORD(v25) = v24;
        LODWORD(v26) = v27;
        if (![(ADPCEDisparityColorPipeline *)self->_stereoPipeline encodeDisparityPreprocessingToCommandBuffer:v19 input:disparitySourceTextureCroppedUpscaledAndMirrored normalizationMultiplier:v20 normalizationOffset:self->_requestedRotation invalidValue:v18 rotation:v25 output:v26])goto LABEL_19; {
        fig_log_get_emitter();
        }
      }
      else
      {
        if (![(ADPCEDisparityColorPipeline *)self->_stereoPipeline encodeDisparityPostprocessingToCommandBuffer:v19 input:v17 output:v18])
        {
LABEL_19:
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __123__BWDisparityFilteringInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
          v50[3] = &unk_1E5C24730;
          int v51 = 0;
          v50[4] = self;
          v50[5] = a7;
          [v19 addScheduledHandler:v50];
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __123__BWDisparityFilteringInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_2;
          v48[3] = &__block_descriptor_36_e28_v16__0___MTLCommandBuffer__8l;
          int v49 = v11;
          [v19 addCompletedHandler:v48];
          [v19 commit];
          LODWORD(v44) = 0;
LABEL_20:
          CFRelease(v15);
          goto LABEL_21;
        }
        fig_log_get_emitter();
      }
      FigDebugAssert3();
      uint64_t v44 = 4294935586;
      v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      uint64_t v18 = 0;
      v17 = 0;
      uint64_t v44 = 4294935578;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v18 = 0;
    v17 = 0;
    v15 = 0;
    uint64_t v44 = 4294935584;
  }
  if (a7)
  {
    if (*v12 == 1) {
      kdebug_trace();
    }
    (*((void (**)(id, uint64_t, BWDisparityFilteringInferenceProvider *))a7 + 2))(a7, v44, self);
  }
  if (v15) {
    goto LABEL_20;
  }
LABEL_21:

  return v44;
}

uint64_t __123__BWDisparityFilteringInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned int *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __123__BWDisparityFilteringInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_2()
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

- (id)newStorage
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = self->_outputRequirement;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  if (self->_concurrencyWidth < 2)
  {
    objc_super v4 = (void *)v3;
  }
  else
  {
    objc_super v4 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObject:self->_outputRequirement];
    unint64_t concurrencyWidth = self->_concurrencyWidth;
    if (concurrencyWidth >= 2)
    {
      do
      {
        [v4 addObject:self->_outputRequirement];
        --concurrencyWidth;
      }
      while (concurrencyWidth > 1);
    }
  }
  v6 = [BWInferenceProviderStorage alloc];
  disparityInputRequirement = self->_disparityInputRequirement;
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](v6, "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", [MEMORY[0x1E4F1C978] arrayWithObjects:&disparityInputRequirement count:1], v4);
}

- (int)type
{
  return 110;
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
  return 0;
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
  CFTypeRef cf = 0;
  v8 = (__CVBuffer *)[a4 pixelBufferForRequirement:self->_outputRequirement];
  if (v8)
  {
    long long v10 = *MEMORY[0x1E4F1F9F8];
    uint64_t v11 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    if (!BWSampleBufferCreateFromPixelBuffer(v8, (uint64_t)&v10, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&cf))
    {
      v9 = [(BWInferenceMediaRequirement *)self->_outputRequirement attachedMediaKey];
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

@end