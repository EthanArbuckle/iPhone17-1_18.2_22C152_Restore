@interface BWVisionInferenceStorage
+ (void)initialize;
- (BWVisionInferenceStorage)initWithRequirementsNeedingPixelBuffers:(id)a3 requirementsNeedingPixelBufferPools:(id)a4;
- (id)newMetadataDictionarySatisfyingRequirement:(id)a3;
- (id)requestForRequirement:(id)a3;
- (opaqueCMSampleBuffer)newSampleBufferSatisfyingRequirement:(id)a3 withPropagationSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)dealloc;
- (void)removeRequest:(id)a3;
- (void)setRequest:(id)a3 forRequirement:(id)a4;
@end

@implementation BWVisionInferenceStorage

- (BWVisionInferenceStorage)initWithRequirementsNeedingPixelBuffers:(id)a3 requirementsNeedingPixelBufferPools:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)BWVisionInferenceStorage;
  v4 = [(BWInferenceProviderStorage *)&v6 initWithRequirementsNeedingPixelBuffers:a3 requirementsNeedingPixelBufferPools:a4];
  if (v4) {
    v4->_requestsByRequirement = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v4;
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWVisionInferenceStorage;
  [(BWInferenceProviderStorage *)&v3 dealloc];
}

- (id)requestForRequirement:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_requestsByRequirement objectForKeyedSubscript:a3];
}

- (void)setRequest:(id)a3 forRequirement:(id)a4
{
}

- (void)removeRequest:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = (void *)-[NSMutableDictionary allKeysForObject:](self->_requestsByRequirement, "allKeysForObject:", a3, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableDictionary *)self->_requestsByRequirement removeObjectForKey:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (opaqueCMSampleBuffer)newSampleBufferSatisfyingRequirement:(id)a3 withPropagationSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  return 0;
}

- (id)newMetadataDictionarySatisfyingRequirement:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v6 = (void *)[a3 metadataKeys];
  id v7 = [(BWVisionInferenceStorage *)self requestForRequirement:a3];
  if (v7)
  {
    uint64_t v8 = [v7 results];
    if (v8) {
      long long v9 = (void *)v8;
    }
    else {
      long long v9 = (void *)MEMORY[0x1E4F1CBF0];
    }
    int v10 = [a3 mappingOption];
    int v11 = v10;
    if (!v10 || v10 == 2)
    {
      unint64_t v12 = [v6 count];
      unint64_t v13 = [v9 count];
      if (v12 >= v13) {
        unint64_t v14 = v13;
      }
      else {
        unint64_t v14 = v12;
      }
      if (v14)
      {
        unint64_t v15 = v13;
        for (uint64_t i = 0; i != v14; ++i)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v9, "objectAtIndexedSubscript:", i), objc_msgSend(v6, "objectAtIndexedSubscript:", i));
        if (v11 == 2 && v12 < v15)
        {
          uint64_t v17 = [v6 objectAtIndexedSubscript:v14 - 1];
          uint64_t v18 = [v5 objectForKey:v17];
          v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v18, 0);
          do
            objc_msgSend(v19, "addObject:", objc_msgSend(v9, "objectAtIndexedSubscript:", v14++));
          while (v15 != v14);
          [v5 setObject:v19 forKeyedSubscript:v17];
        }
      }
    }
    else if (v10 == 1)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, objc_msgSend(v6, "firstObject"));
    }
  }
  return v5;
}

@end