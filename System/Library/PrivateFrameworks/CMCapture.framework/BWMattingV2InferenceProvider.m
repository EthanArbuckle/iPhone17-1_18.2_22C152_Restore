@interface BWMattingV2InferenceProvider
+ (id)inputAttachedMediaKeyForMattingOutputType:(unsigned int)a3;
+ (void)initialize;
- (BOOL)allowsAsyncPropagation;
- (BWInferenceExecutable)executable;
- (BWInferenceExtractable)extractable;
- (BWMattingV2InferenceProvider)initWithConfiguration:(id)a3;
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
- (uint64_t)_loadMattingProcessor;
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)_configureMattingProcessor;
- (void)_outputPixelBufferForOutputVideoRequirement:(void *)a3 storage:(int)a4 isMatte:;
- (void)_processorOptions;
- (void)dealloc;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
- (void)propagateMattingOutputToSampleBuffer:(void *)a3 storage:;
@end

@implementation BWMattingV2InferenceProvider

- (NSArray)outputVideoRequirements
{
  return &self->_outputVideoRequirements->super;
}

- (NSArray)inputVideoRequirements
{
  return &self->_inputVideoRequirements->super;
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  uint64_t v2 = [(BWMattingV2InferenceProvider *)self executionTarget];
  return +[BWInferenceEngine allowedBufferCompressionDirectionForExecutionTarget:v2];
}

- (int)executionTarget
{
  return 1;
}

- (BWMattingV2InferenceProvider)initWithConfiguration:(id)a3
{
  v66[1] = *MEMORY[0x1E4F143B8];
  v62.receiver = self;
  v62.super_class = (Class)BWMattingV2InferenceProvider;
  v4 = [(BWMattingV2InferenceProvider *)&v62 init];
  if (!v4) {
    return v4;
  }
  v49 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v48 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!a3 || ([a3 mainImageDownscalingFactor], v7 == 0.0))
  {
LABEL_21:

    return 0;
  }
  v4->_sensorConfigurationsByPortType = (NSDictionary *)(id)[a3 sensorConfigurationsByPortType];
  int v8 = [+[FigCaptureCameraParameters sharedInstance] mattingVersion];
  if (!v8)
  {
    id v9 = [(NSArray *)[(NSDictionary *)v4->_sensorConfigurationsByPortType allValues] firstObject];
    int v8 = -[FigCaptureCameraParameters mattingVersionForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "mattingVersionForPortType:sensorIDString:", [v9 portType], objc_msgSend(v9, "sensorIDString"));
  }
  v4->_mattingProcessorVersion = v8;
  v4->_mattingTuningConfiguration = [a3 tuningConfiguration];
  v4->_submitWithoutSynchronization = [a3 submitWithoutSynchronization];
  v4->_appliesFinalCropRect = [a3 appliesFinalCropRect];
  [a3 targetAspectRatio];
  int v11 = v10;
  char v12 = [a3 appliesFinalCropRect];
  [a3 mainImageDownscalingFactor];
  v4->_mainImageDownscalingFactor = v13;
  v14 = [BWInferenceLazyVideoRequirement alloc];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke;
  v59[3] = &unk_1E5C28528;
  int v60 = v11;
  v59[4] = a3;
  char v61 = v12;
  uint64_t v15 = [(BWInferenceLazyVideoRequirement *)v14 initWithAttachedMediaKey:@"PrimaryFormat" preparedByAttachedMediaKey:@"PrimaryFormat" videoFormatProvider:v59];
  v4->_primaryFormatInputVideoRequirement = (BWInferenceVideoRequirement *)v15;
  [(NSMutableArray *)v49 addObject:v15];
  if ([a3 depthDataDeliveryEnabled])
  {
    v16 = [[BWInferenceLazyVideoRequirement alloc] initWithAttachedMediaKey:@"Depth" preparedByAttachedMediaKey:@"Depth" videoFormatProvider:&__block_literal_global_70];
    v4->_depthInputVideoRequirement = &v16->super;
    [(NSMutableArray *)v49 addObject:v16];
    v17 = [[BWInferenceLazyVideoRequirement alloc] initWithAttachedMediaKey:@"Depth" preparedByAttachedMediaKey:@"Depth" videoFormatProvider:&__block_literal_global_18];
    v4->_disparityInputVideoRequirement = &v17->super;
    [(NSMutableArray *)v49 addObject:v17];
  }
  __int16 v18 = [a3 enabledMattes];
  v19 = (void *)[MEMORY[0x1E4F1CA48] array];
  v20 = v19;
  if ((v18 & 4) != 0)
  {
    [v19 addObject:&unk_1EFB00248];
    if ((v18 & 8) == 0)
    {
LABEL_10:
      if ((v18 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_37;
    }
  }
  else if ((v18 & 8) == 0)
  {
    goto LABEL_10;
  }
  [v20 addObject:&unk_1EFB00260];
  if ((v18 & 0x10) == 0)
  {
LABEL_11:
    if ((v18 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v20 addObject:&unk_1EFB00278];
  if ((v18 & 0x20) == 0)
  {
LABEL_12:
    if ((v18 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_38:
  [v20 addObject:&unk_1EFB00290];
  if ((v18 & 0x40) != 0) {
LABEL_13:
  }
    [v20 addObject:&unk_1EFB002A8];
LABEL_14:
  v4->_enabledSemanticMattingOutputTypes = (NSArray *)[v20 copy];
  if ((v18 & 2) != 0)
  {
    v21 = objc_alloc_init(BWInferenceVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v21 setWidth:512];
    [(BWVideoFormatRequirements *)v21 setHeight:384];
    [(BWVideoFormatRequirements *)v21 setSupportedPixelFormats:&unk_1EFB03980];
    [(BWInferenceVideoFormatRequirements *)v21 setDeviceOriented:0];
    [(BWVideoFormatRequirements *)v21 setBytesPerRowAlignment:64];
    v66[0] = v21;
    v22 = -[BWInferenceVideoRequirement initWithAttachedMediaKey:videoFormat:]([BWInferenceVideoRequirement alloc], "initWithAttachedMediaKey:videoFormat:", 0x1EFA6A200, +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1]));
    v4->_segmentationInputVideoRequirement = v22;
    [(NSMutableArray *)v49 addObject:v22];
    v23 = [BWInferenceLazyVideoRequirement alloc];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke_43;
    v57[3] = &unk_1E5C243B8;
    v57[4] = a3;
    int v58 = v11;
    uint64_t v24 = [(BWInferenceLazyVideoRequirement *)v23 initWithAttachedMediaKey:0x1EFA74420 preparedByAttachedMediaKey:@"PrimaryFormat" videoFormatProvider:v57];
    v4->_segmentationOutputVideoRequirement = (BWInferenceVideoRequirement *)v24;
    [(NSMutableArray *)v48 addObject:v24];
    if [a3 depthDataDeliveryEnabled] && (v18)
    {
      v25 = [BWInferenceLazyVideoRequirement alloc];
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = 3221225472;
      v56[2] = __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke_2;
      v56[3] = &unk_1E5C243E0;
      v56[4] = a3;
      uint64_t v26 = [(BWInferenceLazyVideoRequirement *)v25 initWithAttachedMediaKey:0x1EFA74440 preparedByAttachedMediaKey:@"PrimaryFormat" videoFormatProvider:v56];
      v4->_refinedDepthOutputVideoRequirement = (BWInferenceVideoRequirement *)v26;
      [(NSMutableArray *)v48 addObject:v26];
    }
    if ((v18 & 0x80) != 0)
    {
      v27 = [[BWInferenceCloneVideoRequirement alloc] initWithAttachedMediaKey:0x1EFA745C0 sourceVideoRequirement:v4->_segmentationInputVideoRequirement];
      v4->_lowResSegmentationCloneOutputVideoRequirement = v27;
      if (!v27
        || VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &v4->_lowResSegmentationCloneCopySession))
      {
        goto LABEL_21;
      }
    }
  }
  __int16 v44 = v18;
  v45 = v6;
  v46 = v5;
  v28 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  [(BWVideoFormatRequirements *)v28 setWidth:512];
  [(BWVideoFormatRequirements *)v28 setHeight:384];
  [(BWVideoFormatRequirements *)v28 setSupportedPixelFormats:&unk_1EFB039B0];
  [(BWInferenceVideoFormatRequirements *)v28 setDeviceOriented:0];
  [(BWVideoFormatRequirements *)v28 setBytesPerRowAlignment:64];
  v65 = v28;
  id v47 = +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1]);
  v4->_semanticMatteInputVideoRequirementsByMattingOutputType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4->_semanticMatteOutputVideoRequirementsByMattingOutputType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v29 = [&unk_1EFB03968 countByEnumeratingWithState:&v52 objects:v64 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v53 != v31) {
          objc_enumerationMutation(&unk_1EFB03968);
        }
        v33 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        if ([(NSArray *)v4->_enabledSemanticMattingOutputTypes containsObject:v33])
        {
          uint64_t v34 = [v33 intValue];
          id v35 = a3;
          uint64_t v36 = mv2ip_inputAttachedMediaKeyForMattingOutputType(v34);
          v37 = mv2ip_outputAttachedMediaKeyForMattingOutputType(v34);
          v38 = [[BWInferenceVideoRequirement alloc] initWithAttachedMediaKey:v36 videoFormat:v47];
          [(NSMutableArray *)v49 addObject:v38];
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_semanticMatteInputVideoRequirementsByMattingOutputType, "setObject:forKeyedSubscript:", v38, [NSNumber numberWithUnsignedInt:v34]);

          a3 = v35;
          v39 = [BWInferenceLazyVideoRequirement alloc];
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke_3;
          v50[3] = &unk_1E5C243B8;
          v50[4] = v35;
          int v51 = v11;
          v40 = [(BWInferenceLazyVideoRequirement *)v39 initWithAttachedMediaKey:v37 preparedByAttachedMediaKey:@"PrimaryFormat" videoFormatProvider:v50];
          [(NSMutableArray *)v48 addObject:v40];
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_semanticMatteOutputVideoRequirementsByMattingOutputType, "setObject:forKeyedSubscript:", v40, [NSNumber numberWithUnsignedInt:v34]);
        }
      }
      uint64_t v30 = [&unk_1EFB03968 countByEnumeratingWithState:&v52 objects:v64 count:16];
    }
    while (v30);
  }
  if ((v44 & 0x100) != 0)
  {
    v41 = [BWInferenceMetadataRequirement alloc];
    uint64_t v63 = 0x1EFA6A1C0;
    uint64_t v42 = -[BWInferenceMetadataRequirement initWithMetadataKeys:](v41, "initWithMetadataKeys:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1]);
    v4->_outputMasksContainsValidContentRequirement = (BWInferenceMetadataRequirement *)v42;
    [(NSMutableArray *)v45 addObject:v42];
  }
  v4->_inputVideoRequirements = v49;
  v4->_outputVideoRequirements = v48;
  v4->_inputMetadataRequirements = v46;
  v4->_outputMetadataRequirements = v45;
  v4->_metalCommandQueue = (MTLCommandQueue *)(id)[a3 metalCommandQueue];
  v4->_sdofRenderingTuningParameters = (NSDictionary *)(id)[a3 sdofRenderingTuningParameters];
  return v4;
}

- (id)newStorage
{
  v3 = [(BWMattingV2InferenceProvider *)self cloneVideoRequirements];
  v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  [v4 addObjectsFromArray:self->_inputVideoRequirements];
  [v4 addObjectsFromArray:self->_outputVideoRequirements];
  if ([(NSArray *)v3 count]) {
    [v4 addObjectsFromArray:v3];
  }
  v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  [v5 addObjectsFromArray:self->_outputVideoRequirements];
  if ([(NSArray *)v3 count]) {
    [v5 addObjectsFromArray:v3];
  }
  v6 = [BWMattingInferenceStorage alloc];
  return [(BWInferenceProviderStorage *)v6 initWithRequirementsNeedingPixelBuffers:v4 requirementsNeedingPixelBufferPools:v5];
}

- (NSArray)cloneVideoRequirements
{
  v3[1] = *MEMORY[0x1E4F143B8];
  if (!self->_lowResSegmentationCloneOutputVideoRequirement) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  v3[0] = self->_lowResSegmentationCloneOutputVideoRequirement;
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

id __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  int v4 = [a2 width];
  unsigned int v5 = [a2 height];
  LODWORD(a2) = v5;
  float v7 = *(float *)(a1 + 40);
  if (v7 != 0.0)
  {
    unint64_t v8 = FigCaptureMetadataUtilitiesEnforceAspectRatioWithStillImageDimensions(v4 | ((unint64_t)v5 << 32), v7);
    int v4 = v8;
    a2 = (void *)HIDWORD(v8);
  }
  [*(id *)(a1 + 32) mainImageDownscalingFactor];
  [(BWVideoFormatRequirements *)v3 setWidth:(unint64_t)(float)((float)v4 / v9)];
  [*(id *)(a1 + 32) mainImageDownscalingFactor];
  [(BWVideoFormatRequirements *)v3 setHeight:(unint64_t)(float)((float)(int)a2 / v10)];
  if (*(unsigned char *)(a1 + 44)) {
    id v11 = +[BWInferenceFinalRectCropDescriptor finalCropRectDescriptorWithName:@"Matting"];
  }
  else {
    id v11 = 0;
  }
  [(BWInferenceVideoFormatRequirements *)v3 setCropDescriptor:v11];
  [(BWVideoFormatRequirements *)v3 setSupportedPixelFormats:&unk_1EFB03920];
  [(BWInferenceVideoFormatRequirements *)v3 setDeviceOriented:0];
  v13[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1]);
}

+ (id)inputAttachedMediaKeyForMattingOutputType:(unsigned int)a3
{
  return (id)mv2ip_inputAttachedMediaKeyForMattingOutputType(a3);
}

- (uint64_t)_loadMattingProcessor
{
  if (!a1) {
    return 0;
  }
  if (BWLoadProcessorBundle(@"Matting", *(unsigned int *)(a1 + 24)))
  {
    uint64_t v2 = [objc_alloc(NSClassFromString(&cfstr_Figmatting.isa)) initWithCommandQueue:*(void *)(a1 + 168)];
    *(void *)(a1 + 16) = v2;
    if (v2) {
      return 0;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return FigSignalErrorAt();
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  int v4 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  if (!self->_mattingProcessor
    && (-[BWMattingV2InferenceProvider _loadMattingProcessor]((uint64_t)self)
     || -[BWMattingV2InferenceProvider _configureMattingProcessor](self)))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v5 = -31702;
  }
  else
  {
    int v5 = 0;
  }
  if (*v4 == 1) {
    kdebug_trace();
  }
  return v5;
}

- (void)_configureMattingProcessor
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    uint64_t v2 = -[BWMattingV2InferenceProvider _processorOptions](result);
    if (v2)
    {
      [(id)v1[2] setOptions:v2];
      uint64_t v3 = [(id)v1[9] videoFormat];
      if (!v3)
      {
LABEL_35:
        fig_log_get_emitter();
        FigDebugAssert3();
        return 0;
      }
      int v4 = (void *)v3;
      int v5 = (void *)v1[10];
      if (v5)
      {
        v6 = (void *)[v5 videoFormat];
        if (!v6) {
          goto LABEL_35;
        }
      }
      else
      {
        v6 = 0;
      }
      float v7 = (void *)v1[12];
      if (v7)
      {
        unint64_t v8 = (void *)[v7 videoFormat];
        if (!v8) {
          goto LABEL_35;
        }
      }
      else
      {
        unint64_t v8 = 0;
      }
      float v9 = (void *)v1[16];
      int v10 = (v1[15] != 0) | (2 * (v1[13] != 0));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        v28 = v4;
        uint64_t v13 = *(void *)v31;
LABEL_14:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
          result = objc_msgSend((id)objc_msgSend((id)v1[17], "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v15, "intValue"))), "videoFormat");
          if (!result) {
            break;
          }
          unint64_t v8 = result;
          int v16 = [v15 intValue];
          int v17 = 0;
          if (v16 > 15)
          {
            if (v16 == 16 || v16 == 32 || v16 == 64) {
LABEL_20:
            }
              int v17 = v16;
          }
          else
          {
            switch(v16)
            {
              case 1:
              case 2:
              case 4:
              case 8:
                goto LABEL_20;
              default:
                break;
            }
          }
          v10 |= v17;
          if (v12 == ++v14)
          {
            uint64_t v18 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
            uint64_t v12 = v18;
            if (!v18)
            {
              int v4 = v28;
              goto LABEL_29;
            }
            goto LABEL_14;
          }
        }
      }
      else
      {
LABEL_29:
        int v19 = [v4 width];
        int v20 = [v4 height];
        int v21 = [v6 width];
        int v22 = [v6 height];
        int v23 = [v8 width];
        int v24 = [v8 height];
        int v25 = *((_DWORD *)v1 + 7);
        uint64_t v26 = (void *)v1[2];
        v29[0] = v19;
        v29[1] = v20;
        v29[2] = v21;
        v29[3] = v22;
        v29[4] = v23;
        v29[5] = v24;
        v29[6] = v10;
        v29[7] = v25;
        [v26 setConfig:v29];
        int v27 = [(id)v1[2] prepareToProcess:0];
        result = 0;
        if (v27) {
          return (void *)FigSignalErrorAt();
        }
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return (void *)FigSignalErrorAt();
    }
  }
  return result;
}

- (void)_processorOptions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    uint64_t v2 = result[15];
    uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = *MEMORY[0x1E4F535B0];
    [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F535B0]];
    if (v2) {
      [v3 setObject:v1[23] forKeyedSubscript:@"SDOFRenderingParameters"];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id obj = (id)v1[1];
    uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
LABEL_6:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v1[1], "objectForKeyedSubscript:", v10), "sensorIDDictionary"), "objectForKeyedSubscript:", @"MattingParameters");
        uint64_t v12 = [v11 objectForKeyedSubscript:objc_msgSend(NSString, "stringWithFormat:", @"%@V%d", @"Matting", *((unsigned int *)v1 + 6))];
        if (!v12) {
          break;
        }
        objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v5), "setObject:forKeyedSubscript:", v12, v10);
        if (v7 == ++v9)
        {
          uint64_t v7 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v7) {
            goto LABEL_6;
          }
          break;
        }
      }
    }
    if ([v3 count]) {
      uint64_t v13 = v3;
    }
    else {
      uint64_t v13 = 0;
    }
    return (id)[v13 copy];
  }
  return result;
}

+ (void)initialize
{
}

id __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke_10(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", [a2 width]);
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", [a2 height]);
  [(BWVideoFormatRequirements *)v3 setSupportedPixelFormats:&unk_1EFB03938];
  [(BWInferenceVideoFormatRequirements *)v3 setDeviceOriented:0];
  v5[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1]);
}

id __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke_16(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v3, "setWidth:", [a2 width]);
  -[BWVideoFormatRequirements setHeight:](v3, "setHeight:", [a2 height]);
  [(BWVideoFormatRequirements *)v3 setSupportedPixelFormats:&unk_1EFB03950];
  [(BWInferenceVideoFormatRequirements *)v3 setDeviceOriented:0];
  v5[0] = v3;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1]);
}

id __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke_43(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) mainImageDownscalingFactor];
  float v5 = *(float *)(a1 + 40);
  return mv2ip_outputMatteInferenceVideoFormat(a2, v4, v5);
}

id __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke_2(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  float v4 = objc_alloc_init(BWInferenceVideoFormatRequirements);
  float v5 = (float)(unint64_t)[a2 width];
  [*(id *)(a1 + 32) mainImageDownscalingFactor];
  [(BWVideoFormatRequirements *)v4 setWidth:(unint64_t)(float)(v5 / v6)];
  float v7 = (float)(unint64_t)[a2 height];
  [*(id *)(a1 + 32) mainImageDownscalingFactor];
  [(BWVideoFormatRequirements *)v4 setHeight:(unint64_t)(float)(v7 / v8)];
  [(BWVideoFormatRequirements *)v4 setSupportedPixelFormats:&unk_1EFB03998];
  [(BWInferenceVideoFormatRequirements *)v4 setDeviceOriented:0];
  [(BWVideoFormatRequirements *)v4 setBytesPerRowAlignment:64];
  v10[0] = v4;
  return +[BWInferenceVideoFormat formatByResolvingRequirements:](BWInferenceVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1]);
}

id __54__BWMattingV2InferenceProvider_initWithConfiguration___block_invoke_3(uint64_t a1, void *a2)
{
  [*(id *)(a1 + 32) mainImageDownscalingFactor];
  float v5 = *(float *)(a1 + 40);
  return mv2ip_outputMatteInferenceVideoFormat(a2, v4, v5);
}

- (void)dealloc
{
  [(FigMatting *)self->_mattingProcessor finishProcessing];
  lowResSegmentationCloneCopySession = self->_lowResSegmentationCloneCopySession;
  if (lowResSegmentationCloneCopySession) {
    CFRelease(lowResSegmentationCloneCopySession);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWMattingV2InferenceProvider;
  [(BWMattingV2InferenceProvider *)&v4 dealloc];
}

- (int)type
{
  return 201;
}

- (NSSet)preventionReasons
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (NSArray)inputMetadataRequirements
{
  return &self->_inputMetadataRequirements->super;
}

- (NSArray)outputMetadataRequirements
{
  return &self->_outputMetadataRequirements->super;
}

- (BWInferenceExecutable)executable
{
  return 0;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v56 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v13 = (double *)MEMORY[0x1E4F1DB20];
  if (!self->_mattingProcessor) {
    goto LABEL_74;
  }
  uint64_t v14 = [a4 pixelBufferForRequirement:self->_primaryFormatInputVideoRequirement];
  if (v14)
  {
    if (self->_depthInputVideoRequirement)
    {
      uint64_t v15 = objc_msgSend(a4, "pixelBufferForRequirement:");
      if (!v15)
      {
LABEL_74:
        uint64_t v26 = FigSignalErrorAt();
        LOBYTE(v14) = 0;
        goto LABEL_66;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    if (self->_disparityInputVideoRequirement)
    {
      uint64_t v16 = objc_msgSend(a4, "pixelBufferForRequirement:");
      if (!v16) {
        goto LABEL_74;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
    CGSize v17 = (CGSize)*((_OWORD *)v13 + 1);
    rect.origin = *(CGPoint *)v13;
    rect.size = v17;
    if (self->_refinedDepthOutputVideoRequirement)
    {
      CFDictionaryRef v18 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55BE8], 0);
      if (!v18 || !CGRectMakeWithDictionaryRepresentation(v18, &rect)) {
        goto LABEL_74;
      }
    }
    if (self->_segmentationInputVideoRequirement)
    {
      uint64_t v19 = objc_msgSend(a4, "pixelBufferForRequirement:");
      if (!v19) {
        goto LABEL_74;
      }
      uint64_t v20 = (__CVBuffer *)v19;
      int v21 = -[BWMattingV2InferenceProvider _outputPixelBufferForOutputVideoRequirement:storage:isMatte:]((uint64_t)self, (uint64_t)self->_segmentationOutputVideoRequirement, a4, 1);
      if (!v21) {
        goto LABEL_74;
      }
      long long v53 = v21;
      refinedDepthOutputVideoRequirement = self->_refinedDepthOutputVideoRequirement;
      if (refinedDepthOutputVideoRequirement)
      {
        int v23 = -[BWMattingV2InferenceProvider _outputPixelBufferForOutputVideoRequirement:storage:isMatte:]((uint64_t)self, (uint64_t)refinedDepthOutputVideoRequirement, a4, 0);
        if (!v23) {
          goto LABEL_74;
        }
      }
      else
      {
        int v23 = 0;
      }
      long long v52 = v23;
      lowResSegmentationCloneOutputVideoRequirement = self->_lowResSegmentationCloneOutputVideoRequirement;
      if (lowResSegmentationCloneOutputVideoRequirement)
      {
        int v24 = (__CVBuffer *)-[BWMattingV2InferenceProvider _outputPixelBufferForOutputVideoRequirement:storage:isMatte:]((uint64_t)self, (uint64_t)lowResSegmentationCloneOutputVideoRequirement, a4, 1);
        if (!v24 || !self->_lowResSegmentationCloneCopySession)
        {
          LOBYTE(v14) = 0;
          uint64_t v26 = 0;
          goto LABEL_66;
        }
      }
      else
      {
        int v24 = 0;
      }
    }
    else
    {
      int v24 = 0;
      long long v52 = 0;
      long long v53 = 0;
      uint64_t v20 = 0;
    }
    uint64_t v50 = v16;
    uint64_t v51 = v15;
    destinationBuffer = v24;
    id v54 = a7;
    long long v55 = v20;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    enabledSemanticMattingOutputTypes = self->_enabledSemanticMattingOutputTypes;
    uint64_t v28 = [(NSArray *)enabledSemanticMattingOutputTypes countByEnumeratingWithState:&v68 objects:v76 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v69;
      while (2)
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v69 != v30) {
            objc_enumerationMutation(enabledSemanticMattingOutputTypes);
          }
          uint64_t v32 = [*(id *)(*((void *)&v68 + 1) + 8 * i) intValue];
          uint64_t v33 = objc_msgSend(a4, "pixelBufferForRequirement:", -[NSMutableDictionary objectForKeyedSubscript:](self->_semanticMatteInputVideoRequirementsByMattingOutputType, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v32)));
          if (!v33
            || (objc_msgSend(v12, "setObject:forKeyedSubscript:", v33, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v32)), (uint64_t v34 = -[BWMattingV2InferenceProvider _outputPixelBufferForOutputVideoRequirement:storage:isMatte:]((uint64_t)self, -[NSMutableDictionary objectForKeyedSubscript:](self->_semanticMatteOutputVideoRequirementsByMattingOutputType, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v32)), a4, 1)) == 0))
          {
            LOBYTE(v14) = 0;
            uint64_t v26 = 4294935578;
            goto LABEL_61;
          }
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v34, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v32));
        }
        uint64_t v29 = [(NSArray *)enabledSemanticMattingOutputTypes countByEnumeratingWithState:&v68 objects:v76 count:16];
        if (v29) {
          continue;
        }
        break;
      }
    }
    uint64_t v35 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    if (self->_outputMasksContainsValidContentRequirement)
    {
      uint64_t v36 = v35;
      if (v20) {
        objc_msgSend(v35, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", mv2ip_pixelBufferContainsValidContent(v20)), 0x1EFA74420);
      }
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      uint64_t v37 = [v12 countByEnumeratingWithState:&v64 objects:v75 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v65;
        do
        {
          for (uint64_t j = 0; j != v38; ++j)
          {
            if (*(void *)v65 != v39) {
              objc_enumerationMutation(v12);
            }
            v41 = *(void **)(*((void *)&v64 + 1) + 8 * j);
            uint64_t v42 = mv2ip_outputAttachedMediaKeyForMattingOutputType([v41 intValue]);
            if (v42)
            {
              v43 = v42;
              __int16 v44 = (__CVBuffer *)[v12 objectForKeyedSubscript:v41];
              if (v44) {
                objc_msgSend(v36, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", mv2ip_pixelBufferContainsValidContent(v44)), v43);
              }
            }
          }
          uint64_t v38 = [v12 countByEnumeratingWithState:&v64 objects:v75 count:16];
        }
        while (v38);
      }
      if ([v36 count])
      {
        uint64_t v73 = 0x1EFA6A1C0;
        v74 = v36;
        objc_msgSend(a4, "setDictionary:forMetadataRequirement:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1), self->_outputMasksContainsValidContentRequirement);
      }
    }
    [(FigMatting *)self->_mattingProcessor setImagePixelBuffer:v14];
    [(FigMatting *)self->_mattingProcessor setInputDepthPixelBuffer:v51];
    [(FigMatting *)self->_mattingProcessor setInputDisparityPixelBuffer:v50];
    -[FigMatting setSyntheticFocusRectangle:](self->_mattingProcessor, "setSyntheticFocusRectangle:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    [(FigMatting *)self->_mattingProcessor setInputSegmentationPixelBuffer:v55];
    [(FigMatting *)self->_mattingProcessor setOutputMattePixelBuffer:v53];
    [(FigMatting *)self->_mattingProcessor setOutputRefinedDisparityPixelBuffer:v52];
    -[FigMatting setInputSemanticsHairPixelBuffer:](self->_mattingProcessor, "setInputSemanticsHairPixelBuffer:", [v12 objectForKeyedSubscript:&unk_1EFB00248]);
    -[FigMatting setInputSemanticsSkinPixelBuffer:](self->_mattingProcessor, "setInputSemanticsSkinPixelBuffer:", [v12 objectForKeyedSubscript:&unk_1EFB00260]);
    -[FigMatting setInputSemanticsTeethPixelBuffer:](self->_mattingProcessor, "setInputSemanticsTeethPixelBuffer:", [v12 objectForKeyedSubscript:&unk_1EFB00278]);
    -[FigMatting setInputSemanticsGlassesPixelBuffer:](self->_mattingProcessor, "setInputSemanticsGlassesPixelBuffer:", [v12 objectForKeyedSubscript:&unk_1EFB00290]);
    -[FigMatting setInputSemanticsSkyPixelBuffer:](self->_mattingProcessor, "setInputSemanticsSkyPixelBuffer:", [v12 objectForKeyedSubscript:&unk_1EFB002A8]);
    -[FigMatting setOutputSemanticsHairPixelBuffer:](self->_mattingProcessor, "setOutputSemanticsHairPixelBuffer:", [v56 objectForKeyedSubscript:&unk_1EFB00248]);
    -[FigMatting setOutputSemanticsSkinPixelBuffer:](self->_mattingProcessor, "setOutputSemanticsSkinPixelBuffer:", [v56 objectForKeyedSubscript:&unk_1EFB00260]);
    -[FigMatting setOutputSemanticsTeethPixelBuffer:](self->_mattingProcessor, "setOutputSemanticsTeethPixelBuffer:", [v56 objectForKeyedSubscript:&unk_1EFB00278]);
    -[FigMatting setOutputSemanticsGlassesPixelBuffer:](self->_mattingProcessor, "setOutputSemanticsGlassesPixelBuffer:", [v56 objectForKeyedSubscript:&unk_1EFB00290]);
    -[FigMatting setOutputSemanticsSkyPixelBuffer:](self->_mattingProcessor, "setOutputSemanticsSkyPixelBuffer:", [v56 objectForKeyedSubscript:&unk_1EFB002A8]);
    if ([(FigMatting *)self->_mattingProcessor process])
    {
      uint64_t v26 = FigSignalErrorAt();
      LOBYTE(v14) = 0;
LABEL_61:
      a7 = v54;
      uint64_t v11 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      uint64_t v13 = (double *)MEMORY[0x1E4F1DB20];
    }
    else
    {
      a7 = v54;
      uint64_t v11 = (_DWORD *)MEMORY[0x1E4F1EBA8];
      uint64_t v13 = (double *)MEMORY[0x1E4F1DB20];
      if (destinationBuffer
        && v55
        && VTPixelTransferSessionTransferImage(self->_lowResSegmentationCloneCopySession, v55, destinationBuffer))
      {
        LOBYTE(v14) = 0;
        uint64_t v26 = 4294935586;
      }
      else
      {
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v59 = __114__BWMattingV2InferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
        int v60 = &unk_1E5C29218;
        int v63 = 0;
        char v61 = self;
        id v62 = v54;
        if (self->_submitWithoutSynchronization)
        {
          __114__BWMattingV2InferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke((uint64_t)v58);
        }
        else
        {
          metalCommandQueue = self->_metalCommandQueue;
          if (metalCommandQueue)
          {
            v46 = (void *)[(MTLCommandQueue *)metalCommandQueue commandBuffer];
            [v46 setLabel:@"inference_matting_async_completion"];
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = __114__BWMattingV2InferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_2;
            v57[3] = &unk_1E5C27EB8;
            v57[4] = v58;
            [v46 addScheduledHandler:v57];
            [v46 commit];
          }
          else
          {
            [(FigMatting *)self->_mattingProcessor finishScheduling];
            v59((uint64_t)v58);
          }
        }
        uint64_t v26 = 0;
        LOBYTE(v14) = 1;
      }
    }
  }
  else
  {
    uint64_t v26 = FigSignalErrorAt();
  }
LABEL_66:
  [(FigMatting *)self->_mattingProcessor setImagePixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setInputDepthPixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setInputDisparityPixelBuffer:0];
  -[FigMatting setSyntheticFocusRectangle:](self->_mattingProcessor, "setSyntheticFocusRectangle:", *v13, v13[1], v13[2], v13[3]);
  [(FigMatting *)self->_mattingProcessor setFaceLandmarks:0];
  [(FigMatting *)self->_mattingProcessor setFaceSegments:0];
  [(FigMatting *)self->_mattingProcessor setExifOrientation:0];
  [(FigMatting *)self->_mattingProcessor setInputSegmentationPixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setOutputMattePixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setOutputRefinedDisparityPixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setInputSemanticsHairPixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setInputSemanticsSkinPixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setInputSemanticsTeethPixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setInputSemanticsGlassesPixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setInputSemanticsSkyPixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setOutputSemanticsHairPixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setOutputSemanticsSkinPixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setOutputSemanticsTeethPixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setOutputSemanticsGlassesPixelBuffer:0];
  [(FigMatting *)self->_mattingProcessor setOutputSemanticsSkyPixelBuffer:0];

  if (*v11 == 1) {
    kdebug_trace();
  }
  if (a7) {
    char v47 = v14;
  }
  else {
    char v47 = 1;
  }
  if ((v47 & 1) == 0) {
    (*((void (**)(id, uint64_t, BWMattingV2InferenceProvider *))a7 + 2))(a7, v26, self);
  }
  return v26;
}

- (void)_outputPixelBufferForOutputVideoRequirement:(void *)a3 storage:(int)a4 isMatte:
{
  if (!a1) {
    return 0;
  }
  float v7 = (void *)[a3 pixelBufferForRequirement:a2];
  if (!v7)
  {
    float v7 = objc_msgSend((id)objc_msgSend(a3, "pixelBufferPoolForRequirement:", a2), "newPixelBuffer");
    [a3 setPixelBuffer:v7 forRequirement:a2];
    if (v7) {
      CFRelease(v7);
    }
  }
  if (a4) {
    CVBufferSetAttachment((CVBufferRef)v7, (CFStringRef)*MEMORY[0x1E4F24BC8], (CFTypeRef)*MEMORY[0x1E4F24BE8], kCVAttachmentMode_ShouldPropagate);
  }
  return v7;
}

uint64_t __114__BWMattingV2InferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1)
{
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __114__BWMattingV2InferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  -[BWMattingV2InferenceProvider propagateMattingOutputToSampleBuffer:storage:]((uint64_t)self, a6, a4);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  outputMetadataRequirements = self->_outputMetadataRequirements;
  uint64_t v12 = [(NSMutableArray *)outputMetadataRequirements countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(outputMetadataRequirements);
        }
        uint64_t v16 = (void *)[a4 newMetadataDictionarySatisfyingRequirement:*(void *)(*((void *)&v17 + 1) + 8 * v15)];
        [a3 addEntriesFromDictionary:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)outputMetadataRequirements countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
  if (*v10 == 1) {
    kdebug_trace();
  }
}

- (void)propagateMattingOutputToSampleBuffer:(void *)a3 storage:
{
  v88[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  float v5 = (CFStringRef *)MEMORY[0x1E4F53070];
  float v6 = (uint64_t *)MEMORY[0x1E4F53388];
  float v7 = (uint64_t *)MEMORY[0x1E4F533D0];
  if (!*(void *)(a1 + 104))
  {
    uint64_t v34 = (uint64_t *)MEMORY[0x1E4F533D0];
    CFTypeRef cf = 0;
    long long v69 = 0;
    long long v70 = 0;
    goto LABEL_19;
  }
  BWSampleBufferRemoveAttachedMedia(a2, 0x1EFA6A200);
  uint64_t v8 = [a3 newSampleBufferSatisfyingRequirement:*(void *)(a1 + 104) withPropagationSampleBuffer:a2];
  if (!v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return;
  }
  uint64_t v9 = (void *)v8;
  uint64_t v10 = (unsigned __int16)(*(_DWORD *)(a1 + 24) - 1) | 0x10000u;
  uint64_t v87 = *MEMORY[0x1E4F55AB0];
  v88[0] = [NSNumber numberWithUnsignedInt:v10];
  uint64_t v11 = (const void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:&v87 count:1];
  CMSetAttachment(v9, (CFStringRef)*MEMORY[0x1E4F55B80], v11, 1u);
  id v12 = BWCMSampleBufferCopyReattachAndReturnMutableMetadata(v9);
  if (*(unsigned char *)(a1 + 33))
  {
    unint64_t v13 = BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)a2);
    uint64_t v14 = v5;
    uint64_t v15 = v13;
    uint64_t v16 = v14;
    CMGetAttachment(a2, *v14, 0);
    double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v19 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v82 = *MEMORY[0x1E4F1DB20];
    long long v83 = v20;
    CGFloat v21 = v19;
    CGFloat v22 = v18;
    CGFloat v23 = v17;
    CGFloat v24 = *(double *)&v82;
    if (FigCFDictionaryGetCGRectIfPresent())
    {
      FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v82, *((double *)&v82 + 1), *(double *)&v83, *((double *)&v83 + 1));
      CGFloat v24 = v25;
      CGFloat v23 = v26;
      CGFloat v22 = v27;
      CGFloat v21 = v28;
    }
    unint64_t v29 = BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)v9);
    FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v12, v15, v29, v24, v23, v22, v21, *(double *)&v82, v17, v18, v19);
    float v5 = v16;
  }
  if (*(float *)(a1 + 192) != 0.0)
  {
    objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, *v5, 0), "objectForKeyedSubscript:", *v6), "floatValue");
    *(float *)&double v31 = v30 * *(float *)(a1 + 192);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v31), *v7);
  }
  BWSampleBufferSetAttachedMedia(a2, 0x1EFA74420, (uint64_t)v9);
  uint64_t v32 = *(void *)(a1 + 120);
  if (v32)
  {
    uint64_t v33 = (const void *)[a3 newSampleBufferSatisfyingRequirement:v32 withPropagationSampleBuffer:a2];
    if (!v33)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_43;
    }
    BWSampleBufferSetAttachedMedia(a2, 0x1EFA74440, (uint64_t)v33);
  }
  else
  {
    uint64_t v33 = 0;
  }
  uint64_t v35 = *(void *)(a1 + 112);
  long long v69 = v33;
  long long v70 = v9;
  if (!v35)
  {
    uint64_t v34 = v7;
    CFTypeRef cf = 0;
LABEL_19:
    int v37 = *(_DWORD *)(a1 + 24);
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obj = *(id *)(a1 + 128);
    uint64_t v38 = [obj countByEnumeratingWithState:&v78 objects:v86 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      unsigned int v75 = (unsigned __int16)(v37 - 2) | 0x10000;
      uint64_t v76 = *(void *)v79;
      uint64_t v74 = *MEMORY[0x1E4F55BC0];
      v40 = v6;
      CFStringRef v41 = (const __CFString *)*MEMORY[0x1E4F55B88];
      CFStringRef v42 = *v5;
      double v43 = *MEMORY[0x1E4F1DB20];
      double v44 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v45 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v46 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      uint64_t v73 = *v40;
      uint64_t v72 = *v34;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v79 != v76) {
            objc_enumerationMutation(obj);
          }
          uint64_t v48 = [*(id *)(*((void *)&v78 + 1) + 8 * i) intValue];
          uint64_t v49 = mv2ip_inputAttachedMediaKeyForMattingOutputType(v48);
          uint64_t v50 = mv2ip_outputAttachedMediaKeyForMattingOutputType(v48);
          BWSampleBufferRemoveAttachedMedia(a2, v49);
          uint64_t v51 = objc_msgSend(a3, "newSampleBufferSatisfyingRequirement:withPropagationSampleBuffer:", objc_msgSend(*(id *)(a1 + 144), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v48)), a2);
          if (v51)
          {
            long long v52 = (void *)v51;
            uint64_t v84 = v74;
            uint64_t v85 = [NSNumber numberWithUnsignedInt:v75];
            CMSetAttachment(v52, v41, (CFTypeRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1], 1u);
            id v53 = BWCMSampleBufferCopyReattachAndReturnMutableMetadata(v52);
            if (*(unsigned char *)(a1 + 33))
            {
              unint64_t v54 = BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)a2);
              CMGetAttachment(a2, v42, 0);
              long long v55 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
              long long v82 = *MEMORY[0x1E4F1DB20];
              long long v83 = v55;
              CGFloat v56 = v43;
              CGFloat v57 = v44;
              CGFloat v58 = v45;
              CGFloat v59 = v46;
              if (FigCFDictionaryGetCGRectIfPresent())
              {
                FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v82, *((double *)&v82 + 1), *(double *)&v83, *((double *)&v83 + 1));
                CGFloat v56 = v60;
                CGFloat v57 = v61;
                CGFloat v58 = v62;
                CGFloat v59 = v63;
              }
              unint64_t v64 = BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)v52);
              FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v53, v54, v64, v56, v57, v58, v59, v43, v44, v45, v46);
            }
            if (*(float *)(a1 + 192) != 0.0)
            {
              objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a2, v42, 0), "objectForKeyedSubscript:", v73), "floatValue");
              *(float *)&double v66 = v65 * *(float *)(a1 + 192);
              objc_msgSend(v53, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v66), v72);
            }
            BWSampleBufferSetAttachedMedia(a2, (uint64_t)v50, (uint64_t)v52);
            CFRelease(v52);
          }
        }
        uint64_t v39 = [obj countByEnumeratingWithState:&v78 objects:v86 count:16];
      }
      while (v39);
    }
    uint64_t v33 = v69;
    uint64_t v9 = v70;
    long long v67 = cf;
    if (!v70) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  uint64_t v36 = [a3 newSampleBufferSatisfyingRequirement:v35 withPropagationSampleBuffer:a2];
  if (v36)
  {
    uint64_t v34 = v7;
    CFTypeRef cf = (CFTypeRef)v36;
    BWSampleBufferSetAttachedMedia(a2, 0x1EFA745C0, v36);
    goto LABEL_19;
  }
LABEL_43:
  long long v67 = 0;
LABEL_35:
  CFRelease(v9);
LABEL_36:
  if (v33) {
    CFRelease(v33);
  }
  if (v67) {
    CFRelease(v67);
  }
}

- (BOOL)allowsAsyncPropagation
{
  return 1;
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  int result = -[BWMattingV2InferenceProvider _loadMattingProcessor]((uint64_t)self);
  if (!result)
  {
    float v5 = -[BWMattingV2InferenceProvider _processorOptions](self);
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

@end