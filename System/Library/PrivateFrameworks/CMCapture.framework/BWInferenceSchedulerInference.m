@interface BWInferenceSchedulerInference
+ (void)initialize;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)previousExecutionTime;
- (BOOL)mustExecuteWhenAllowed;
- (BWInferenceExecutable)executable;
- (BWInferenceExtractable)extractable;
- (BWInferencePropagatable)propagatable;
- (BWInferenceProvider)provider;
- (BWInferenceSchedulerInference)initWithInferenceRequirement:(id)a3;
- (BWInferenceSubmittable)submittable;
- (NSString)description;
- (float)maximumFramesPerSecond;
- (id)newStorage;
- (id)preventionReasonWithSampleBuffer:(opaqueCMSampleBuffer *)a3 executionTime:(id *)a4;
- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6;
- (int)inferenceType;
- (int)prepareForExecution;
- (int)prepareForSubmissionWithWorkQueue:(id)a3;
- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7;
- (int)type;
- (unint64_t)identifier;
- (unsigned)priority;
- (void)dealloc;
@end

@implementation BWInferenceSchedulerInference

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerInference;
  return [(NSString *)[(BWInferenceSchedulerInference *)&v3 description] stringByAppendingFormat:@" provider: %@", self->_provider];
}

- (BWInferenceSchedulerInference)initWithInferenceRequirement:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)BWInferenceSchedulerInference;
  v4 = [(BWInferenceSchedulerInference *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_identifier = atomic_fetch_add(&nextUniqueIdentifier, 1uLL);
    v6 = (BWInferenceProvider *)(id)[a3 provider];
    v5->_provider = v6;
    if ([(BWInferenceProvider *)v6 conformsToProtocol:&unk_1EFB10F68]) {
      v7 = v5->_provider;
    }
    else {
      v7 = 0;
    }
    v5->_preventable = v7;
    [(BWInferenceProvider *)v7 mustExecuteWhenAllowed];
    v5->_mustExecuteWhenAllowed = 1;
    v8 = (void *)[a3 configuration];
    v5->_priority = [v8 priority];
    [v8 maximumFramesPerSecond];
    v5->_maximumFramesPerSecond = v9;
    v5->_propagatesFrameRatePrevention = [v8 propagatesFrameRatePrevention];
    atomic_store(0, (unint64_t *)&v5->_previousExecutionTimeInSeconds);
    v5->_inferenceType = [v8 inferenceType];
  }
  return v5;
}

- (int)type
{
  return [(BWInferenceProvider *)self->_provider type];
}

- (BWInferencePropagatable)propagatable
{
  v2 = [(BWInferenceSchedulerInference *)self provider];
  return (BWInferencePropagatable *)[(BWInferenceProvider *)v2 propagatable];
}

- (int)inferenceType
{
  return self->_inferenceType;
}

- (id)newStorage
{
  v2 = [(BWInferenceSchedulerInference *)self provider];
  return (id)[(BWInferenceProvider *)v2 newStorage];
}

- (BWInferenceExecutable)executable
{
  if ([(BWInferenceProvider *)[(BWInferenceSchedulerInference *)self provider] executable]) {
    return (BWInferenceExecutable *)self;
  }
  else {
    return 0;
  }
}

- (int)prepareForSubmissionWithWorkQueue:(id)a3
{
  v5 = [(BWInferenceSchedulerInference *)self submittable];
  if (v5)
  {
    v6 = (void *)[(BWInferenceProvider *)[(BWInferenceSchedulerInference *)self provider] submittable];
    LODWORD(v5) = [v6 prepareForSubmissionWithWorkQueue:a3];
  }
  return (int)v5;
}

- (BWInferenceSubmittable)submittable
{
  if ([(BWInferenceProvider *)[(BWInferenceSchedulerInference *)self provider] submittable]) {
    return (BWInferenceSubmittable *)self;
  }
  else {
    return 0;
  }
}

- (BWInferenceProvider)provider
{
  return self->_provider;
}

- (int)prepareForExecution
{
  v2 = (void *)[(BWInferenceProvider *)[(BWInferenceSchedulerInference *)self provider] executable];
  return [v2 prepareForExecution];
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerInference;
  [(BWInferenceSchedulerInference *)&v3 dealloc];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)previousExecutionTime
{
  Float64 v3 = COERCE_DOUBLE(atomic_load((unint64_t *)&self->_previousExecutionTimeInSeconds));
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v3, 1000000000);
}

- (BOOL)mustExecuteWhenAllowed
{
  return self->_mustExecuteWhenAllowed;
}

- (id)preventionReasonWithSampleBuffer:(opaqueCMSampleBuffer *)a3 executionTime:(id *)a4
{
  memset(&v19, 0, sizeof(v19));
  if (self) {
    [(BWInferenceSchedulerInference *)self previousExecutionTime];
  }
  if (self->_maximumFramesPerSecond > 0.00000011921
    && (v19.flags & 1) != 0
    && (a4->var2 & 1) != 0
    && (CMTime lhs = (CMTime)*a4,
        CMTime v16 = v19,
        CMTimeSubtract(&time, &lhs, &v16),
        float v7 = 0.949999999 / CMTimeGetSeconds(&time),
        self->_maximumFramesPerSecond < v7))
  {
    v15 = (id *)&BWInferencePreventionReasonFrameRate;
    if (!self->_propagatesFrameRatePrevention) {
      v15 = (id *)BWInferencePreventionReasonScheduling;
    }
    return *v15;
  }
  else
  {
    v8 = (void *)[(BWInferenceProvider *)self->_provider preventionReasons];
    float v9 = @"BlurryInputBuffer";
    if (![v8 containsObject:@"BlurryInputBuffer"]
      || ((v10 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0),
           int v11 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F53BF8]), "intValue"),
           objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E4F53EE0]), "intValue") == 1)? (BOOL v12 = v11 == 4): (BOOL v12 = 1), v12))
    {
      float v9 = @"FilteredInputBuffer";
      if (![v8 containsObject:@"FilteredInputBuffer"]
        || (objc_msgSend((id)CMGetAttachment(a3, @"FiltersApplied", 0), "BOOLValue") & 1) == 0)
      {
        preventable = self->_preventable;
        if (preventable)
        {
          CMTime lhs = (CMTime)*a4;
          return (id)[(BWInferencePreventable *)preventable preventionReasonWithSampleBuffer:a3 executionTime:&lhs];
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return v9;
}

- (BWInferenceExtractable)extractable
{
  return 0;
}

- (int)executeOnSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withExecutionTime:(id *)a5 completionHandler:(id)a6
{
  int v11 = (void *)[(BWInferenceProvider *)[(BWInferenceSchedulerInference *)self provider] executable];
  if (!v11) {
    return -31710;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __104__BWInferenceSchedulerInference_executeOnSampleBuffer_usingStorage_withExecutionTime_completionHandler___block_invoke;
  v15[3] = &unk_1E5C299D0;
  long long v16 = *(_OWORD *)&a5->var0;
  int64_t var3 = a5->var3;
  v15[4] = self;
  v15[5] = a6;
  long long v13 = *(_OWORD *)&a5->var0;
  int64_t v14 = a5->var3;
  return [v11 executeOnSampleBuffer:a3 usingStorage:a4 withExecutionTime:&v13 completionHandler:v15];
}

uint64_t __104__BWInferenceSchedulerInference_executeOnSampleBuffer_usingStorage_withExecutionTime_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (atomic_ullong *)(*(void *)(a1 + 32) + 48);
  CMTime v6 = *(CMTime *)(a1 + 48);
  atomic_exchange(v4, COERCE_UNSIGNED_INT64(CMTimeGetSeconds(&v6)));
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, *(void *)(a1 + 32));
  }
  return result;
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  long long v13 = (void *)[(BWInferenceProvider *)[(BWInferenceSchedulerInference *)self provider] submittable];
  if (![v13 submittable]) {
    return -31710;
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __115__BWInferenceSchedulerInference_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke;
  v17[3] = &unk_1E5C299D0;
  long long v18 = *(_OWORD *)&a5->var0;
  int64_t var3 = a5->var3;
  v17[4] = self;
  v17[5] = a7;
  long long v15 = *(_OWORD *)&a5->var0;
  int64_t v16 = a5->var3;
  return [v13 submitForSampleBuffer:a3 usingStorage:a4 withSubmissionTime:&v15 workQueue:a6 completionHandler:v17];
}

uint64_t __115__BWInferenceSchedulerInference_submitForSampleBuffer_usingStorage_withSubmissionTime_workQueue_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (atomic_ullong *)(*(void *)(a1 + 32) + 48);
  CMTime v6 = *(CMTime *)(a1 + 48);
  atomic_exchange(v4, COERCE_UNSIGNED_INT64(CMTimeGetSeconds(&v6)));
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, *(void *)(a1 + 32));
  }
  return result;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unsigned)priority
{
  return self->_priority;
}

- (float)maximumFramesPerSecond
{
  return self->_maximumFramesPerSecond;
}

@end