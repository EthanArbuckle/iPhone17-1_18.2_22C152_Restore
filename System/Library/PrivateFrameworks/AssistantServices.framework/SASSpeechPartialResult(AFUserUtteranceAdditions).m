@interface SASSpeechPartialResult(AFUserUtteranceAdditions)
- (AFUserUtterance)af_userUtteranceValue;
- (id)af_bestTextInterpretation;
@end

@implementation SASSpeechPartialResult(AFUserUtteranceAdditions)

- (id)af_bestTextInterpretation
{
  v1 = objc_msgSend(a1, "af_userUtteranceValue");
  v2 = [v1 bestTextInterpretation];

  return v2;
}

- (AFUserUtterance)af_userUtteranceValue
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA48];
  v3 = [a1 tokens];
  v4 = objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(a1, "tokens", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "af_speechToken");
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  v11 = [AFUserUtterance alloc];
  v12 = objc_msgSend(a1, "af_correctionContext");
  v13 = [(AFUserUtterance *)v11 initWithTokens:v4 correctionIdentifier:v12];

  return v13;
}

@end