@interface BWMattingInferenceProvider
+ (void)initialize;
- (BOOL)allowsAsyncPropagation;
- (BWInferenceExtractable)extractable;
- (BWInferenceSubmittable)submittable;
- (BWMattingInferenceProvider)initWithConfiguration:(id)a3;
- (NSArray)cloneVideoRequirements;
- (NSArray)inputMetadataRequirements;
- (NSArray)inputVideoRequirements;
- (NSArray)outputMetadataRequirements;
- (NSArray)outputVideoRequirements;
- (NSSet)preventionReasons;
- (id)newStorage;
- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6;
- (int)executionTarget;
- (int)prepareForExecution;
- (int)prewarmUsingLimitedMemory:(BOOL)a3;
- (int)type;
- (uint64_t)_configureMattingProcessor;
- (uint64_t)_loadMattingProcessor;
- (uint64_t)processorOptionsDictionary;
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)dealloc;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
@end

@implementation BWMattingInferenceProvider

+ (void)initialize
{
}

- (BWMattingInferenceProvider)initWithConfiguration:(id)a3
{
  v36[1] = *MEMORY[0x1E4F143B8];
  v29.receiver = self;
  v29.super_class = (Class)BWMattingInferenceProvider;
  v4 = [(BWMattingInferenceProvider *)&v29 init];
  if (v4)
  {
    if (a3 && ([a3 mainImageDownscalingFactor], v5 != 0.0))
    {
      v4->_tuningParameters = (NSDictionary *)(id)[a3 tuningParameters];
      v4->_sdofRenderingTuningParameters = (NSDictionary *)(id)[a3 sdofRenderingTuningParameters];
      [a3 mainImageDownscalingFactor];
      int v7 = v6;
      v8 = [BWInferenceLazyVideoRequirement alloc];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __52__BWMattingInferenceProvider_initWithConfiguration___block_invoke;
      v27[3] = &__block_descriptor_36_e56___BWInferenceVideoFormat_16__0__BWInferenceVideoFormat_8l;
      int v28 = v7;
      v4->_primaryFormatInputVideoRequirement = (BWInferenceVideoRequirement *)[(BWInferenceLazyVideoRequirement *)v8 initWithAttachedMediaKey:@"PrimaryFormat" preparedByAttachedMediaKey:@"PrimaryFormat" videoFormatProvider:v27];
      if (+[BWInferenceEngine isNeuralEngineSupported]) {
        uint64_t v9 = 1278226536;
      }
      else {
        uint64_t v9 = 1278226534;
      }
      v10 = objc_alloc_init(BWInferenceVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v10 setWidth:512];
      [(BWVideoFormatRequirements *)v10 setHeight:384];
      v36[0] = [NSNumber numberWithUnsignedInt:v9];
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v10, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1]);
      [(BWInferenceVideoFormatRequirements *)v10 setDeviceOriented:0];
      [(BWVideoFormatRequirements *)v10 setBytesPerRowAlignment:64];
      v35 = v10;
      v4->_segmentationInputVideoRequirement = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", 0x1EFA6A200, +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1]));
      v4->_depthInputVideoRequirement = (BWInferenceVideoRequirement *)[[BWInferenceLazyVideoRequirement alloc] initWithAttachedMediaKey:@"Depth" preparedByAttachedMediaKey:@"Depth" videoFormatProvider:&__block_literal_global_53];
      v11 = [[BWInferenceLazyVideoRequirement alloc] initWithAttachedMediaKey:@"Depth" preparedByAttachedMediaKey:@"Depth" videoFormatProvider:&__block_literal_global_17];
      v4->_disparityInputVideoRequirement = &v11->super;
      long long v32 = *(_OWORD *)&v4->_primaryFormatInputVideoRequirement;
      depthInputVideoRequirement = v4->_depthInputVideoRequirement;
      v34 = v11;
      v12 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:4];
      v4->_inputVideoRequirements = v12;
      v13 = v12;
      v14 = [BWInferenceLazyVideoRequirement alloc];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __52__BWMattingInferenceProvider_initWithConfiguration___block_invoke_23;
      v25[3] = &__block_descriptor_36_e56___BWInferenceVideoFormat_16__0__BWInferenceVideoFormat_8l;
      int v26 = v7;
      v4->_segmentationOutputVideoRequirement = (BWInferenceVideoRequirement *)[(BWInferenceLazyVideoRequirement *)v14 initWithAttachedMediaKey:0x1EFA74420 preparedByAttachedMediaKey:@"PrimaryFormat" videoFormatProvider:v25];
      if ([a3 refinedDepthDeliveryEnabled])
      {
        v15 = [BWInferenceLazyVideoRequirement alloc];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __52__BWMattingInferenceProvider_initWithConfiguration___block_invoke_29;
        v23[3] = &__block_descriptor_36_e56___BWInferenceVideoFormat_16__0__BWInferenceVideoFormat_8l;
        int v24 = v7;
        uint64_t refinedDepthOutputVideoRequirement = [(BWInferenceLazyVideoRequirement *)v15 initWithAttachedMediaKey:0x1EFA74440 preparedByAttachedMediaKey:@"PrimaryFormat" videoFormatProvider:v23];
        v4->_uint64_t refinedDepthOutputVideoRequirement = (BWInferenceVideoRequirement *)refinedDepthOutputVideoRequirement;
      }
      else
      {
        uint64_t refinedDepthOutputVideoRequirement = (uint64_t)v4->_refinedDepthOutputVideoRequirement;
      }
      if (refinedDepthOutputVideoRequirement)
      {
        v31[0] = v4->_segmentationOutputVideoRequirement;
        v31[1] = refinedDepthOutputVideoRequirement;
        v17 = (void *)MEMORY[0x1E4F1C978];
        p_segmentationOutputVideoRequirement = (BWInferenceVideoRequirement **)v31;
        uint64_t v19 = 2;
      }
      else
      {
        segmentationOutputVideoRequirement = v4->_segmentationOutputVideoRequirement;
        v17 = (void *)MEMORY[0x1E4F1C978];
        p_segmentationOutputVideoRequirement = &segmentationOutputVideoRequirement;
        uint64_t v19 = 1;
      }
      v20 = (NSArray *)[v17 arrayWithObjects:p_segmentationOutputVideoRequirement count:v19];
      v4->_outputVideoRequirements = v20;
      v21 = v20;
      v4->_metalCommandQueue = (MTLCommandQueue *)(id)[a3 metalCommandQueue];
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

id __52__BWMattingInferenceProvider_initWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", (unint64_t)(float)((float)(unint64_t)[a2 width] / *(float *)(a1 + 32)));
  -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", (unint64_t)(float)((float)(unint64_t)[a2 height] / *(float *)(a1 + 32)));
  [(BWVideoFormatRequirements *)v4 setSupportedPixelFormats:&unk_1EFB03350];
  [(BWInferenceVideoFormatRequirements *)v4 setDeviceOriented:0];
  v6[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1]);
}

id __52__BWMattingInferenceProvider_initWithConfiguration___block_invoke_9(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", [a2 width]);
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", [a2 height]);
  [(BWVideoFormatRequirements *)v3 setSupportedPixelFormats:&unk_1EFB03368];
  [(BWInferenceVideoFormatRequirements *)v3 setDeviceOriented:0];
  v5[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1]);
}

id __52__BWMattingInferenceProvider_initWithConfiguration___block_invoke_15(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", [a2 width]);
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", [a2 height]);
  [(BWVideoFormatRequirements *)v3 setSupportedPixelFormats:&unk_1EFB03380];
  [(BWInferenceVideoFormatRequirements *)v3 setDeviceOriented:0];
  v5[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1]);
}

id __52__BWMattingInferenceProvider_initWithConfiguration___block_invoke_23(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", (unint64_t)(float)((float)(unint64_t)[a2 width] / *(float *)(a1 + 32)));
  -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", (unint64_t)(float)((float)(unint64_t)[a2 height] / *(float *)(a1 + 32)));
  [(BWVideoFormatRequirements *)v4 setSupportedPixelFormats:&unk_1EFB03398];
  [(BWInferenceVideoFormatRequirements *)v4 setDeviceOriented:0];
  [(BWVideoFormatRequirements *)v4 setBytesPerRowAlignment:64];
  [(BWVideoFormatRequirements *)v4 setWidthAlignment:16];
  [(BWVideoFormatRequirements *)v4 setHeightAlignment:16];
  [(BWVideoFormatRequirements *)v4 setPlaneAlignment:64];
  [(BWVideoFormatRequirements *)v4 setMemoryPoolUseAllowed:0];
  v6[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1]);
}

id __52__BWMattingInferenceProvider_initWithConfiguration___block_invoke_29(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v4, "setWidth:", (unint64_t)(float)((float)(unint64_t)[a2 width] / *(float *)(a1 + 32)));
  -[BWVideoFormatRequirements setHeight:](v4, "setHeight:", (unint64_t)(float)((float)(unint64_t)[a2 height] / *(float *)(a1 + 32)));
  [(BWVideoFormatRequirements *)v4 setSupportedPixelFormats:&unk_1EFB033B0];
  [(BWInferenceVideoFormatRequirements *)v4 setDeviceOriented:0];
  [(BWVideoFormatRequirements *)v4 setBytesPerRowAlignment:64];
  v6[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1]);
}

- (void)dealloc
{
  [(FigMatting *)self->_mattingProcessor finishProcessing];

  v3.receiver = self;
  v3.super_class = (Class)BWMattingInferenceProvider;
  [(BWMattingInferenceProvider *)&v3 dealloc];
}

- (int)type
{
  return 201;
}

- (int)executionTarget
{
  return 1;
}

- (NSSet)preventionReasons
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (NSArray)cloneVideoRequirements
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (NSArray)inputMetadataRequirements
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (NSArray)outputMetadataRequirements
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (id)newStorage
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  [v3 addObjectsFromArray:self->_inputVideoRequirements];
  [v3 addObjectsFromArray:self->_outputVideoRequirements];
  v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  [v4 addObjectsFromArray:self->_outputVideoRequirements];
  float v5 = [BWMattingInferenceStorage alloc];
  return [(BWInferenceProviderStorage *)v5 initWithRequirementsNeedingPixelBuffers:v3 requirementsNeedingPixelBufferPools:v4];
}

- (BWInferenceSubmittable)submittable
{
  return 0;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  uint64_t v2 = [(BWMattingInferenceProvider *)self executionTarget];
  return +[BWInferenceEngine allowedBufferCompressionDirectionForExecutionTarget:v2];
}

- (int)prepareForExecution
{
  objc_super v3 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (!self->_mattingProcessor
    && (-[BWMattingInferenceProvider _loadMattingProcessor]((uint64_t)self)
     || -[BWMattingInferenceProvider _configureMattingProcessor]((uint64_t)self)))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v4 = -31702;
  }
  else
  {
    int v4 = 0;
  }
  if (*v3 == 1) {
    kdebug_trace();
  }
  return v4;
}

- (uint64_t)_loadMattingProcessor
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v5 = 0;
    uint64_t v2 = (void *)[MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/VideoProcessors/MattingV1.bundle"];
    if (v2)
    {
      objc_super v3 = v2;
      if (![v2 loadAndReturnError:&v5]) {
        return 4294954510;
      }
      uint64_t v4 = objc_msgSend(objc_alloc((Class)objc_msgSend(v3, "principalClass")), "initWithCommandQueue:", *(void *)(v1 + 96));
      *(void *)(v1 + 88) = v4;
      if (v4) {
        return 0;
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

- (uint64_t)_configureMattingProcessor
{
  if (result)
  {
    uint64_t v1 = (id *)result;
    uint64_t v2 = -[BWMattingInferenceProvider processorOptionsDictionary](result);
    if (v2)
    {
      [v1[11] setOptions:v2];
      uint64_t v3 = [v1[1] videoFormat];
      if (v3
        && (v4 = (void *)v3, (uint64_t v5 = [v1[3] videoFormat]) != 0)
        && (int v6 = (void *)v5, (v7 = [v1[2] videoFormat]) != 0))
      {
        v8 = (void *)v7;
        int v9 = [v4 width];
        int v10 = [v4 height];
        int v11 = [v6 width];
        int v12 = [v6 height];
        int v13 = [v8 width];
        int v14 = [v8 height];
        id v15 = v1[11];
        v17[0] = v9;
        v17[1] = v10;
        v17[2] = v11;
        v17[3] = v12;
        v17[4] = v13;
        v17[5] = v14;
        uint64_t v18 = 0;
        [v15 setConfig:v17];
        int v16 = [v1[11] prepareToProcess:0];
        result = 0;
        if (v16) {
          return FigSignalErrorAt();
        }
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return 0;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
  }
  return result;
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  int v10 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  int v11 = (double *)MEMORY[0x1E4F1DB20];
  if (self->_mattingProcessor)
  {
    uint64_t v12 = [a4 pixelBufferForRequirement:self->_primaryFormatInputVideoRequirement];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = [a4 pixelBufferForRequirement:self->_segmentationInputVideoRequirement];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = [a4 pixelBufferForRequirement:self->_depthInputVideoRequirement];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = [a4 pixelBufferForRequirement:self->_disparityInputVideoRequirement];
          if (v18)
          {
            uint64_t v19 = v18;
            CGSize v20 = (CGSize)*((_OWORD *)v11 + 1);
            v28.origin = *(CGPoint *)v11;
            v28.size = v20;
            CFDictionaryRef v21 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55BE8], 0);
            if (v21)
            {
              if (CGRectMakeWithDictionaryRepresentation(v21, &v28))
              {
                AttachedInference = (void *)BWInferenceGetAttachedInference(a3, 801, 0x1EFA6A0A0);
                [AttachedInference count];
                v23 = (void *)[a4 pixelBufferForRequirement:self->_segmentationOutputVideoRequirement];
                if (!v23)
                {
                  v23 = objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", self->_segmentationOutputVideoRequirement), "newPixelBuffer");
                  [a4 setPixelBuffer:v23 forRequirement:self->_segmentationOutputVideoRequirement];
                  if (!v23)
                  {
                    uint64_t v26 = FigSignalErrorAt();
                    goto LABEL_21;
                  }
                  CFRelease(v23);
                }
                id v24 = a6;
                if (self->_refinedDepthOutputVideoRequirement)
                {
                  v25 = (const void *)objc_msgSend(a4, "pixelBufferForRequirement:");
                  if (!v25)
                  {
                    v25 = (const void *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", self->_refinedDepthOutputVideoRequirement), "newPixelBuffer");
                    [a4 setPixelBuffer:v25 forRequirement:self->_refinedDepthOutputVideoRequirement];
                    if (!v25) {
                      goto LABEL_28;
                    }
                    CFRelease(v25);
                  }
                }
                else
                {
                  v25 = 0;
                }
                CVBufferSetAttachment((CVBufferRef)v23, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE8], kCVAttachmentMode_ShouldPropagate);
                [(FigMatting *)self->_mattingProcessor setImagePixelBuffer:v13];
                [(FigMatting *)self->_mattingProcessor setInputSegmentationPixelBuffer:v15];
                [(FigMatting *)self->_mattingProcessor setInputDepthPixelBuffer:v17];
                [(FigMatting *)self->_mattingProcessor setInputDisparityPixelBuffer:v19];
                -[FigMatting setSyntheticFocusRectangle:](self->_mattingProcessor, "setSyntheticFocusRectangle:", *(_OWORD *)&v28.origin, *(_OWORD *)&v28.size);
                [(FigMatting *)self->_mattingProcessor setFaceLandmarks:AttachedInference];
                [(FigMatting *)self->_mattingProcessor setOutputMattePixelBuffer:v23];
                [(FigMatting *)self->_mattingProcessor setOutputRefinedDisparityPixelBuffer:v25];
                if (![(FigMatting *)self->_mattingProcessor process])
                {
                  [(FigMatting *)self->_mattingProcessor finishScheduling];
                  uint64_t v26 = 0;
LABEL_20:
                  a6 = v24;
                  int v10 = (_DWORD *)MEMORY[0x1E4F1EBA8];
LABEL_21:
                  int v11 = (double *)MEMORY[0x1E4F1DB20];
                  goto LABEL_22;
                }
LABEL_28:
                uint64_t v26 = FigSignalErrorAt();
                goto LABEL_20;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v26 = FigSignalErrorAt();
LABEL_22:
  -[FigMatting setImagePixelBuffer:](self->_mattingProcessor, "setImagePixelBuffer:", 0, *(_OWORD *)&v28.origin, *(_OWORD *)&v28.size);
  [(FigMatting *)self->_mattingProcessor setInputSegmentationPixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setInputDepthPixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setInputDisparityPixelBuffer:0];
  -[FigMatting setSyntheticFocusRectangle:](self->_mattingProcessor, "setSyntheticFocusRectangle:", *v11, v11[1], v11[2], v11[3]);
  [(FigMatting *)self->_mattingProcessor setFaceLandmarks:0];
  [(FigMatting *)self->_mattingProcessor setOutputMattePixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setOutputRefinedDisparityPixelBuffer:0];
  if (*v10 == 1) {
    kdebug_trace();
  }
  if (a6) {
    (*((void (**)(id, uint64_t, BWMattingInferenceProvider *))a6 + 2))(a6, v26, self);
  }
  return v26;
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  v18[1] = *MEMORY[0x1E4F143B8];
  int v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  BWSampleBufferRemoveAttachedMedia(a6, 0x1EFA6A200);
  uint64_t v10 = [a4 newSampleBufferSatisfyingRequirement:self->_segmentationOutputVideoRequirement withPropagationSampleBuffer:a6];
  if (!v10)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_11;
  }
  int v11 = (const void *)v10;
  uint64_t v17 = *MEMORY[0x1E4F55AB0];
  v18[0] = [NSNumber numberWithUnsignedInt:0x10000];
  uint64_t v12 = (const void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  CMSetAttachment(v11, (CFStringRef)*MEMORY[0x1E4F55B80], v12, 1u);
  BWSampleBufferSetAttachedMedia(a6, 0x1EFA74420, (uint64_t)v11);
  uint64_t refinedDepthOutputVideoRequirement = self->_refinedDepthOutputVideoRequirement;
  if (!refinedDepthOutputVideoRequirement) {
    goto LABEL_9;
  }
  uint64_t v14 = [a4 newSampleBufferSatisfyingRequirement:refinedDepthOutputVideoRequirement withPropagationSampleBuffer:a6];
  if (!v14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_9:
    uint64_t v16 = v11;
    goto LABEL_10;
  }
  uint64_t v15 = (const void *)v14;
  BWSampleBufferSetAttachedMedia(a6, 0x1EFA74440, v14);
  CFRelease(v11);
  uint64_t v16 = v15;
LABEL_10:
  CFRelease(v16);
LABEL_11:
  if (*v9 == 1) {
    kdebug_trace();
  }
}

- (BOOL)allowsAsyncPropagation
{
  return 1;
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  int result = -[BWMattingInferenceProvider _loadMattingProcessor]((uint64_t)self);
  if (!result)
  {
    uint64_t v5 = -[BWMattingInferenceProvider processorOptionsDictionary]((uint64_t)self);
    if (v5)
    {
      [(FigMatting *)self->_mattingProcessor setOptions:v5];
      mattingProcessor = self->_mattingProcessor;
      return [(FigMatting *)mattingProcessor prewarmWithTuningParameters:0];
    }
    else
    {
      return -31702;
    }
  }
  return result;
}

- (uint64_t)processorOptionsDictionary
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 72), "objectForKeyedSubscript:", @"MattingParameters"), "objectForKeyedSubscript:", @"MattingV1");
    if (v2)
    {
      if (!*(void *)(v1 + 56))
      {
        uint64_t v8 = *MEMORY[0x1E4F535B0];
        uint64_t v9 = v2;
        uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v5 = &v9;
        int v6 = &v8;
        uint64_t v7 = 1;
        return [v4 dictionaryWithObjects:v5 forKeys:v6 count:v7];
      }
      uint64_t v3 = *(void *)(v1 + 80);
      if (v3)
      {
        v10[0] = *MEMORY[0x1E4F535B0];
        v10[1] = @"SDOFRenderingParameters";
        v11[0] = v2;
        v11[1] = v3;
        uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v5 = v11;
        int v6 = v10;
        uint64_t v7 = 2;
        return [v4 dictionaryWithObjects:v5 forKeys:v6 count:v7];
      }
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return result;
}

- (NSArray)inputVideoRequirements
{
  return self->_inputVideoRequirements;
}

- (NSArray)outputVideoRequirements
{
  return self->_outputVideoRequirements;
}

@end