@interface BWInferenceSchedulerScaler
- (BOOL)allowsAsyncPropagation;
- (BOOL)mustExecuteWhenAllowed;
- (BWInferenceExecutable)executable;
- (BWInferenceExtractable)extractable;
- (BWInferencePropagatable)propagatable;
- (BWInferenceSchedulerScaler)initWithInputRequirement:(id)a3 derivedFromRequirement:(id)a4 outputRequirements:(id)a5 options:(unint64_t)a6;
- (BWInferenceSubmittable)submittable;
- (NSArray)inputVideoRequirements;
- (NSArray)outputRequirements;
- (NSString)description;
- (id)newStorage;
- (id)preventionReasonWithSampleBuffer:(opaqueCMSampleBuffer *)a3 executionTime:(id *)a4;
- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6;
- (int)prepareForExecution;
- (int)prepareForSubmissionWithWorkQueue:(id)a3;
- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7;
- (int)type;
- (uint64_t)_newProviderForWithOptions:(uint64_t)a3 inputDerivedFromRequirement:;
- (void)dealloc;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
@end

@implementation BWInferenceSchedulerScaler

- (NSString)description
{
  v3 = [(BWInferenceVideoRequirement *)self->_inputRequirement videoFormat];
  v4 = objc_msgSend(-[NSArray firstObject](self->_outputRequirements, "firstObject"), "videoFormat");
  v19.receiver = self;
  v19.super_class = (Class)BWInferenceSchedulerScaler;
  v18 = [(BWInferenceSchedulerScaler *)&v19 description];
  v17 = [(BWInferenceMediaRequirement *)self->_inputRequirement attachedMediaKey];
  uint64_t v16 = [v4 width];
  uint64_t v5 = [v4 height];
  uint64_t v6 = [v4 pixelFormat] >> 24;
  uint64_t v7 = ([v4 pixelFormat] >> 16);
  uint64_t v8 = ((unsigned __int16)[v4 pixelFormat] >> 8);
  uint64_t v9 = [v4 pixelFormat];
  int v10 = [(BWInferenceVideoFormat *)v3 includesInvalidContent];
  if (v10 != [v4 includesInvalidContent]) {
    v11 = @", removing invalid region";
  }
  else {
    v11 = &stru_1EFA403E0;
  }
  uint64_t v12 = [(BWInferenceVideoFormat *)v3 cropDescriptor];
  uint64_t v13 = [v4 cropDescriptor];
  v14 = @", applying custom crop";
  if (v12 == v13) {
    v14 = &stru_1EFA403E0;
  }
  return [(NSString *)v18 stringByAppendingFormat:@" mediaKey: %@ output:%zux%zu (%c%c%c%c%@%@) provider:%p", v17, v16, v5, v6, v7, v8, v9, v11, v14, self->_provider];
}

- (NSArray)outputRequirements
{
  return self->_outputRequirements;
}

- (NSArray)inputVideoRequirements
{
  return (NSArray *)[(BWInferenceProvider *)self->_provider inputVideoRequirements];
}

- (BWInferenceSchedulerScaler)initWithInputRequirement:(id)a3 derivedFromRequirement:(id)a4 outputRequirements:(id)a5 options:(unint64_t)a6
{
  char v6 = a6;
  v12.receiver = self;
  v12.super_class = (Class)BWInferenceSchedulerScaler;
  int v10 = [(BWInferenceSchedulerScaler *)&v12 init];
  if (v10)
  {
    v10->_inputRequirement = (BWInferenceVideoRequirement *)a3;
    v10->_outputRequirements = (NSArray *)a5;
    v10->_provider = (BWInferenceProvider *)-[BWInferenceSchedulerScaler _newProviderForWithOptions:inputDerivedFromRequirement:]((uint64_t)v10, v6, (uint64_t)a4);
  }
  return v10;
}

- (uint64_t)_newProviderForWithOptions:(uint64_t)a3 inputDerivedFromRequirement:
{
  if (!a1) {
    return 0;
  }
  if (FigDepthBytesPerPixelForDepthFormat(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "pixelFormat")))
  {
    char v6 = [[BWInferenceDepthScalingProvider alloc] initWithOutputRequirements:*(void *)(a1 + 16) configuration:0];
    [(BWInferenceDepthScalingProvider *)v6 setInputRequirement:*(void *)(a1 + 8)];
    return (uint64_t)v6;
  }
  uint64_t v8 = [BWInferenceVideoScalingProvider alloc];
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  return (uint64_t)[(BWInferenceVideoScalingProvider *)v8 initWithInputRequirement:v9 derivedFromRequirement:a3 outputRequirements:v10 enableFencing:a2 & 1];
}

- (id)preventionReasonWithSampleBuffer:(opaqueCMSampleBuffer *)a3 executionTime:(id *)a4
{
  if (![(BWInferenceProvider *)self->_provider conformsToProtocol:&unk_1EFB10F68]) {
    return 0;
  }
  provider = self->_provider;
  long long v9 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  return (id)[(BWInferenceProvider *)provider preventionReasonWithSampleBuffer:a3 executionTime:&v9];
}

- (BOOL)mustExecuteWhenAllowed
{
  return 0;
}

- (int)type
{
  return [(BWInferenceProvider *)self->_provider type];
}

- (BWInferencePropagatable)propagatable
{
  if ([(BWInferenceProvider *)self->_provider propagatable]) {
    return (BWInferencePropagatable *)self;
  }
  else {
    return 0;
  }
}

- (id)newStorage
{
  return (id)[(BWInferenceProvider *)self->_provider newStorage];
}

- (BWInferenceSubmittable)submittable
{
  if ([(BWInferenceProvider *)self->_provider submittable]) {
    return (BWInferenceSubmittable *)self;
  }
  else {
    return 0;
  }
}

- (int)prepareForExecution
{
  v2 = (void *)[(BWInferenceProvider *)self->_provider executable];
  return [v2 prepareForExecution];
}

- (BWInferenceExecutable)executable
{
  if ([(BWInferenceProvider *)self->_provider executable]) {
    return (BWInferenceExecutable *)self;
  }
  else {
    return 0;
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerScaler;
  [(BWInferenceSchedulerScaler *)&v3 dealloc];
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  provider = self->_provider;
  if (!provider) {
    return -31701;
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a5;
  return [(BWInferenceProvider *)provider submitForSampleBuffer:a3 usingStorage:a4 withSubmissionTime:&v9 workQueue:a6 completionHandler:a7];
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  v4 = (void *)[(BWInferenceProvider *)self->_provider submittable];
  return [v4 prepareForSubmissionWithWorkQueue:a3];
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  provider = self->_provider;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a5;
  return [(BWInferenceProvider *)provider executeOnSampleBuffer:a3 usingStorage:a4 withExecutionTime:&v8 completionHandler:a6];
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
}

- (BOOL)allowsAsyncPropagation
{
  return self->_allowsAsyncPropagation;
}

@end