@interface BWInferenceSampleBufferPropagator
- (BOOL)allowsAsyncPropagation;
- (BWInferenceSampleBufferPropagator)initWithVideoRequirements:(id)a3 cloneRequirements:(id)a4 metadataRequirements:(id)a5;
- (void)dealloc;
- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6;
@end

@implementation BWInferenceSampleBufferPropagator

- (BWInferenceSampleBufferPropagator)initWithVideoRequirements:(id)a3 cloneRequirements:(id)a4 metadataRequirements:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)BWInferenceSampleBufferPropagator;
  v8 = [(BWInferenceSampleBufferPropagator *)&v10 init];
  if (v8)
  {
    v8->_videoRequirements = (NSArray *)[a3 copy];
    v8->_cloneVideoRequirements = (NSArray *)[a4 copy];
    v8->_metadataRequirements = (NSArray *)[a5 copy];
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSampleBufferPropagator;
  [(BWInferenceSampleBufferPropagator *)&v3 dealloc];
}

- (void)propagateInferenceResultsToInferenceDictionary:(id)a3 usingStorage:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 propagationSampleBuffer:(opaqueCMSampleBuffer *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  videoRequirements = self->_videoRequirements;
  uint64_t v11 = [(NSArray *)videoRequirements countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(videoRequirements);
        }
        v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v16 = (const void *)[a4 newSampleBufferSatisfyingRequirement:v15 withPropagationSampleBuffer:a6];
        BWSampleBufferSetAttachedMedia(a6, [v15 attachedMediaKey], (uint64_t)v16);
        if (v16) {
          CFRelease(v16);
        }
      }
      uint64_t v12 = [(NSArray *)videoRequirements countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v12);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  cloneVideoRequirements = self->_cloneVideoRequirements;
  uint64_t v18 = [(NSArray *)cloneVideoRequirements countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(cloneVideoRequirements);
        }
        v22 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        v23 = (const void *)[a4 newSampleBufferSatisfyingCloneRequirement:v22];
        BWSampleBufferSetAttachedMedia(a6, [v22 attachedMediaKey], (uint64_t)v23);
        if (v23) {
          CFRelease(v23);
        }
      }
      uint64_t v19 = [(NSArray *)cloneVideoRequirements countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v19);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  metadataRequirements = self->_metadataRequirements;
  uint64_t v25 = [(NSArray *)metadataRequirements countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v31 != v27) {
          objc_enumerationMutation(metadataRequirements);
        }
        v29 = (void *)[a4 newMetadataDictionarySatisfyingRequirement:*(void *)(*((void *)&v30 + 1) + 8 * k)];
        [a3 addEntriesFromDictionary:v29];
      }
      uint64_t v26 = [(NSArray *)metadataRequirements countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v26);
  }
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
}

- (BOOL)allowsAsyncPropagation
{
  return 0;
}

@end