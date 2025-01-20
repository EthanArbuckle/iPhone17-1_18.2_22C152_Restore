@interface SASSpeechPartialResult(AssistantAdditions)
- (id)af_correctionContext;
- (id)af_tokens;
@end

@implementation SASSpeechPartialResult(AssistantAdditions)

- (id)af_tokens
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA48];
  v3 = [a1 tokens];
  v4 = objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = objc_msgSend(a1, "tokens", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "af_speechToken");
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)af_correctionContext
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 refId];

  if (v2)
  {
    uint64_t v6 = @"interactionId";
    v3 = [a1 refId];
    v7[0] = v3;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end