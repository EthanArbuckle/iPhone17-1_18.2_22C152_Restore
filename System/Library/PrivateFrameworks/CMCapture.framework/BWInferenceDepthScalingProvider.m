@interface BWInferenceDepthScalingProvider
+ (void)initialize;
- (BOOL)allowsAsyncPropagation;
- (BWInferenceDepthScalingProvider)initWithOutputRequirements:(id)a3 configuration:(id)a4;
- (BWInferenceExtractable)extractable;
- (BWInferenceSubmittable)submittable;
- (NSArray)cloneVideoRequirements;
- (NSArray)inputMetadataRequirements;
- (NSArray)inputVideoRequirements;
- (NSArray)outputMetadataRequirements;
- (NSArray)outputVideoRequirements;
- (NSSet)preventionReasons;
- (id)bindVideoInputFromAttachedMediaUsingKey:(id)a3 preparedByAttachedMediaKey:(id)a4 withVideoFormatProvider:(id)a5;
- (id)newStorage;
- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6;
- (int)executionTarget;
- (int)prepareForExecution;
- (int)prepareForSubmissionWithWorkQueue:(id)a3;
- (int)prewarmUsingLimitedMemory:(BOOL)a3;
- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7;
- (int)type;
- (uint64_t)_resolveProcessingMode;
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)dealloc;
- (void)setInputRequirement:(id)a3;
@end

@implementation BWInferenceDepthScalingProvider

+ (void)initialize
{
}

- (BWInferenceDepthScalingProvider)initWithOutputRequirements:(id)a3 configuration:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)BWInferenceDepthScalingProvider;
  v6 = [(BWInferenceDepthScalingProvider *)&v9 init];
  if (v6)
  {
    v6->_outputRequirements = (NSArray *)a3;
    BOOL v7 = (int)FigCapturePlatformIdentifier() > 6;
    v6->_GPUDepthConversionSupported = v7;
    v6->_processingMode = v7;
    v6->_flipX = [a4 flipX];
    v6->_NANValue = (NSNumber *)[a4 NANValue];
    v6->_clampMin = (NSNumber *)[a4 clampMin];
    v6->_clampMax = (NSNumber *)[a4 clampMax];
    v6->_allowUpsampling = [a4 allowUpsampling];
    v6->_concurrencyWidth = [a4 concurrencyWidth];
  }
  return v6;
}

- (void)dealloc
{
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWInferenceDepthScalingProvider;
  [(BWInferenceDepthScalingProvider *)&v4 dealloc];
}

- (int)prepareForExecution
{
  return 0;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  self->_metalContext = (FigMetalContext *)objc_msgSend(objc_alloc(MEMORY[0x1E4F55F60]), "initWithbundle:andOptionalCommandQueue:", objc_msgSend(MEMORY[0x1E4F28B50], "bundleForClass:", objc_opt_class()), 0);
  objc_super v4 = [(BWInferenceVideoRequirement *)self->_inputRequirement videoFormat];
  v5 = objc_msgSend(-[NSArray firstObject](self->_outputRequirements, "firstObject"), "videoFormat");
  unint64_t v6 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_inputRequirement videoFormat] width];
  unint64_t v7 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_inputRequirement videoFormat] height];
  v8 = (MTLTextureDescriptor *)(id)[MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:23 width:v6 height:v7 mipmapped:0];
  self->_srcdesc = v8;
  [(MTLTextureDescriptor *)v8 setUsage:1];
  uint64_t v9 = [v5 width];
  uint64_t v10 = [v5 height];
  int v11 = [v5 pixelFormat];
  int result = -31740;
  uint64_t v13 = 55;
  if (v11 > 1717856626)
  {
    if (v11 != 1717856627)
    {
      if (v11 != 1751411059 && v11 != 1751410032) {
        return result;
      }
LABEL_9:
      uint64_t v13 = 25;
    }
  }
  else if (v11 != 1278226534)
  {
    if (v11 != 1278226536)
    {
      if (v11 != 1717855600) {
        return result;
      }
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_10:
  v14 = (MTLTextureDescriptor *)(id)[MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:v13 width:v9 height:v10 mipmapped:0];
  self->_dstdesc = v14;
  [(MTLTextureDescriptor *)v14 setUsage:2];
  self->_requestedRotation = bwisr_getRequestedRotationDegrees(v4, v5);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v16 = (void *)[(FigMetalContext *)self->_metalContext device];
  uint64_t v26 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v17 = [&unk_1EFB04E80 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(&unk_1EFB04E80);
        }
        objc_msgSend(v15, "setObject:forKeyedSubscript:", (id)objc_msgSend(v16, "newComputePipelineStateWithFunction:error:", (id)objc_msgSend((id)-[FigMetalContext library](self->_metalContext, "library"), "newFunctionWithName:", *(void *)(*((void *)&v22 + 1) + 8 * i)), &v26), *(void *)(*((void *)&v22 + 1) + 8 * i));
        if (v26)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          return -31702;
        }
      }
      uint64_t v18 = [&unk_1EFB04E80 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  v21 = (NSDictionary *)[v15 copy];
  int result = 0;
  self->_pipelineStates = v21;
  return result;
}

- (id)bindVideoInputFromAttachedMediaUsingKey:(id)a3 preparedByAttachedMediaKey:(id)a4 withVideoFormatProvider:(id)a5
{
  if (self->_inputRequirement) {
    return 0;
  }
  unint64_t v6 = [[BWInferenceLazyVideoRequirement alloc] initWithAttachedMediaKey:a3 preparedByAttachedMediaKey:a3 videoFormatProvider:a5];
  self->_inputRequirement = &v6->super;
  -[BWInferenceDepthScalingProvider _resolveProcessingMode]((uint64_t)self);
  return v6;
}

- (uint64_t)_resolveProcessingMode
{
  if (result)
  {
    uint64_t v1 = result;
    BOOL v2 = 0;
    if (*(unsigned char *)(result + 48))
    {
      int result = objc_msgSend(&unk_1EFB04E98, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "videoFormat"), "pixelFormat")));
      if (result) {
        BOOL v2 = 1;
      }
    }
    *(_DWORD *)(v1 + 44) = v2;
  }
  return result;
}

- (void)setInputRequirement:(id)a3
{
  self->_inputRequirement = (BWInferenceVideoRequirement *)a3;
  -[BWInferenceDepthScalingProvider _resolveProcessingMode]((uint64_t)self);
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [a4 pixelBufferForRequirement:self->_inputRequirement];
  if (v9)
  {
    uint64_t v10 = (__CVBuffer *)v9;
    int v11 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", -[NSArray firstObject](self->_outputRequirements, "firstObject")), "newPixelBuffer");
    if (v11)
    {
      v12 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      if (*MEMORY[0x1E4F1EBA8] == 1) {
        kdebug_trace();
      }
      if (FigDepthConvertBuffer(v10, v11))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        uint64_t v18 = 4294935556;
      }
      else
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        outputRequirements = self->_outputRequirements;
        uint64_t v14 = [(NSArray *)outputRequirements countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v21 != v16) {
                objc_enumerationMutation(outputRequirements);
              }
              [a4 setPixelBuffer:v11 forRequirement:*(void *)(*((void *)&v20 + 1) + 8 * i)];
            }
            uint64_t v15 = [(NSArray *)outputRequirements countByEnumeratingWithState:&v20 objects:v24 count:16];
          }
          while (v15);
        }
        if (*v12 == 1) {
          kdebug_trace();
        }
        uint64_t v18 = 0;
      }
    }
    else
    {
      uint64_t v18 = 4294935553;
    }
  }
  else
  {
    int v11 = 0;
    uint64_t v18 = 4294935584;
  }
  if (a6) {
    (*((void (**)(id, uint64_t, BWInferenceDepthScalingProvider *))a6 + 2))(a6, v18, self);
  }
  if (v11) {
    CFRelease(v11);
  }
  return v18;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = [a4 pixelBufferForRequirement:self->_inputRequirement];
  if (v11)
  {
    v12 = (__CVBuffer *)v11;
    uint64_t v13 = objc_msgSend((id)objc_msgSend(a4, "pixelBufferPoolForRequirement:", -[NSArray firstObject](self->_outputRequirements, "firstObject")), "newPixelBuffer");
    if (v13)
    {
      uint64_t v14 = (__CVBuffer *)v13;
      int v74 = objc_msgSend((id)objc_msgSend((id)CVPixelBufferGetAttributes(), "objectForKeyedSubscript:", *MEMORY[0x1E4F24CF8]), "shortValue");
      AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)[(BWInferenceMediaRequirement *)self->_inputRequirement attachedMediaKey]);
      uint64_t v16 = (void *)CMGetAttachment(AttachedMedia, (CFStringRef)*MEMORY[0x1E4F52FE8], 0);
      objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E4F537D0]), "floatValue");
      int v18 = v17;
      objc_msgSend((id)objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E4F537D8]), "floatValue");
      int v20 = v19;
      NANValue = self->_NANValue;
      if (NANValue)
      {
        [(NSNumber *)NANValue floatValue];
        int v23 = v22;
      }
      else
      {
        int v23 = 2143289344;
      }
      clampMin = self->_clampMin;
      if (clampMin)
      {
        [(NSNumber *)clampMin floatValue];
        int v26 = v25;
      }
      else
      {
        int v26 = 2143289344;
      }
      clampMax = self->_clampMax;
      if (clampMax)
      {
        [(NSNumber *)clampMax floatValue];
        int v29 = v28;
      }
      else
      {
        int v29 = 2143289344;
      }
      v30 = (void *)[(FigMetalContext *)self->_metalContext device];
      v31 = (void *)[v30 newTextureWithDescriptor:self->_srcdesc iosurface:CVPixelBufferGetIOSurface(v12) plane:0];
      a7 = (id)[v30 newTextureWithDescriptor:self->_dstdesc iosurface:CVPixelBufferGetIOSurface(v14) plane:0];
      uint64_t v68 = 0;
      int v69 = v26;
      int v70 = v29;
      int v72 = v18;
      int v73 = v20;
      int v71 = v23;
      unint64_t v32 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_inputRequirement videoFormat] width];
      unint64_t v33 = [(BWInferenceVideoFormat *)[(BWInferenceVideoRequirement *)self->_inputRequirement videoFormat] height];
      v34 = objc_msgSend(-[NSArray firstObject](self->_outputRequirements, "firstObject"), "videoFormat");
      unint64_t v35 = [v34 width];
      unint64_t v36 = [v34 height];
      int requestedRotation = self->_requestedRotation;
      if (requestedRotation != 90)
      {
        if (requestedRotation == 180)
        {
          BOOL flipX = self->_flipX;
          pipelineStates = self->_pipelineStates;
          v46 = @"convertToFloatNoRotationFlipYInference";
          v47 = @"convertToFloat180RotationInference";
        }
        else
        {
          if (requestedRotation == 270)
          {
            BOOL v38 = self->_flipX;
            v39 = self->_pipelineStates;
            v40 = @"convertToFloat270CCWRotationFlipYInference";
            v41 = @"convertToFloat90CCWRotationInference";
LABEL_17:
            if (v38) {
              v42 = v40;
            }
            else {
              v42 = v41;
            }
            uint64_t v43 = [(NSDictionary *)v39 objectForKeyedSubscript:v42];
            *(float *)&uint64_t v68 = (float)v33 / (float)v35;
            unint64_t v33 = v32;
LABEL_27:
            *((float *)&v68 + 1) = (float)v33 / (float)v36;
            v49 = objc_msgSend((id)-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"), "commandBuffer");
            v50 = (void *)[v49 computeCommandEncoder];
            if (*MEMORY[0x1E4F1EBA8] == 1) {
              kdebug_trace();
            }
            [v50 setTexture:v31 atIndex:1];
            [v50 setTexture:a7 atIndex:0];
            [v50 setBytes:&v68 length:28 atIndex:0];
            [v50 setBytes:&v74 length:4 atIndex:1];
            [v50 setComputePipelineState:v43];
            v67[0] = [a7 width];
            v67[1] = [a7 height];
            v67[2] = 1;
            long long v65 = xmmword_1A5F0D6C0;
            uint64_t v66 = 1;
            [v50 dispatchThreads:v67 threadsPerThreadgroup:&v65];
            [v50 endEncoding];
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            outputRequirements = self->_outputRequirements;
            uint64_t v52 = [(NSArray *)outputRequirements countByEnumeratingWithState:&v61 objects:v75 count:16];
            if (v52)
            {
              uint64_t v53 = v52;
              uint64_t v54 = *(void *)v62;
              do
              {
                for (uint64_t i = 0; i != v53; ++i)
                {
                  if (*(void *)v62 != v54) {
                    objc_enumerationMutation(outputRequirements);
                  }
                  [a4 setPixelBuffer:v14 forRequirement:*(void *)(*((void *)&v61 + 1) + 8 * i)];
                }
                uint64_t v53 = [(NSArray *)outputRequirements countByEnumeratingWithState:&v61 objects:v75 count:16];
              }
              while (v53);
            }
            v59[0] = MEMORY[0x1E4F143A8];
            v59[1] = 3221225472;
            v59[2] = __117__BWInferenceDepthScalingProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
            v59[3] = &unk_1E5C24730;
            v59[4] = self;
            v59[5] = v58;
            int v60 = 0;
            [v49 addCompletedHandler:v59];
            [v49 commit];
            CFRelease(v14);
            LODWORD(v56) = 0;
            goto LABEL_37;
          }
          BOOL flipX = self->_flipX;
          pipelineStates = self->_pipelineStates;
          v46 = @"convertToFloat180RotationFlipYInference";
          v47 = @"convertToFloatNoRotationInference";
        }
        if (flipX) {
          v48 = v46;
        }
        else {
          v48 = v47;
        }
        uint64_t v43 = [(NSDictionary *)pipelineStates objectForKeyedSubscript:v48];
        *(float *)&uint64_t v68 = (float)v32 / (float)v35;
        goto LABEL_27;
      }
      BOOL v38 = self->_flipX;
      v39 = self->_pipelineStates;
      v40 = @"convertToFloat90CCWRotationFlipYInference";
      v41 = @"convertToFloat270CCWRotationInference";
      goto LABEL_17;
    }
    uint64_t v56 = 4294935553;
  }
  else
  {
    uint64_t v56 = 4294935584;
  }
  if (a7)
  {
    (*((void (**)(id, uint64_t, BWInferenceDepthScalingProvider *))a7 + 2))(a7, v56, self);
    a7 = 0;
  }
  v31 = 0;
LABEL_37:

  return v56;
}

uint64_t __117__BWInferenceDepthScalingProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t result, void *a2)
{
  uint64_t v3 = result;
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    int result = kdebug_trace();
  }
  if (*(void *)(v3 + 40))
  {
    [a2 error];
    objc_super v4 = *(uint64_t (**)(void))(*(void *)(v3 + 40) + 16);
    return v4();
  }
  return result;
}

- (BWInferenceSubmittable)submittable
{
  if (*((_DWORD *)self + 11) != 1) {
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
  outputRequirements = self->_outputRequirements;
  if (self->_concurrencyWidth >= 2)
  {
    outputRequirements = (NSArray *)(id)[(NSArray *)self->_outputRequirements mutableCopy];
    unint64_t concurrencyWidth = self->_concurrencyWidth;
    if (concurrencyWidth >= 2)
    {
      do
      {
        [(NSArray *)outputRequirements addObjectsFromArray:self->_outputRequirements];
        --concurrencyWidth;
      }
      while (concurrencyWidth > 1);
    }
  }
  v5 = [BWInferenceProviderStorage alloc];
  v7[0] = self->_inputRequirement;
  return -[BWInferenceProviderStorage initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:](v5, "initWithRequirementsNeedingPixelBuffers:requirementsNeedingPixelBufferPools:", [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1], outputRequirements);
}

- (int)type
{
  return 0;
}

- (NSArray)inputVideoRequirements
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = self->_inputRequirement;
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (NSArray)outputVideoRequirements
{
  return self->_outputRequirements;
}

- (NSArray)inputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (NSArray)outputMetadataRequirements
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return 0;
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

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  return 0;
}

- (BOOL)allowsAsyncPropagation
{
  return self->_processingMode == 1;
}

@end