@interface ATXHeroAndClipDebugSampler
- (ATXHeroAndClipDebugSampler)initWithSampleIndices:(id)a3;
- (id)sampleEvents:(id)a3 numToSample:(unint64_t)a4;
@end

@implementation ATXHeroAndClipDebugSampler

- (ATXHeroAndClipDebugSampler)initWithSampleIndices:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXHeroAndClipDebugSampler;
  v6 = [(ATXHeroAndClipDebugSampler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_indicesToSample, a3);
  }

  return v7;
}

- (id)sampleEvents:(id)a3 numToSample:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = self->_indicesToSample;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v8);
        }
        unint64_t v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "unsignedIntegerValue", (void)v18);
        if (v14 < [v6 count] && v11 < a4)
        {
          v16 = [v6 objectAtIndexedSubscript:v14];
          [v7 addObject:v16];

          ++v11;
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end