@interface BWFusionTrackerEspressoInferenceProvider
- (BOOL)mustExecuteWhenAllowed;
- (id)preventionReasonWithSampleBuffer:(opaqueCMSampleBuffer *)a3 executionTime:(id *)a4;
- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7;
- (int64_t)operation;
- (void)setOperation:(int64_t)a3;
@end

@implementation BWFusionTrackerEspressoInferenceProvider

- (BOOL)mustExecuteWhenAllowed
{
  return 1;
}

- (id)preventionReasonWithSampleBuffer:(opaqueCMSampleBuffer *)a3 executionTime:(id *)a4
{
  return preventionReasonWithSampleBuffer(a3, self->_operation);
}

- (int)submitForSampleBuffer:(opaqueCMSampleBuffer *)a3 usingStorage:(id)a4 withSubmissionTime:(id *)a5 workQueue:(id)a6 completionHandler:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v10 = (void *)CMGetAttachment(a3, @"FusionTrackerInput", 0);
  if (v10) {
    v11 = (void *)[v10 highPriorityTrackerState];
  }
  else {
    v11 = 0;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v12 = [(BWEspressoInferenceProvider *)self inputMetadataRequirements];
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v18 = objc_msgSend((id)objc_msgSend(v11, "sessionStorage"), "objectForKey:", objc_msgSend((id)objc_msgSend(v17, "metadataKeys"), "objectAtIndexedSubscript:", 0));
        if (!v18)
        {
          int v19 = -31714;
          (*((void (**)(id, uint64_t, BWFusionTrackerEspressoInferenceProvider *))a7 + 2))(a7, 4294935582, self);
          return v19;
        }
        objc_msgSend(v18, "getValue:", objc_msgSend(a4, "tensorForRequirement:", v17));
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)BWFusionTrackerEspressoInferenceProvider;
  long long v24 = *(_OWORD *)&a5->var0;
  int64_t var3 = a5->var3;
  return [(BWEspressoInferenceProvider *)&v26 submitForSampleBuffer:a3 usingStorage:a4 withSubmissionTime:&v24 workQueue:a6 completionHandler:a7];
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

@end