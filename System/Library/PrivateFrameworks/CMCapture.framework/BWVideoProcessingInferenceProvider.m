@interface BWVideoProcessingInferenceProvider
+ (void)initialize;
- (BOOL)allowsAsyncPropagation;
- (BWInferenceExtractable)extractable;
- (BWVideoProcessingInferenceProvider)initWithType:(int)a3 analysisType:(unint64_t)a4 executionTarget:(int)a5 schedulerPriority:(unsigned int)a6 preventionReasons:(id)a7 resourceProvider:(id)a8;
- (NSArray)cloneVideoRequirements;
- (NSArray)inputMetadataRequirements;
- (NSArray)inputVideoRequirements;
- (NSArray)outputMetadataRequirements;
- (NSArray)outputVideoRequirements;
- (NSSet)preventionReasons;
- (id)bindOutputMetadataKeys:(id)a3;
- (id)bindVideoInputFromAttachedMediaUsingKey:(id)a3 preparedByAttachedMediaKey:(id)a4 withVideoFormatProvider:(id)a5;
- (id)newStorage;
- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6;
- (int)executionTarget;
- (int)prepareForExecution;
- (int)prepareForSubmissionWithWorkQueue:(id)a3;
- (int)prewarmUsingLimitedMemory:(BOOL)a3;
- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7;
- (int)type;
- (unsigned)allowedPixelBufferCompressionDirection;
- (void)dealloc;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
@end

@implementation BWVideoProcessingInferenceProvider

- (NSArray)outputVideoRequirements
{
  return &self->_outputVideoRequirements->super;
}

- (NSArray)inputVideoRequirements
{
  return &self->_inputVideoRequirements->super;
}

- (NSArray)cloneVideoRequirements
{
  return &self->_cloneVideoRequirements->super;
}

- (unsigned)allowedPixelBufferCompressionDirection
{
  return +[BWInferenceEngine allowedBufferCompressionDirectionForExecutionTarget:self->_executionTarget];
}

- (BWVideoProcessingInferenceProvider)initWithType:(int)a3 analysisType:(unint64_t)a4 executionTarget:(int)a5 schedulerPriority:(unsigned int)a6 preventionReasons:(id)a7 resourceProvider:(id)a8
{
  v15.receiver = self;
  v15.super_class = (Class)BWVideoProcessingInferenceProvider;
  v12 = [(BWVideoProcessingInferenceProvider *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_type = a3;
    v12->_executionTarget = a5;
    v12->_preventionReasons = (NSSet *)[a7 copy];
    v13->_analysisType = a4;
    v13->_inputVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v13->_outputVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v13->_cloneVideoRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v13->_inputMetadataRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v13->_outputMetadataRequirements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v13;
}

- (id)bindVideoInputFromAttachedMediaUsingKey:(id)a3 preparedByAttachedMediaKey:(id)a4 withVideoFormatProvider:(id)a5
{
  v6 = [[BWInferenceLazyVideoRequirement alloc] initWithAttachedMediaKey:a3 preparedByAttachedMediaKey:a3 videoFormatProvider:a5];
  [(NSMutableArray *)self->_inputVideoRequirements addObject:v6];
  return v6;
}

- (id)bindOutputMetadataKeys:(id)a3
{
  v4 = [[BWInferenceMetadataRequirement alloc] initWithMetadataKeys:a3];
  [(NSMutableArray *)self->_outputMetadataRequirements addObject:v4];
  return v4;
}

+ (void)initialize
{
}

- (void)dealloc
{
  [(VCPCaptureAnalysisSession *)self->_vcpSession finalizeAnalysis];
  v3.receiver = self;
  v3.super_class = (Class)BWVideoProcessingInferenceProvider;
  [(BWVideoProcessingInferenceProvider *)&v3 dealloc];
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (id)newStorage
{
  objc_super v3 = [BWVideoProcessingInferenceStorage alloc];
  inputVideoRequirements = self->_inputVideoRequirements;
  outputVideoRequirements = self->_outputVideoRequirements;
  return [(BWVideoProcessingInferenceStorage *)v3 initWithRequirementsNeedingPixelBuffers:inputVideoRequirements requirementsNeedingPixelBufferPools:outputVideoRequirements];
}

- (int)prewarmUsingLimitedMemory:(BOOL)a3
{
  return 0;
}

- (int)prepareForExecution
{
  objc_super v3 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  VCPCaptureAnalysisSessionClass = (void *)getVCPCaptureAnalysisSessionClass();
  unint64_t analysisType = self->_analysisType;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v8[0] = *MEMORY[0x1E4F1DAB8];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  self->_vcpSession = (VCPCaptureAnalysisSession *)(id)[VCPCaptureAnalysisSessionClass analyzerForAnalysisTypes:analysisType withPreferredTransform:v8 properties:0];
  if (*v3 == 1) {
    kdebug_trace();
  }
  return 0;
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  VCPCaptureAnalysisSessionClass = (void *)getVCPCaptureAnalysisSessionClass();
  unint64_t analysisType = self->_analysisType;
  v19[0] = getVCPCaptureAnalysisDispatchQueuePropertyKey();
  v19[1] = @"turboMode";
  v20[0] = a3;
  v20[1] = MEMORY[0x1E4F1CC38];
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v16[0] = *MEMORY[0x1E4F1DAB8];
  v16[1] = v9;
  v16[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  v10 = (VCPCaptureAnalysisSession *)(id)[VCPCaptureAnalysisSessionClass analyzerForAnalysisTypes:analysisType withPreferredTransform:v16 properties:v8];
  self->_vcpSession = v10;
  if (!v10
    || (v11 = (void *)[(NSMutableArray *)self->_inputVideoRequirements firstObject],
        vcpSession = self->_vcpSession,
        v17[0] = @"frameWidth",
        uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend((id)objc_msgSend(v11, "videoFormat"), "width")), v17[1] = @"frameHeight", v18[0] = v13, v18[1] = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend((id)objc_msgSend(v11, "videoFormat"), "height")), -[VCPCaptureAnalysisSession prewarmWithProperties:](vcpSession, "prewarmWithProperties:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v18, v17, 2))))
  {
    int v14 = -31702;
  }
  else
  {
    int v14 = 0;
  }
  if (*v5 == 1) {
    kdebug_trace();
  }
  return v14;
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v10 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  uint64_t v11 = objc_msgSend(a4, "pixelBufferForRequirement:", -[NSMutableArray firstObject](self->_inputVideoRequirements, "firstObject"));
  if (v11)
  {
    uint64_t v12 = v11;
    memset(&v30, 0, sizeof(v30));
    CMSampleBufferGetPresentationTimeStamp(&v30, a3);
    memset(&v29, 0, sizeof(v29));
    CMSampleBufferGetDuration(&v29, a3);
    vcpSession = self->_vcpSession;
    CMTime v28 = v30;
    CMTime v27 = v29;
    uint64_t v14 = [(VCPCaptureAnalysisSession *)vcpSession analyzePixelBuffer:v12 withTimestamp:&v28 andDuration:&v27 properties:0 error:0];
    if (v14)
    {
      uint64_t v15 = v14;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      outputMetadataRequirements = self->_outputMetadataRequirements;
      uint64_t v17 = [(NSMutableArray *)outputMetadataRequirements countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v24 != v19) {
              objc_enumerationMutation(outputMetadataRequirements);
            }
            [a4 setDictionary:v15 forMetadataRequirement:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          }
          uint64_t v18 = [(NSMutableArray *)outputMetadataRequirements countByEnumeratingWithState:&v23 objects:v31 count:16];
        }
        while (v18);
      }
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v21 = 4294935577;
    }
  }
  else
  {
    uint64_t v21 = 4294935584;
  }
  if (*v10 == 1) {
    kdebug_trace();
  }
  (*((void (**)(id, uint64_t, BWVideoProcessingInferenceProvider *))a6 + 2))(a6, v21, self);
  return v21;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  uint64_t v11 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  uint64_t v12 = objc_msgSend(a4, "pixelBufferForRequirement:", -[NSMutableArray firstObject](self->_inputVideoRequirements, "firstObject"));
  if (v12)
  {
    memset(&v20, 0, sizeof(v20));
    CMSampleBufferGetPresentationTimeStamp(&v20, a3);
    memset(&v19, 0, sizeof(v19));
    CMSampleBufferGetDuration(&v19, a3);
    vcpSession = self->_vcpSession;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __120__BWVideoProcessingInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
    v18[3] = &unk_1E5C299F8;
    v18[4] = a4;
    v18[5] = self;
    v18[6] = a7;
    v18[7] = &v21;
    CMTime v17 = v20;
    CMTime v16 = v19;
    [(VCPCaptureAnalysisSession *)vcpSession analyzePixelBuffer:v12 withTimestamp:&v17 andDuration:&v16 properties:0 completion:v18];
  }
  else
  {
    *((_DWORD *)v22 + 6) = -31712;
    (*((void (**)(id, uint64_t, BWVideoProcessingInferenceProvider *))a7 + 2))(a7, 4294935584, self);
    if (*v11 == 1) {
      kdebug_trace();
    }
  }
  int v14 = *((_DWORD *)v22 + 6);
  _Block_object_dispose(&v21, 8);
  return v14;
}

uint64_t __120__BWVideoProcessingInferenceProvider_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = -31719;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v6 = (void *)a1[4];
    v7 = *(void **)(a1[5] + 56);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [v6 setDictionary:a3 forMetadataRequirement:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
  uint64_t result = (*(uint64_t (**)(void))(a1[6] + 16))();
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    return kdebug_trace();
  }
  return result;
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  outputMetadataRequirements = self->_outputMetadataRequirements;
  uint64_t v11 = [(NSMutableArray *)outputMetadataRequirements countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(outputMetadataRequirements);
        }
        long long v15 = (void *)[a4 newMetadataDictionarySatisfyingRequirement:*(void *)(*((void *)&v16 + 1) + 8 * v14)];
        [a3 addEntriesFromDictionary:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)outputMetadataRequirements countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
  if (*v9 == 1) {
    kdebug_trace();
  }
}

- (BOOL)allowsAsyncPropagation
{
  return 0;
}

- (int)type
{
  return self->_type;
}

- (int)executionTarget
{
  return self->_executionTarget;
}

- (NSSet)preventionReasons
{
  return self->_preventionReasons;
}

- (NSArray)inputMetadataRequirements
{
  return &self->_inputMetadataRequirements->super;
}

- (NSArray)outputMetadataRequirements
{
  return &self->_outputMetadataRequirements->super;
}

@end